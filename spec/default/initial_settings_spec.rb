require 'spec_helper'

%w(wget git unzip).each do |pkg|
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

describe service('chronyd') do
  it { should be_enabled }
  it { should be_running }
end
