#
# Cookbook Name:: Roundscope
# Recipe:: app dirs
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

directory "/var/www/#{node['app_name']}/" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/releases" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/log" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/pids" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/sockets" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/tmp" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/bundle" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/log" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/uploads" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/bundle" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/node_modules" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/#{node['app_name']}/shared/vendor" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/" do
  mode 0755
end
