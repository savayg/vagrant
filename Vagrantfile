# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant::configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network "private_network", ip: "192.168.22.3"
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "~/Documents/vagrant/app", "/var/www", type: "nfs", :nfs => { :mount_options => ["dmode=777","fmode=777"] }

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "yum"
    chef.add_recipe "nodejs"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"
    chef.add_recipe "git"
    chef.add_recipe "postgresql"
    chef.add_recipe "vim"

    chef.json.merge!({
      :rvm => {
        :default_ruby => 'ruby-2.1.1'
      },
      :nodejs => {
        "version" => "0.10.26"
      },
      :postgresql => {
        password: {
          postgres: "password"
        }
      }
    })
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
end
