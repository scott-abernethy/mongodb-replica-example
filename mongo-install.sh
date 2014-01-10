#!/bin/bash

echo Provision script for mongodb

cat >> /etc/hosts <<EOF
192.168.64.11	mongo1
192.168.64.21	mongo2
192.168.64.31	mongo3
EOF

cat >> /etc/apt/apt.conf <<EOF
Acquire::http::Proxy "http://tmg2w.fnzsl.com:8080";
Acquire::https::Proxy "https://tmg2w.fnzsl.com:8080";
EOF

# install 10gen key
cd /tmp
wget http://docs.mongodb.org/10gen-gpg-key.asc
apt-key add 10gen-gpg-key.asc

# install 10gen mongo repo (http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install -y mongodb-10gen

# keyfile (must be the same on all servers) .. generated with `openssl rand -base64 741`
cp /vagrant/keyfile /var/lib/mongodb/
chmod 600 /var/lib/mongodb/keyfile
chown mongodb: /var/lib/mongodb/keyfile

mongo admin /vagrant/add-admin.js
mongo mytestdb /vagrant/add-users.js

service mongodb stop

cat >> /etc/mongodb.conf <<EOF
replSet = rs0
keyFile = /var/lib/mongodb/keyfile
EOF

service mongodb start

# done
