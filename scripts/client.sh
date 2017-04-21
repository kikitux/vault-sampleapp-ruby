#!/usr/bin/env bash

echo "running client provisioning"

# Make vault client tools available on the client and run a simple test by printing the secret/hello secret to the CLI

killall consul &>/dev/null
nohup consul agent -data-dir=/usr/local/consul -join=192.168.56.11 -bind=192.168.56.12 -client=0.0.0.0 -ui &>/vagrant/consul-${HOSTNAME}.log &
service dnsmasq force-reload

gem install vault
cp /vagrant/vault-token ~/.vault-token 
echo "vault cli"
VAULT_ADDR='http://192.168.56.11:8200' vault read -format=json secret/hello
echo "sample app"
ruby /vagrant/clientapp/app.rb
