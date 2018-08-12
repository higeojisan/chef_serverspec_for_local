execute 'install nodejs repository' do
  command 'curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -'
  creates '/etc/yum.repos.d/nodesource-el7.repo'
end

package 'nodejs' do
  action :install
  version '8.11.3'
end
