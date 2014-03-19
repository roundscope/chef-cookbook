#
# Cookbook Name:: aeva-app
# Recipe:: default
#
# Copyright 2014, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "rvm"
include_recipe "roundscope::deployuser"
include_recipe "roundscope::sshd_conf"
#node.default['rs_git']['branch']    = "staging"
#include_recipe "roundscope::gitdeploy"
include_recipe "roundscope::local_hostname"
include_recipe "roundscope::knockd"
include_recipe "roundscope::iptables"
node.default['app-name'] = "aeva-app"
include_recipe "roundscope::shared_dirs"
include_recipe "roundscope::deployrvm200"
#include_recipe "roundscope::unicorn"
node.default['nodejs']['version']       = "0.10.24"
node.default['nodejs']['npm']   = "1.3.21"
include_recipe "nodejs::install_from_source"
include_recipe "nodejs::npm"
include_recipe "roundscope::grunt"
include_recipe "roundscope::bower"
