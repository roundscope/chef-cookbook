#
# Cookbook Name:: yestattoo
# Recipe:: default
#
# Copyright 2014, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::sshd_conf"
node.default['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::local_hostname"
include_recipe "roundscope::knockd"
include_recipe "roundscope::iptables"
node.default['app-name'] = "yestattoo"
include_recipe "roundscope::shared-dirs"
include_recipe "nginx"
include_recipe "roundscope::deployrvm200"
include_recipe "roundscope::libmysql"

file "/etc/nginx/sites-enabled/default" do
    action :delete
end

file "/etc/nginx/sites-enabled/000-default" do
    action :delete
end

link "/etc/nginx/sites-available/#{node['app-name']}.conf" do
      to "/usr/local/etc/chef-sysconf/current/#{node['app-name']}/nginx/sites-available/#{node['app-name']}.conf"
end

link "/etc/nginx/sites-enabled/#{node['app-name']}.conf" do
      to "/usr/local/etc/chef-sysconf/current/#{node['app-name']}/nginx/sites-available/#{node['app-name']}.conf"
end

service "nginx" do
    action :restart
end
