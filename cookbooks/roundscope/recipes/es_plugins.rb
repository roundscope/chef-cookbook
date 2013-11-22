#
# Cookbook Name:: roundscope
# Recipe:: Installs needed elasticsearch plugins
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
execute "install elasticsearch/elasticsearch-river-couchdb" do
    command "/usr/local/bin/plugin -install elasticsearch/elasticsearch-river-couchdb/1.2.0"
    not_if "/usr/local/bin/plugin -l | grep river-couchdb"
end

execute "install elasticsearch/elasticsearch-lang-javascript" do
    command "/usr/local/bin/plugin -install elasticsearch/elasticsearch-lang-javascript/1.4.0"
    not_if "/usr/local/bin/plugin -l | grep lang-javascript"
end

service "elasticsearch" do
  action :restart
end
