#!/usr/bin/env bash
# As there's no generalized update script for Brew, this script is designed to
# poll your Brew casks and updatee them as necessary.

# Update Brew, Brew cask and clean up
(set -x; brew update;)
(set -x; brew cleanup;)
(set -x; brew cask cleanup;)

# Set some colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Set up the casks list as a variable
casks=( $(brew cask list) )

for cask in ${casks[@]}
do
    # Check for the newest version(s)
    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -maxdepth 1 -maxdepth 1 -name "$version")

    if [[ -z $installed ]]; then
        # Install new versions, and remove old versions
        echo "${red}${cask}${reset} requires ${red}update${reset}."
        (set -x; brew cask uninstall $cask --force;)
        (set -x; brew cask install $cask --force;)
    else
        echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
done

