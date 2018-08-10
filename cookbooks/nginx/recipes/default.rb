template "/etc/yum.repos.d/nginx.repo" do
  owner "root"
  owner "root"
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
