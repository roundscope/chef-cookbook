#
# Cookbook Name:: roundscope
# Recipe:: Roundscope couchdb version installation from source. Based on couchdb cookbook,
#          so not forget to include it to your cookbook before use 
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
include_recipe "build-essential"
node.default['couch_db']['src_checksum']   = "bdbb9c35c2738ae0fe63280bd818a50443253f3db2184f8b9c386e5615ae02b5"
node.default['couch_db']['src_version']    = "1.4.0"
node.default['couch_db']['src_mirror']     = "http://www.eu.apache.org/dist/couchdb/source/#{node['couch_db']['src_version']}/apache-couchdb-#{node['couch_db']['src_version']}.tar.gz"
include_recipe "couchdb::source"

