#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

require "vault"

vaulttokenfile = File.read '/vagrant/vault-token'
vaulttoken = vaulttokenfile.tr("\n","")

client = Vault::Client.new(
    address: "http://192.168.56.11:8200",
    token: vaulttoken
)

mysecret = client.get("/v1/secret/hello")

puts mysecret[:data][:value]
