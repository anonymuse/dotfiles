#!/bin/sh
#
###################################
#  Parlay configuration utility   #
##########################################################
#                                                        #
# Objective:                                             #
# Install programs via Homebrew for OSX                  #
#                                                        #
# Learn:                                                 #
# See documentation on DEFAULTS(1):                      #
# https://goo.gl/67dQaa                                  #
#                                                        #
##########################################################

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }

# Homebrew install function
function brew_install_recipes() {
  recipes=($(setdiff "${recipes[*]}" "$(brew list)"))
  if (( ${#recipes[@]} > 0 )); then
    e_header "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew install $recipe
    done
  fi
}

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
  brew cask cleanup
fi

# Abort if we are not using OSX.
is_osx || return 1

# Abort if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Abort if Homebrew Cask is not installed.
[[ ! "$(brew ls --versions brew-cask)" ]] && e_error "Brew-cask failed to install." && return 1

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Install baseline applications
read -r -p "Would you like to run brew upgrade? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]];then
    # Upgrade any already-installed formulae
    echo "upgrade brew packages..."
    brew upgrade
    echo "brews updated..."
else
    echo "skipped brew package upgrades.";
fi.

echo "Installing baseline CLI applications"
brew instal python
brew instal awscli
brew instal tmux
brew install docker
brew install docker-machine
brew install docker-compose
brew install docker-swarm
brew install mackup
brew install virtualenvwrapper
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install hugo
brew install keybase
brew install npm
brew install tree
# Packages for pyethapp
brew install libtool
brew install automake
# Packages for Geth
brew tap ethereum/ethereum
brew install ethereum

echo "Installing baseline GUI applications"
brew cask install iterm2
brew cask install google-chrome
brew cask install sonos
brew cask install spectacle
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install skype
brew cask install unrarx
brew cask install nmap
brew cask install firefox
brew cask install evernote
brew cask install sublime-text
brew cask install deluge
brew cask install otto
brew cask install caffeine
brew cask install flux
brew cask install transmission
brew cask install the-unarchiver
brew cask install dash
brew cask install endlesssky

echo "Installing pip-based applications"
pip install distribute
pip install nose
pip install requests
pip install flask
pip install virtualenv
pip install virtualenvwrapper
pip install SimpleGUICS2Pygame
