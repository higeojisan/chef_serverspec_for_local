# タイムゾーンの設定
execute 'timedatectl set-timezone' do
  user 'root'
  command 'timedatectl set-timezone Asia/Tokyo'
end
