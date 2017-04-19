#!/usr/bin/env bash

echo "running server provisioning"

killall vault &>/dev/null
nohup vault server -dev -dev-listen-address=192.168.56.11:8200 &>/vagrant/vault-${HOSTNAME}.log &
sleep 2
cp ~/.vault-token /vagrant/vault-token
VAULT_ADDR='http://192.168.56.11:8200' vault write secret/hello value=world
VAULT_ADDR='http://192.168.56.11:8200' vault read secret/hello
