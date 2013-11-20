#
# Cookbook Name:: roskredit-staging
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "mysqld"
include_recipe "nginx"
include_recipe "rvm"
include_recipe "roundscope::libmysql"
include_recipe "roundscope::redis"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::deployrvm"
include_recipe "roundscope::sshd_conf"
node.override['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::unicorn"

service "nginx" do
  action :restart
end

file "/etc/nginx/sites-available/default" do
  action :delete
end

link "/etc/nginx/sites-available/roscredit-app.conf" do
    to "/usr/local/etc/chef-sysconf/current/roscredit-app/nginx/sites-available/roscredit-app.conf"
end

directory "/var/www/roscredit-app/" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0777
end

directory "/var/www/roscredit-app/releases" do
  action :create
  recursive true
  owner "deploy"
  group "deploy"
  mode 0777
end


directory "/var/www/" do
  owner "deploy"
  group "deploy"
  mode 0777
end
