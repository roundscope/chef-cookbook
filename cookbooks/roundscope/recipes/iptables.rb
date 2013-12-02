#
# Cookbook Name:: roundscope
# Recipe:: Roundcope iptables config recipe
#
# Copyright 2013, Roundscope
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/etc/iptables.rules" do
    source "iptables/iptables.rules"
    mode 0644
end

cookbook_file "/etc/network/if-up.d/iptables" do
    source "iptables/iptables"
    mode 0755
end
