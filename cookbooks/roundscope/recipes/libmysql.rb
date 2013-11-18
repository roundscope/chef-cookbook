#
# Cookbook Name:: roundscope
# Recipe:: libmysql
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#

package "libmysql-ruby" do
  action :install
end

package "libmysqlclient-dev" do
  action :install
end
