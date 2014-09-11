#
# Cookbook Name:: Nginx + passenger
# Recipe:: default
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
apt_repository 'nginx_passenger' do
  uri node['passenger']['uri']
  distribution node['passenger']['distribution']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '561F9B9CAC40B2F7'
end

package 'nginx-extras' do
  action :install
end

package 'passenger' do
  action :install
end
