#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Sample app 
# Uses the vault client tools to:
# - connect to vault
# - read and print the value of an existing secret (secret/hello)

require "vault"
require 'mysql'

vaulttokenfile = File.read '/vagrant/vault-token'
vaulttoken = vaulttokenfile.tr("\n","")

client = Vault::Client.new(
    address: "http://vault.service.consul:8200",
    token: vaulttoken
)

mysecret = client.get("/v1/secret/mysqluser")

begin
    con = Mysql.new 'mydb.mysql.service.consul', 'user', mysecret[:data][:value], 'mydb'
    puts con.get_server_info
    rs = con.query 'SELECT count(*) FROM mytable'
    puts rs.fetch_row    
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
