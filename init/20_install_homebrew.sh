
#
# Homebrew installation script and some of the common dependencies.

# Check for Homebrew
  echo "  Installing Homebrew."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi
  
fi

echo "  Updating Homebrew"
brew doctor
brew update

echo  "  Installing coreutils"
brew install coreutils

# Check for Homebrew Cask
echo  "  Checking for Homebrew Cask"
output=$(brew tap | grep cask)

# Install Cask
if [[ $? != 0 ]]; then
  echo  "  Installing Homebrew Cask"
  brew install caskroom/cask/brew-cask
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Install baseline applications
read -r -p "Would you like to run brew upgrade? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]];then
    # Upgrade any already-installed formulae
    echo "upgrade brew packages..."
    brew upgrade
    echo "brews updated..."
else
    echo "skipped brew package upgrades.";
fi

echo "Installing baseline CLI applications"
brew instal python
brew instal awscli
brew instal tmux
brew install docker
brew install boot2docker
brew install docker-machine
brew install docker-compose
brew install docker-swarm

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

exit 0
