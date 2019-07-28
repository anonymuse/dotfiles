#!/bin/sh
#
# Ubuntu customization script
# Repository installation and configuration

###############################################
##                External                   ##
###############################################

# Vivald
echo "echo deb http://repo.vivaldi.com/stable/deb/ stable main > /etc/apt/sources.list.d/vivaldi.list" | sudo sh
curl http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Asciinema
sudo apt-add-repository --yes ppa:zanchey/asciinema

# Steam Client
sudo add-appt-repository multiverse

# Flux Client
sudo add-apt-repository --yes ppa:nathan-renniewaldock/flux

## Syncthing
# Syncthing

curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

# GTK
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/kozec/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/home:kozec.list"
wget -nv https://download.opensuse.org/repositories/home:kozec/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key

###############################################
##                Update All                 ##
###############################################

sudo apt update
