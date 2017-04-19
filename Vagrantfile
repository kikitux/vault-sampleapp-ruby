# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "cbednarski/ubuntu-1604"
  config.vm.synced_folder "apt", "/var/cache/apt", create: true,
    mount_options: ["dmode=777,fmode=646"]
  config.vm.provision "shell", path: "scripts/global.sh"
  config.vm.provider "virtualbox"
  config.vm.define "server" do |server|
    server.vm.provision "shell", path: "scripts/server.sh"
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "192.168.56.11"
  end
  config.vm.define "client" do |client|
    client.vm.provision "shell", path: "scripts/client.sh"
    client.vm.hostname = "client"
    client.vm.network "private_network", ip: "192.168.56.12"
  end
end
