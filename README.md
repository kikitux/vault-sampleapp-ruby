# vault-sampleapp-ruby

![build](http://nuc.kikitux.net:8081/app/rest/builds/buildType:(id:VaultSampleappRuby_Build)/statusIcon)

# Description

Sample app that shows vault and consul working toegether.

On startup 2 vm are created, `server` and `client`

Server provides the following services:
- Consul
- Vault

## Consul
Consul ui is enabled and port forward are set for the host.

on `http://192.168.56.11:8500/ui` for server and `http://192.168.56.12:8500/ui` for client

A check can be found on [consul/vault.json](consul/vault.json) that register vault as an external service on consul.

This allows the ruby app to reach vault on `vaul.service.consul` dns, without requiring hardcoded ip.


# TODO:



## Version 0.0.6
- [ ] Create database using user and secret password

# Changelog:

## Version 0.0.1
- [x] Skeleton project, Vagrantfile + scripts

## Version 0.0.2
- [x] Add a ruby script
- [x] Ruby script: read value of the key named: "secret/hello"
- [x] Use token in /vagrant/vault-token (instead of hard-coding it) in the ruby app

## Version 0.0.3
- [x] Document Vagrantfile
- [x] Document global script
- [x] Document server script
- [x] Document client script
- [x] Document sample app

## Version 0.0.4
- [x] Add Consul (service discovery)
- [x] Add Consul ui

## Version 0.0.5
- [x] Add MySQL 
- [x] Register MySQL with Consul
