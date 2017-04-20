#!/usr/bin/env bash

echo "running global provisioning"

# Install required packages on client and server
PACKAGES="jq wget ruby vim unzip"
which ${PACKAGES} &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y --no-install-recommends ${PACKAGES}
}

# Provision vault
mkdir -p /vagrant/files
pushd /vagrant/files
[ -f vault_0.7.0_linux_amd64.zip ] || wget -k https://releases.hashicorp.com/vault/0.7.0/vault_0.7.0_linux_amd64.zip
[ -f consul_0.8.1_linux_amd64.zip ] || wget -k https://releases.hashicorp.com/consul/0.8.1/consul_0.8.1_linux_amd64.zip

mkdir -p /usr/local/bin
pushd /usr/local/bin
unzip -n /vagrant/files/vault_0.7.0_linux_amd64.zip
unzip -n /vagrant/files/consul_0.8.1_linux_amd64.zip
hash -r
vault version
consul version
