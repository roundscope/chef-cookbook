#
# Cookbook Name:: roundscope
# Recipe:: deploy user 
#
# Copyright 2013, Roundscope 
#
# All rights reserved - Do Not Redistribute
#

group "deploy" do
  action :create
end

user "deploy" do
  comment "Our deploy user"
  action :create
  password "$6$UnGh1wpK$GalQ7Jzpx8GXuyZMW4IVsAX8G0sEM97PwEagu9JlAy/NpCLcJykF50OdWpzCumO.1Tkmj7IAKMPs60eeHErE31"
  gid "deploy"
  shell "/bin/bash"
  home "/home/deploy"
end

directory "/home/deploy" do
    owner "deploy"
    group "deploy"
    mode 0755
    action :create
end

remote_directory "/home/deploy/.ssh" do
  source "deployssh"
  owner "deploy"
  group "deploy"
  files_owner "deploy"
  files_group "deploy"
  mode 0750
end

cookbook_file "/home/deploy/.ssh/config" do
  source "gitrsm/config"
  mode 0600
  owner "deploy"
end

cookbook_file "/home/deploy/.ssh/rsm.pem" do
  source "gitrsm/rsm.pem"
  mode 0600
  owner "deploy"
end

group "sudo" do
  action :modify
  append true
  members "deploy"
end

