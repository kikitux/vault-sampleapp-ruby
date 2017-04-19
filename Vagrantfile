# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "cbednarski/ubuntu-1604"
  config.vm.provision "shell", path: "scripts/global.sh"
  config.vm.provider "virtualbox"
  config.vm.define "server" do |server|
    server.vm.provision "shell", path: "scripts/server.sh"
  end
  config.vm.define "client" do |client|
    client.vm.provision "shell", path: "scripts/client.sh"
  end
end
