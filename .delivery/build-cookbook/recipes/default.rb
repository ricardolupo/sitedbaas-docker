#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'delivery-truck::default'

docker_installation 'default' do
    action :create
end

group 'docker' do
    action :create
    members "dbuild"
end

docker_service 'default' do
  action [:create, :start]
end

