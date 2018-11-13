#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Sample app 
# Uses the vault client tools to:
# - connect to vault
# - read and print the value of an existing secret (secret/hello)

# load libraries
require "vault"
require "mysql"

# load vault-token
vaulttokenfile = File.read '/vagrant/vault-token'
vaulttoken = vaulttokenfile.tr("\n","")

# create new vault client
client = Vault::Client.new(
    address: "http://vault.service.consul:8200",
    token: vaulttoken
)

# read vault kv kv/mysql
mysecret = client.logical.read("kv/mysqluser")

# run query on database
begin
    # create connection to mysql db using password from vault
    con = Mysql.new 'mydb.mysql.service.consul', 'user', mysecret.data[:value], 'mydb'
    puts con.get_server_info
    rs = con.query 'SELECT count(*) FROM mytable'
    puts rs.fetch_row    
    
# in case of errors
rescue Mysql::Error => e
    puts e.errno
    puts e.error

# close connection
ensure
    con.close if con
end
