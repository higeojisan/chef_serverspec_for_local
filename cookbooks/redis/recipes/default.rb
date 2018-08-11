# redis-cliのインストール
script 'install redis-cli' do
  interpreter 'bash'
  user 'root'
  code <<-EOH
    cd /tmp
    wget http://download.redis.io/redis-stable.tar.gz
    tar xzvf redis-stable.tar.gz
    cd redis-stable
    make
    cp src/redis-cli /usr/local/bin/
    chmod 755 /usr/local/bin/redis-cli
    EOH
  not_if { File.exists?("/usr/local/bin/redis-cli")}
end

# redisのインストール
package 'redis' do
  version "3.2.12"
  options "--enablerepo=epel"
  action :install
end

service 'redis' do
  action [:enable, :start]
  supports :start => true, :status => true, :restart => true, :reload => true
end
