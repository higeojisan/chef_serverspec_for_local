require 'spec_helper'

%w(python).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

%w(pip aws).each do |command|
  describe command("which #{command}") do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end
