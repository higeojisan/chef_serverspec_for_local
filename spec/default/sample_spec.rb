require 'spec_helper'

%w(wget git).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe command('which vim') do
  its(:exit_status) { should eq 0 }
end

describe command('timedatectl status | grep "Time zone"') do
  its(:stdout) { should match /Asia\/Tokyo/}
end

describe selinux do
  it { should be_disabled }
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

%w(php php-fpm).each do |pkg|
  describe package(pkg) do
    it { should be_installed.with_version('7.1.20') }
  end
end

describe service('php-fpm') do
  it { should be_enabled }
  it { should be_running }
end

describe service('chronyd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('which redis-cli') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end
