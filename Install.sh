#!/bin/bash

# Echo Welcome
echo 'Alxw Judge System Install Script Interactive'
echo 'Design By SpringHack'
echo 'Visit http://www.dosk/win/'

# Get OS Info
OS=`lsb_release -i -s`
VER=`lsb_release -r -s`

# Echo OS Info
echo "Current OS is $OS"
echo "Current version id $VER"

# Do Install
cd $OS
exec ./${OS}_${VER}.sh

#Show Result
echo 'Administrator Information'
echo 'MySQL User: root'
echo 'MySQL Pass: sksks'
echo 'Admin User: root'
echo 'Admin Pass: sksks'
echo 'AJC Config at /home/AJC/ajcserver/config.py'
echo 'Alxw Config at /var/www/html/alxwvj/{Config.Daemon.php,Config.php}'
