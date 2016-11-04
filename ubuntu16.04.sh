#!/bin/bash

echo 'Alxw Judge System Install Script Interactive'
echo 'Design By SpringHack'
echo 'Visit http://www.dosk/win/'

# Install Components
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password sksks'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password sksks'
sudo apt -y install mysql-server-5.7 apache2 php php-curl php-mysqli php-mbstring git python-dev python-mysqldb python-pycurl libapache2-mod-php build-essential openjdk-8-jdk

# Clone Code
git clone https://github.com/springhack/alxw_judge_system_v1
git clone https://github.com/springhack/alxw_judge_core
git clone https://github.com/springhack/Lo-runner

# Compile Code And Install
cd Lo-runner
sudo ./setup.py install
cd ..

sudo mkdir -p /var/www/html/alxwvj

cd alxw_judge_system_v1
sudo cp -rvf ./* /var/www/html/alxwvj/
cd ..

cd alxw_judge_core
sudo ./Install.sh install
cd ..

sudo cp /var/www/html/alxwvj/classes/alxwd /etc/init.d/alxwd

# Change Permission
sudo chown -R www-data:www-data /var/www/html/alxwvj
sudo chmod 755 /etc/init.d/alxwd
sudo chmod 755 /etc/init.d/ajcd

# Change Config
sudo php ./makeconfig.php
sudo a2enmod rewrite
echo 'Change apache config'
sudo sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
sudo sed -i 's/\/home\/wwwroot\/default\/classes\/Server.php/\/var\/www\/html\/alxwvj\/classes\/Server.php/g' /etc/init.d/alxwd

# Visit to create database
curl http://127.0.0.1/alxwvj/Install.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/index.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/contest.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/status.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/index.php  1>/dev/null 2>&1

# Start services
sudo /etc/init.d/mysql restart
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/alxwd start
sudo /etc/init.d/ajcd start

# Hello World
echo 'Enjoy it via http://localhost/alxwvj/ !'
