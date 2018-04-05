#!/bin/sh
#
# Ubuntu customization script

###############################################
##                 Text                      ##
###############################################

######################################
# ViM                                #
######################################

sudo apt install vim

######################################
# Sublime Text 3                     #
######################################

sudo apt install sublime-text-installer

###############################################
##                Containers                 ##
###############################################

######################################
# Docker                             #
######################################

# Allow apt to use repositories over HTTPS
sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository
# Note: The lsb_release -cs sub-command below returns the name of your
# Ubuntu distribution, such as xenial.
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt update -y

# Check where your package will come from and install
apt-cache policy docker-engine
sudo apt install docker-ce docker-machine docker-compose

# Ensure that Docker runs at startup
sudo systemctl enable docker

# Set up sudo-less Docker
sudo usermod -aG docker $(whoami)

###############################################
##                  Input                    ##
###############################################

# Install touchpad configuration utility
# See https://github.com/advancingu/XPS13Linux/issues/3
sudo apt install -y xserver-xorg-input-libinput

###############################################
##            System Utilities               ##
###############################################

# Allows you to collect informationn about your hardware and software outputs
# in your system.
sudo apt install inxi

# Screencasting and sharing software
sudo apt install asciinema

# General utilities
sudo apt install traceroute

###############################################
##            Web Browsing                   ##
###############################################

# Install Chromium
sudo apt install chromium-browser

# Install Vivaldi

