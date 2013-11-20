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

execute "rvm install 1.9.3" do
    command "/usr/local/rvm/bin/rvm install 1.9.3"
    not_if "/usr/local/rvm/bin/rvm list | grep 1.9.3"
    cwd "/root"
end

execute "rvm install 2.0.0" do
    command "/usr/local/rvm/bin/rvm install 2.0.0"
    not_if "/usr/local/rvm/bin/rvm list | grep 2.0.0"
    cwd "/root"
end

execute "rvm --default use 2.0.0" do
    command 'su - deploy -c "rvm --default use ruby-2.0.0"'
    cwd "/home/deploy"
end
