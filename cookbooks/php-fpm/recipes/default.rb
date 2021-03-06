package 'epel-release' do
  action :install
end

execute 'install remi-release-7' do
  user "root"
  command "yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
  not_if "rpm -q remi-release"
end

%w(php php-fpm php-mbstring php-pdo php-opcache php-simplexml php-zip).each do |pkg|
  package pkg do
    action :install
    options "--enablerepo=epel,remi,remi-php71"
  end
end

script 'install composer' do
  interpreter "bash"
  user "root"
  code <<-EOH
    cd /tmp
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
    EOH
  not_if { File.exists?("/usr/local/bin/composer")}
end

service 'php-fpm' do
  action [:enable, :start]
  supports :start => true, :status => true, :restart => true, :reload => true
end

execute 'modify /etc/php-fpm.d/www.conf' do
  user "root"
  command "sed -i -e 's/user = apache/user = nginx/g' -e 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf"
  not_if 'cat /etc/php-fpm.d/www.conf | grep "user = nginx"'
  notifies :restart, 'service[php-fpm]'
end

#execute 'remove X-Powered-By' do
#  user "root"
#  command "sed -i -e 's/expose_php = On/expose_php = Off/g' /etc/php.ini"
#  not_if 'cat /etc/php.ini | grep "expose_php = Off"'
#  notifies :restart, 'service[php-fpm]'
#end

# php.iniの基本的な設定(文字コード、タイムゾーン、X-Powered-Byの削除)
template '/etc/php.ini' do
  source 'php.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[php-fpm]'
end
