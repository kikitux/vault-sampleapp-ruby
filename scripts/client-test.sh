#!/usr/bin/env bash
set -e

# all the test must pass

echo "vault cli"
VAULT_ADDR='http://192.168.56.11:8200' vault read -format=json secret/hello
VAULT_ADDR='http://vault.service.consul:8200' vault read -format=json secret/hello

