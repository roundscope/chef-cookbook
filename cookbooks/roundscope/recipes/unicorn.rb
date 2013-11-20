#
# Cookbook Name:: roundscope
# Recipe::  Installs Unicorn via gem
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

execute "rvm install 2.0.0" do
    command 'su - deploy -c "gem install unicorn"'
    cwd "/home/deploy"
end
