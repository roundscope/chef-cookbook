#
# Cookbook Name:: roskredit javascript static app part recipe
# Recipe:: default
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::sshd_conf"
include_recipe "roundscope::local_hostname"
include_recipe "roundscope::knockd"
include_recipe "roundscope::iptables"
node.default['nodejs']['version']	= "0.10.24"
node.default['nodejs']['npm']	= "1.3.21"
include_recipe "nodejs::install_from_source"
include_recipe "nodejs::npm"
include_recipe "roundscope::grunt"
include_recipe "roundscope::bower"

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

