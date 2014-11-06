#!/bin/bash
#
# Script to provision a basic web server
#

echo mysql-server mysql-server/root_password password insecure | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password insecure | sudo debconf-set-selections

apt-get update
apt-get -y install apache2 php5 mysql-server php5-mysql
