#!/bin/sh
#
###################################
#  Parlay configuration utility   #
##########################################################
#                                                        #
# Objective:                                             #
# Install Homebrew for OSX package management.           #
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


# Install Homebrew Casks
  # Applications

brew cask install virualbox
brew cask install boot2docker
brew cask install docker
brew cask install spectacle
