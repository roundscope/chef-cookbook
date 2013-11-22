#
# Cookbook Name:: mapidy-staging
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "mysqld"
include_recipe "nginx"
include_recipe "build-essential"
include_recipe "rvm"
include_recipe "java"
include_recipe "elasticsearch"
include_recipe "erlang"
include_recipe "roundscope::couchdb"
include_recipe "roundscope::libmysql"
include_recipe "roundscope::redis"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::deployrvm"
include_recipe "roundscope::sshd_conf"
node.default['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::unicorn"

include_recipe "roundscope::nodejs"
include_recipe "roundscope::imagemagick"

include_recipe "roundscope::local_hostname"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

link "/usr/local/etc/elasticsearch/elasticsearch.yml" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/elasticsearch/elasticsearch.yml"
end

link "/etc/nginx/sites-available/mapidy.conf" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/nginx/sites-available/mapidy.conf"
end

link "/etc/nginx/sites-enabled/mapidy.conf" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/nginx/sites-available/mapidy.conf"
end


link "/etc/nginx/conf.d/cache.conf" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/nginx/conf.d/cache.conf"
end

link "/etc/nginx/conf.d/proxy.conf" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/nginx/conf.d/proxy.conf"
end

link "/etc/nginx/conf.d/upstreams.conf" do
    to "/usr/local/etc/chef-sysconf/current/mapidy/nginx/conf.d/upstreams.conf"
end

service "nginx" do
  action :restart
end


directory "/var/www/mapidy/" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/releases" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared/log" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared/pids" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared/sockets" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared/tmp" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/mapidy/shared/bundle" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end


directory "/var/www/" do
  owner "deploy"
  group "deploy"
  mode 0775
end
