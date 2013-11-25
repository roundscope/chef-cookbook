#
# Cookbook Name:: roskredit app ruby application server recipe
# Recipe:: default
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "mysqld"
include_recipe "rvm"
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

directory "/var/www/roscredit-app/" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/releases" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared/log" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared/pids" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared/sockets" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared/tmp" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0775
end

directory "/var/www/roscredit-app/shared/bundle" do
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
