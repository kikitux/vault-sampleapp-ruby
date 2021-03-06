# vault-sampleapp-ruby

## Description

Sample app that shows vault and consul working toegether.

On startup 2 vm are created, `server` and `client`

Server provides the following services:
- Consul
- Vault

## Consul
Consul ui is enabled and port forward are set for the host.

on `http://192.168.56.11:8500/ui` for server and `http://192.168.56.12:8500/ui` for client

A service definition can be found on [conf/vault.json](conf/vault.json) that register vault as an external service on consul.

This allows the ruby app to reach vault on `vaul.service.consul` dns, without requiring hardcoded ip.

# TODO:

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

## Version 0.0.6
- [x] Create database using user and secret password
- [x] Update application to use secrets from vault

## Version 0.0.7
- [x] Update Consul and Vault
