#
# Cookbook Name:: ember-couchdb-kit
# Recipe:: default
#
# Copyright 2014, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "nginx"
include_recipe "build-essential"
node.default['rs_git']['branch']    = "staging"
include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::couchdb"

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

file "/etc/nginx/sites-enabled/000-default" do
  action :delete
end

link "/etc/nginx/sites-available/mapidy.conf" do
  to "/usr/local/etc/chef-sysconf/current/ember-couchdb-kit/nginx/ember-couchdb-kit.conf"
end

service "nginx" do
  action :restart
end
