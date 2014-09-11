#
# Cookbook Name:: roundscope
# Recipe::  Installs ember-cli via npm
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

execute "install ember-cli" do
    command 'su - -c "npm install -g ember-cli"'
    not_if "npm list -g | grep ember-cli"
end
