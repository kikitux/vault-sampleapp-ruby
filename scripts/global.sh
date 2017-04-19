#!/usr/bin/env bash

echo "running global provisioning"

which wget ruby &>/dev/null || {
  apt-get update
  apt-get install -y wget ruby
}
mkdir -p /vagrant/files
pushd /vagrant/files
[ -f vault_0.7.0_linux_amd64.zip ] || wget -k https://releases.hashicorp.com/vault/0.7.0/vault_0.7.0_linux_amd64.zip

mkdir -p /usr/local/bin
pushd /usr/local/bin
unzip -n /vagrant/files/vault_0.7.0_linux_amd64.zip
hash -r
vault -version

gem install rubyzip
