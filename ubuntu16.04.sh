#!/bin/bash

echo 'Alxw Judge System Install Script Interactive'
echo 'Design By SpringHack'
echo 'Visit http://www.dosk/win/'

# Install Components
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password sksks'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password sksks'
sudo apt -y install mysql-server-5.7 apache2 php php-curl php-mbstring git python-dev python-mysqldb python-pycurl libapache2-mod-php build-essential openjdk-8-jdk

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

# Initial MySQL
mysql -uroot -psksks << EOF
create database build_vj;
EOF

# Change Config
sudo php ./makeconfig.php
sudo a2enmod rewrite
echo 'Change apache config'
sudo sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
sudo sed -i 's/\/home\/wwwroot\/default\/classes\/Server.php/\/var\/www\/html\/alxwvj\/classes\/Server.php/g' /etc/init.d/alxwd

sudo /etc/init.d/alxwd start
sudo /etc/init.d/ajcd start

echo 'Enjoy it via http://localhost/alxwvj/ !'
