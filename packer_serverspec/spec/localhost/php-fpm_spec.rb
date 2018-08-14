require 'spec_helper'

%w(php php-fpm php-mbstring php-pdo php-opcache).each do |pkg|
  describe package(pkg) do
    it { should be_installed.with_version('7.1.20') }
  end
end

describe package('php-pecl-zip') do
  it { should be_installed }
end

describe command('which composer') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end

describe service('php-fpm') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9000) do
  it { should be_listening }
end

describe command('cat /etc/php.ini | grep "expose_php = Off"') do
  its(:exit_status) { should eq 0 }
end

describe command('cat /etc/php-fpm.d/www.conf | grep "user = nginx"') do
  its(:exit_status) { should eq 0 }
end

describe command('cat /etc/php-fpm.d/www.conf | grep "group = nginx"') do
  its(:exit_status) { should eq 0 }
end
