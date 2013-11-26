#
# Cookbook Name:: ememoria
# Recipe:: default
#
# Copyright 2013, Rounscope
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
include_recipe "roundscope::libmysql"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::deployrvm193"
include_recipe "roundscope::sshd_conf"
include_recipe "roundscope::unicorn"
include_recipe "roundscope::nodejs"
include_recipe "roundscope::imagemagick"
include_recipe "roundscope::local_hostname"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

directory "/var/www/ememoria/" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/releases" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared/log" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared/pids" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared/sockets" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared/tmp" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/ememoria/shared/bundle" do
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
