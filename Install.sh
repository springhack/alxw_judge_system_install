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
