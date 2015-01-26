#
# Cookbook Name:: yamco-app
# Recipe:: default
#
# Copyright 2014, Roundscope
#
# All rights reserved - Do Not Redistribute
include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'rvm::system'
node.default['nodejs']['version']       = "0.10.31"
node.default['nodejs']['npm']   = "1.4.27"
include_recipe "nodejs::install_from_source"
include_recipe "nodejs::npm"
include_recipe 'roundscope::local_hostname'
include_recipe 'roundscope::knockd'
include_recipe 'roundscope::iptables'
include_recipe 'roundscope::nginx_passenger'
include_recipe 'roundscope::deployuser'
include_recipe 'roundscope::deployrvm211'
include_recipe 'roundscope::imagemagick'
node.default['app_name'] = 'yamco-app'
include_recipe 'roundscope::app_dirs'
node.default['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::bower"
node.default['postgresql']['version'] = '9.3'
node.default['postgresql']['pg_hba'] = [{:comment => '# yamco user config',:type => 'local', :db => 'all',
                                         :user => 'yamco', :method => 'password'}]
include_recipe 'postgresql::server'
include_recipe 'postgresql::server_debian'

execute 'add yamco user to postgres' do
  command "su - postgres -c \"psql -c \\\"create role yamco with createdb login password '#{node['database']['password']}'\\\"\""
  not_if "su - postgres -c \"psql -c \\\"select * from pg_user where usename = 'yamco'\\\"\"| grep 'yamco'"
end

execute "install ember-cli@0.0.36" do
  command 'su - -c "npm install -g ember-cli@0.0.36"'
    not_if "npm list -g | grep ember-cli"
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

file "/etc/nginx/sites-enabled/000-default" do
  action :delete
end

link "/etc/nginx/sites-enabled/yamco-app.conf" do
    to "/usr/local/etc/chef-sysconf/current/yamco-app/nginx/yamco-app.conf"
end

link "/etc/nginx/nginx.conf" do
    to "/usr/local/etc/chef-sysconf/current/yamco-app/nginx/nginx.conf"
end

service "nginx" do
  action :restart
end

directory "/var/www/#{node['app_name']}/shared/uploads" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/cdn" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

link "/var/www/#{node['app_name']}/shared/uploads/" do
    to "/var/www/#{node['app_name']}/cdn/uploads"
end

directory "/var/www/#{node['app_name']}/shared/yamco-app/node_modules" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/yamco-app/bower_components" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/yamco-pages/node_modules" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/yamco-pages/bower_components" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end
