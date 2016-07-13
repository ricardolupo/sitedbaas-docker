#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

container = "#{project_slug}-#{delivery_environment}"

execute 'start_chef_client' do
    command "docker exec #{container} chef-client --runlist 'recipe[sitedbaas]' -E #{delivery_environment} -N #{container}"
end