#!/bin/bash
export PATH=/usr/bin:/root/bin:/usr/local/bin:/sbin:/usr/sbin
cd /tmp
sudo yum install -y ruby
sudo gem install bundler
cd /tmp/packer_serverspec
bundle install --path vendor/bundle
bundle exec rake spec
