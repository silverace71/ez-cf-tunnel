#!/bin/bash

echo "are you using a .deb (ubuntu flavors), .rpm (fedora flavors), or arch (pacman)"
echo "(1)|deb"
echo "(2)|fedora"
echo "(3)|arch"
read os
if [[ $os == "1" ]]; then
##DEBIAN
echo "do you have crontab installed(y/n)?"
read indeed
    if [[ $indeed == "y"]]; then
    sleep 1
    else
    sudo apt install cron -y
    fi
    wget https://raw.githubusercontent.com/silverace71/ez-cf-tunnel/main/cf-deb-amd64.sh
    sudo chmod +x cf-deb-amd64.sh
    ./cf-deb-amd64.sh
else
##FEDORA
    if [[ $os == "2" ]]; then
    echo "do you have crontab installed(y/n)?"
    read indeed
         if [[ $indeed == "y"]]; then
         sleep 1
         else
         yum install cronie -y
         fi
         wget
    else
##ARCH
    echo "do you have crontab installed(y/n)?"
    read indeed
        if [[ $indeed == "y"]]; then
        sleep 1
        else
        sudo systemctl enable cronie.service --now
        sudo ln -s /usr/bin/vim /usr/bin/vi
        fi
        wget 
    fi
fi
