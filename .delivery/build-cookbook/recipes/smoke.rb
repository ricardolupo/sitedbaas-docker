address="#{node['ipaddress']}:#{node['build-cookbook']['docker_httpd_port']}"

execute "cURL #{address} and verify 200 response" do
    command "curl -IL #{address} | grep '^HTTP/1\.1 200 OK'"
end

