node['users']['name'].each do |user|
  data_bag_item = Chef::EncryptedDataBagItem.load('users', user)
  password = data_bag_item['password']
  user "#{user}" do
    shell "#{node['users']['shell']}"
    manage_home true
    home "/home/#{user}"
    password password
    action :create
  end
end
