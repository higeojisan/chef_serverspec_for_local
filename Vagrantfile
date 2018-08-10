Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "192.168.33.33"

  #config.vm.provision "shell", inline: "curl -L https://www.opscode.com/chef/install.sh | sudo bash"
  config.vm.provision "shell", inline: "cat /vagrant/caadmin.netskope.com.pem >> /etc/ssl/certs/ca-bundle.crt"
  config.vm.provision "shell", inline: "cat /vagrant/ca.iret.goskope.com.pem >> /etc/ssl/certs/ca-bundle.crt"

  config.vm.provision "chef_solo" do |chef|
    chef.install = true
    chef.run_list = ["nginx", "php-fpm"]
  end
end
