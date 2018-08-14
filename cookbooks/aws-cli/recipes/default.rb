package 'python-pip' do
  action :install
end

execute 'upgrade pip' do
  user 'root'
  command 'pip install --upgrade pip'
end

execute 'install aws-cli' do
  user 'root'
  command 'pip install awscli --upgrade'
end
