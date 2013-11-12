#
# Cookbook Name:: roundscope
# Recipe:: sshd_conf
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/ssh/sshd_config" do
  source "sshd/sshd_config"
  owner "root"
  mode 0644
  action :create
end

service "ssh" do
  action :restart
end
