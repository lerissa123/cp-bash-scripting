#!/bin/bash
#this installs teh firewall
echo "Are you sure you want the firewall???"
read  -p "y/n: " varyn
if [ $varyn == "n" ] 
then

    echo ":("
    exit 1
fi

apt-get install ufw -y > /dev/null
ufw enable
