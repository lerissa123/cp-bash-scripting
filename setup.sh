#!/bin/bash
touch basedusers.txt
touch localusers.txt
touch garbage.txt
touch belovedusers.txt
touch unbelovedusers.txt
touch addusers.txt

echo "" > addusers.txt
echo "" > unbelovedusers.txt
echo "" > belovedusers.txt

chmod 777 firewall.sh
chmod 777 userss.sh
chmod 777 addusers.txt
chmod 777 basedusers.txt
chmod 777 belovedusers.txt
chmod 777 garbage.txt
chmod 777 localusers.txt
chmod 777 unbelovedusers.txt