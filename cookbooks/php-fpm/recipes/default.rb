package 'epel-release' do
  action :install
end

execute 'install remi-release-7' do
  user "root"
  command "yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
  not_if "rpm -q remi-release"
end

%w(php php-fpm).each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=epel,remi,remi-php71"
  end
end

service 'php-fpm' do
  action [:enable, :start]
  supports :start => true, :status => true, :restart => true, :reload => true
end
