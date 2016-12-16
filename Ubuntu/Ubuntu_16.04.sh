#!/bin/bash

# Do Update
sudo apt update

# Install Components
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password sksks'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password sksks'
sudo apt -y install mysql-server-5.7 apache2 php php-gd php-xml php-curl php-mysqli php-mbstring git python-dev python-mysqldb python-pycurl libapache2-mod-php build-essential openjdk-8-jdk curl python-requests

exec ./Ubuntu_Common.sh
