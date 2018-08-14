require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('cat /etc/nginx/nginx.conf | grep "server_tokens" | grep "off"') do
  its(:exit_status) { should eq 0 }
end
