#!/bin/bash

# Start services
/etc/init.d/mysql start
/etc/init.d/apache2 start
/etc/init.d/alxwd start
/etc/init.d/ajcd start

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

# Infinity loop
while [ 0 ];
do
  read read
done
