require 'spec_helper'

describe file('/swapfile') do
  it { should be_file }
  it { should exist }
end

describe command("swapon -s | grep -E '^/swapfile'") do
  its(:exit_status) { should eq 0 }
end

describe command("grep '/swapfile swap swap defaults 0 0' /etc/fstab") do
  its(:exit_status) { should eq 0 }
end
