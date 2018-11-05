#!/usr/bin/env bash

echo "running server provisioning"

# Run a development version of vault and test writing and reading a sample (secret/hello) secret 

mkdir -p /vagrant/logs

#consul
killall consul &>/dev/null
nohup consul agent -dev -enable-script-checks -data-dir=/usr/local/consul -bind=192.168.56.11 -client=0.0.0.0 -ui -config-dir=/vagrant/conf &>/vagrant/logs/consul-${HOSTNAME}.log &
sleep 3
consul members

#vault
killall vault &>/dev/null
nohup vault server -dev -dev-listen-address=192.168.56.11:8200 &>/vagrant/logs/vault-${HOSTNAME}.log &
sleep 2
cp ~/.vault-token /vagrant/vault-token
VAULT_ADDR='http://192.168.56.11:8200' vault secrets enable -version=1 kv

VAULT_ADDR='http://192.168.56.11:8200' vault kv put kv/hello value=world
VAULT_ADDR='http://192.168.56.11:8200' vault kv get kv/hello

#mysql
THEPASS=mysqlpassword
#create a password in vault
VAULT_ADDR='http://192.168.56.11:8200' vault kv put kv/mysqluser value=${THEPASS}
[ -f /usr/local/mysql.done ] || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get install -y --no-install-recommends mysql-server
  sed -i -e 's/bind-address=*.*/bind-address=0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
  service mysql restart
  mysql -u root << EOF
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON mydb.* TO 'root'@'localhost';
CREATE USER 'user'@'%' IDENTIFIED BY '${THEPASS}';
GRANT ALL PRIVILEGES ON mydb.* TO 'user'@'%';
USE mydb;
CREATE TABLE mytable (name VARCHAR(20));
FLUSH PRIVILEGES;
exit
EOF
  touch /usr/local/mysql.done 
}

mysqlshow mydb
mysqlshow -h 192.168.56.11 -uuser -p${THEPASS} mydb -P 3306
