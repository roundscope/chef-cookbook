#
# Cookbook Name:: roscredit app nginx service recipe
# Recipe:: roscredit::nginx
#
# Copyright 2013, Rounscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "nginx"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::sshd_conf"
node.default['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::local_hostname"
include_recipe "roundscope::knockd"
include_recipe "roundscope::iptables"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

file "/etc/nginx/sites-enabled/000-default" do
  action :delete
end

link "/etc/nginx/sites-available/roscredit-app.conf" do
    to "/usr/local/etc/chef-sysconf/current/roscredit-app/nginx/sites-available/roscredit-app.conf"
end

link "/etc/nginx/sites-enabled/roscredit-app.conf" do
    to "/usr/local/etc/chef-sysconf/current/roscredit-app/nginx/sites-available/roscredit-app.conf"
end

service "nginx" do
  action :restart
end
