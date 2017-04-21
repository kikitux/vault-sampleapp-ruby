# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile                                            

# Instruct Vagrant to provision both a server and a client, which can communicate with eachother, in order to exchange secrets.

# Referenced scripts:
# scripts/global.sh - global configuration
# scripts/server.sh - server-specific provisioning
# scripts/client.sh - client-specific provisioning

Vagrant.configure("2") do |config|
  config.vm.box = "cbednarski/ubuntu-1604"
  config.vm.synced_folder "archives", "/var/cache/apt/archives", create: true,
    mount_options: ["dmode=777,fmode=646"]
  config.vm.provision "shell", path: "scripts/global.sh"
  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0')
  end
  config.vm.define "server" do |server|
    server.vm.provision "shell", path: "scripts/server.sh"
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "192.168.56.11"
  end
  config.vm.define "client" do |client|
    client.vm.provision "shell", path: "scripts/client.sh"
    client.vm.provision "shell", path: "scripts/client-test.sh"
    client.vm.hostname = "client"
    client.vm.network "private_network", ip: "192.168.56.12"
  end
end
