#!/bin/bash

# Do Update
sudo apt update

# Install Components
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password sksks'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password sksks'
sudo apt -y install mysql-server-5.5 apache2 php5 php5-gd php5-curl php5-mysql git python-dev python-mysqldb python-pycurl libapache2-mod-php5 build-essential openjdk-7-jdk curl python-requests

exec ./Ubuntu_Common.sh
