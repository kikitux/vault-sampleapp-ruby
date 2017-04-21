# vault-sampleapp-ruby

![build](http://nuc.kikitux.net:8081/app/rest/builds/buildType:(id:VaultSampleappRuby_Build)/statusIcon)

# Description

Sample app that shows vault and consul working toegether.

Consul ui is enabled and port forward are set for the host.

on `http://localhost:8501/ui` for server and `http://localhost:8502/ui` for client

# TODO:

## Version 0.0.5
- [ ] Add MySQL 
- [ ] Register MySQL with Consul

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
