#!/usr/bin/env bash

echo "running client provisioning"

gem install vault
cp /vagrant/vault-token ~/.vault-token 
echo "vault cli"
VAULT_ADDR='http://192.168.56.11:8200' vault read -format=json secret/hello
echo "sample app"
ruby /vagrant/clientapp/app.rb
