#
# Cookbook Name:: roundscope
# Recipe:: nginx production config deploy 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/root/.ssh/config" do
  source "gitrsm/config"
    mode 0600
end
    
cookbook_file "/root/.ssh/rsm.pem" do
      source "gitrsm/rsm.pem"
        mode 0600
end

git "/home/deploy/chef-sysconf" do
    action :export
    repository "git@github.com:roundscope/chef-sysconf.git"
    reference "production"
end

file "/root/.ssh/config" do
  action :delete
end
  
file "/root/.ssh/rsm.pem" do
    action :delete
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

