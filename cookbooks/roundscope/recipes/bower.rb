#
# Cookbook Name:: roundscope
# Recipe::  Installs bower via npm
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

execute "install bower" do
    command 'su - -c "npm install -g bower"'
    not_if "npm list -g | grep bower"
end
