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

###############################################
##                Update All                 ##
###############################################

sudo apt update
