require 'spec_helper'

describe user('makoto') do
  it { should exist }
  it { should belong_to_group 'makoto' }
  it { should have_home_directory '/home/makoto' }
  it { should have_login_shell '/bin/bash' }
  #its(:encrypted_password) { should match(/^.{0,2}$/)}
end

describe user('hige') do
  it { should exist }
  it { should belong_to_group 'hige' }
  it { should have_home_directory '/home/hige' }
  it { should have_login_shell '/bin/bash' }
  #its(:encrypted_password) { should match(/^.{0,2}$/)}
end
