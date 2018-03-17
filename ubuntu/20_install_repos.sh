#!/bin/sh
#
# Ubuntu customization script
# Repository installation and configuration

###############################################
##                External                   ##
###############################################

# Install the Vivaldi repository
echo "echo deb http://repo.vivaldi.com/stable/deb/ stable main > /etc/apt/sources.list.d/vivaldi.list" | sudo sh
curl http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551
sudo apt-get update

# Install the Sublime Text Repository
# Install the GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# Set the channel
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# Update and install
sudo apt update && sudo apt install sublime-text

# Asciinema
sudo apt-add-repository --yes ppa:zanchey/asciinema

###############################################
##                Update All                 ##
###############################################

sudo apt update
