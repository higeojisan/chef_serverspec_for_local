node['users']['name'].each do |user|
  user "#{user}" do
    shell "#{node['users']['shell']}"
    manage_home true
    home "/home/#{user}"
    action :create
  end
end
