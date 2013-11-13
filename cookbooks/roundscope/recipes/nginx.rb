#
# Cookbook Name:: roundscope
# Recipe:: nginx 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

remote_directory "/etc/nginx" do
    source "config/nginx"
    files_owner "root"
    mode 0755
end

service "nginx" do
  action :restart
end