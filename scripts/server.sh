#!/usr/bin/env bash

echo "running server provisioning"

# Run a development version of vault and test writing and reading a sample (secret/hello) secret 

killall consul &>/dev/null
nohup consul agent -dev -data-dir=/usr/local/consul -bind=192.168.56.11 -client=0.0.0.0 -ui &>/vagrant/consul-${HOSTNAME}.log &
sleep 3
consul members

killall vault &>/dev/null
nohup vault server -dev -dev-listen-address=192.168.56.11:8200 &>/vagrant/vault-${HOSTNAME}.log &
sleep 2
cp ~/.vault-token /vagrant/vault-token
VAULT_ADDR='http://192.168.56.11:8200' vault write secret/hello value=world
VAULT_ADDR='http://192.168.56.11:8200' vault read secret/hello
