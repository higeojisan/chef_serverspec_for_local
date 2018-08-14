require 'spec_helper'

describe yumrepo('nodesource') do
  it { should exist }
  it { should be_enabled }
end

describe package('nodejs') do
  it { should be_installed.with_version('8.11.3') }
end

describe command('which npm') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end
