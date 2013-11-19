#
# Cookbook Name:: roundscope
# Recipe:: default
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
    reference "staging"
    user "deploy"
    group "deploy"
end

file "/root/.ssh/config" do
    action :delete
end

file "/root/.ssh/rsm.pem" do
    action :delete
end
