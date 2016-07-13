#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'delivery-truck::provision'

include_recipe "build-cookbook::cleanenv"

container = "#{project_slug}-#{delivery_environment}"


docker_image node['build-cookbook']['dockerimage'] do 
    action :pull
    tag 'latest'
end

docker_container container do
    repo node['build-cookbook']['dockerimage'] 
    privileged true
    port "#{node['build-cookbook']['docker_httpd_port']}:80"
    extra_hosts ['cad-chef-server:172.31.54.57']
end

