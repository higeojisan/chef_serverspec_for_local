require 'spec_helper'

describe command('which redis-cli') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end

describe service('redis') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end
