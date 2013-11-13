
# Cookbook Name:: dale_test
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
package 'vsftpd' do
  action :install
end

service "vsftpd" do
  supports :status => true, :start => true, :stop => true, :restart => true
  action :enable
end

template "/etc/vsftpd.conf" do
  source "vsftpd.conf.erb"
  notifies :restart, "service[vsftpd]", :delayed
end

