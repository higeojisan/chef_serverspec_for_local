# 各種パッケージのインストール
%w(wget git vim unzip gcc).each do |pkg|
  package pkg do
    action :install
  end
end

# タイムゾーンの設定
execute 'timedatectl set-timezone' do
  user 'root'
  command 'timedatectl set-timezone Asia/Tokyo'
end

# SElinuxの無効化
execute 'setenforce 0' do
  user 'root'
  command 'setenforce 0'
  not_if 'getenforce | grep "Disabled"'
end

template '/etc/selinux/config' do
  source '/etc/selinux/config.erb'
  user 'root'
  group 'root'
  mode '0644'
end
