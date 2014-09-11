#
# Cookbook Name:: roundscope
# Recipe:: installing our rvm enviroment 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
group "rvm" do
    action :modify
    append true
    members "deploy"
end

execute "rvm install 2.1.1" do
    command "/usr/local/rvm/bin/rvm install 2.1.1"
    not_if 'su - -c "rvm list | grep 2.1.1"'
    cwd "/root"
end

execute "rvm --default use 2.1.1" do
    command 'su - deploy -c "rvm --default use ruby-2.1.1"'
    cwd "/home/deploy"
end
