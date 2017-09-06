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

