#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'delivery-truck::functional'

case delivery_environment
when "delivered"
    oldcontainer = "#{project_slug}-delivered"
    execute 'delete_node' do 
        command <<-EOH
            docker rm -f #{oldcontainer} 
            knife node delete #{oldcontainer} -y --config #{delivery_knife_rb}
            knife client delete #{oldcontainer} -y --config #{delivery_knife_rb}
        EOH
        only_if "docker ps | grep #{oldcontainer}"
    end 
else
    log "all done here!"
end