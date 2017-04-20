#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Sample app 
# Uses the vault client tools to:
# - connect to vault
# - read and print the value of an existing secret (secret/hello)

require "vault"

vaulttokenfile = File.read '/vagrant/vault-token'
vaulttoken = vaulttokenfile.tr("\n","")

client = Vault::Client.new(
    address: "http://192.168.56.11:8200",
    token: vaulttoken
)

mysecret = client.get("/v1/secret/hello")

puts mysecret[:data][:value]
