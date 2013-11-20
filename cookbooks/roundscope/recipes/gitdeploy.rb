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

deploy_revision node['rs_git']['dplace'] do
    repo "git@github.com:roundscope/#{node['rs_git']['reponame']}"
    revision node['rs_git']['branch']
    action :deploy
    symlink_before_migrate({})
    symlinks({})
    create_dirs_before_symlink([])
    purge_before_symlink([])
end

file "/root/.ssh/config" do
    action :delete
end

file "/root/.ssh/rsm.pem" do
    action :delete
end
