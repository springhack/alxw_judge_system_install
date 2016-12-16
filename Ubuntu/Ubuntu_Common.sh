#!/bin/bash

# Clean Code
sudo rm -rvf /var/www/html/alxwvj/* 2>/dev/null
sudo mkdir -p /var/www/html/alxwvj

# Try Stop Service
sudo /etc/init.d/alxwd stop 1>/dev/null 2>&1
sudo /etc/init.d/ajcd stop 1>/dev/null 2>&1

# Clone Code
git clone https://github.com/springhack/alxw_judge_system_v1
git clone https://github.com/springhack/alxw_judge_core
# git clone https://github.com/springhack/Lo-runner

# Compile Code And Install
# cd Lo-runner
# git pull
# sudo ./setup.py install
# cd ..

cd alxw_judge_system_v1
git pull
sudo cp -rvf ./* /var/www/html/alxwvj/
sudo cp -rvf ./system/.htaccess /var/www/html/alxwvj/system/
cd ..

cd alxw_judge_core
git pull
sudo ./Install.sh install
cd ..

sudo cp /var/www/html/alxwvj/system/classes/alxwd /etc/init.d/alxwd

# Change Permission
sudo chown -R www-data:www-data /var/www/html/alxwvj
sudo chmod 755 /etc/init.d/alxwd
sudo chmod 755 /etc/init.d/ajcd

# Change Config
sudo php ../Common/makeconfig.php /var/www/html/alxwvj/Config.Daemon.php
sudo a2enmod rewrite
echo 'Change apache config'
sudo sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
# sudo sed -i 's/\/home\/wwwroot\/default\/classes\/Server.php/\/var\/www\/html\/alxwvj\/classes\/Server.php/g' /etc/init.d/alxwd

# Start services
sudo /etc/init.d/mysql restart
sudo /etc/init.d/apache2 restart

# Visit to create database
curl http://127.0.0.1/alxwvj/system/Install.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/system/index.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/system/contest.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/system/status.php  1>/dev/null 2>&1
curl http://127.0.0.1/alxwvj/system/index.php  1>/dev/null 2>&1

# Start services
sudo /etc/init.d/mysql restart
sudo /etc/init.d/apache2 restart


# Start services
sleep 3
sudo /etc/init.d/alxwd start
sudo /etc/init.d/ajcd start

#Show Result
echo -e '\e\033[41;37m\n\n'
echo ' * Administrator Information:'
echo '    MySQL User: root'
echo '    MySQL Pass: sksks'
echo '    Admin User: root'
echo '    Admin Pass: sksks'
echo ' * AJC Config at /home/AJC/ajcserver/config.py'
echo ' * Alxw Config at /var/www/html/alxwvj/{Config.Daemon.php,Config.php}'

# Hello World
echo ' * Enjoy it via http://localhost/alxwvj/ !'
echo -e '\n\033[0m'

