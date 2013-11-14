#
# Cookbook Name:: roundscope
# Recipe:: nginx 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

git "/home/deploy/chef-sysconf" do
    action :export
    repository "git@github.com:roundscope/chef-sysconf.git"
    reference "staging"
end

directory "/etc/nginx/conf.d/" do
    only_if { Dir.exists?("/etc/nginx/conf.d") }
    not_if { File.symlink?("/etc/nginx/conf.d") }
    action :delete
    recursive true
end

directory "/etc/nginx/sites-available" do
    only_if { Dir.exists?("/etc/nginx/sites-available") }
    not_if { File.symlink?("/etc/nginx/sites-available") }
    action :delete
    recursive true
end

link "/etc/nginx/conf.d" do
    to "/home/deploy/chef-sysconf/mapidy/nginx/conf.d/"
end

link "/etc/nginx/sites-available" do
    to "/home/deploy/chef-sysconf/mapidy/nginx/sites-available/"
end

service "nginx" do
  action :restart
end

