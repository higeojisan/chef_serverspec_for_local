require 'spec_helper'

%w(php php-fpm php-mbstring php-pdo php-opcache).each do |pkg|
  describe package(pkg) do
    it { should be_installed.with_version('7.1.20') }
  end
end

describe service('php-fpm') do
  it { should be_enabled }
  it { should be_running }
end
