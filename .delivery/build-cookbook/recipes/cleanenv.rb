case delivery_environment
when "union"
    oldcontainer = "#{project_slug}-#{get_acceptance_environment}"
when "rehearsal"
    oldcontainer = "#{project_slug}-union"
when "delivered"
    oldcontainer = "#{project_slug}-rehearsal"
end



execute 'delete_node' do 
    command <<-EOH
        docker rm -f #{oldcontainer} 
        knife node delete #{oldcontainer} -y --config #{delivery_knife_rb}
        knife client delete #{oldcontainer} -y --config #{delivery_knife_rb}
    EOH
    only_if "docker ps | grep #{oldcontainer}"
end 