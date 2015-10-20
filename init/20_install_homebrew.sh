
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

exit 0
