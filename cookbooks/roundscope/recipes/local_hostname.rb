#
# Cookbook Name:: roundscope
# Recipe:: /etc/hostname >> /etc/hosts
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
bash "hosts" do
  user "root"
  code <<-EOH
  if ! grep $HOSTNAME /etc/hosts; then
    echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
  fi
  EOH
end
