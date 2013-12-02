#
# Cookbook Name:: roundscope
# Recipe:: knockd service recipe 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
package "knockd" do
  action :install
end

cookbook_file "/etc/default/knockd" do
    source "knockd/knockd"
    mode 0644
end

cookbook_file "/etc/knockd.conf" do
    source "knockd/knockd.conf"
    mode 0644
end

service "knockd" do
  action :restart
end
