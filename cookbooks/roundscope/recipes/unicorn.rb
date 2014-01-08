#
# Cookbook Name:: roundscope
# Recipe::  Installs Unicorn via gem
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

execute "install unicorn" do
    command 'su - deploy -c "gem install unicorn"'
    cwd "/home/deploy"
    not_if 'su - -c "gem list | grep unicorn"'
end
