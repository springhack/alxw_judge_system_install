#!/bin/bash

echo 'Alxw Judge System Install Script Interactive'
echo 'Design By SpringHack'
echo 'Visit http://www.dosk/win/'

# Install Components
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password sksks'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password sksks'
sudo apt -y install mysql-server-5.7 apache2 php php-curl php-mbstring git python-dev python-mysqldb libapache2-mod-php build-essential openjdk-8-jdk

# Clone Code
git clone https://github.com/springhack/alxw_judge_system_v1
git clone https://github.com/springhack/alxw_judge_core
git clone https://github.com/springhack/Lo-runner

# Compile Code And Install
cd Lo-runner
sudo ./setup.py install
cd ..

mkdir -p /var/www/html/alxwvj

cd alxw_judge_system_v1
cp -rvf ./* /var/www/html/alxwvj/
cd ..

cd alxw_judge_core
sudo ./Install.sh install
cd ..

cp /var/www/html/alxwvj/classes/alxwd /etc/init.d/alxwd

# Change Permission
sudo chown -R www-data:www-data /var/www/html/alxwvj
sudo chmod 755 /etc/init.d/alxwd
sudo chmod 755 /etc/init.d/ajcd

# Change Config
sudo php ./makeconfig.php
a2enmod rewrite
echo 'Change apache config'
sudo sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf

sudo /etc/init.d/alxwd start
sudo /etc/init.d/ajcd start

echo 'Enjoy it via http://localhost/alxwvj/ !'
