#!/usr/bin/env bash

echo "running global provisioning"

# Install required packages on client and server
PACKAGES="jq wget ruby vim unzip dnsmasq"
which ${PACKAGES} &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y --no-install-recommends ${PACKAGES}
}

#dnsmasq
grep consul /etc/dnsmasq.conf && (service dnsmasq restart) || (echo 'server=/consul/127.0.0.1#8600' | tee -a /etc/dnsmasq.conf && service dnsmasq restart)

cat > /etc/resolv.conf <<EOF
search consul
nameserver 127.0.0.1
nameserver 10.0.2.3
EOF

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
