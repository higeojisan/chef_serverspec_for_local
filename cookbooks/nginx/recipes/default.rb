template "/etc/yum.repos.d/nginx.repo" do
  owner "root"
  group "root"
  mode "0644"
end

package "nginx" do
  action :install
  options "--enablerepo=nginx"
end

service "nginx" do
  action [:enable, :start]
  supports :start => true, :status => true, :restart => true, :reload => true
end

template "/etc/nginx/conf.d/#{node['nginx']['server_name']}.conf" do
  source "chef_dev_local.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  verify 'nginx -t'
  notifies :reload, 'service[nginx]'
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  verify 'nginx -t'
  notifies :reload, 'service[nginx]'
end
