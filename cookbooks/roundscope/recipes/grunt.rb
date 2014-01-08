#
# Cookbook Name:: roundscope
# Recipe::  Installs grunt via npm 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

execute "install grunt" do
    command 'su - -c "npm install -g grunt-cli"'
    not_if "npm list -g | grep grunt-cli"
end
