#!/bin/sh

## Turn off the dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock

## Install Oh-my-zsh
curl -L http://install.ohmyz.sh | sh

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
sudo brew doctor

## Install ITerm2
brew install --cask iterm2

## Install Chrome
brew install --cask google-chrome

## Install vim
brew install macvim

## Install nvm and latest Node
brew install nvm
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
bash <<'EOF'
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  . "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
  . "/usr/local/opt/nvm/nvm.sh"
else
  echo "nvm not found after brew install" >&2
  exit 1
fi
nvm install node
nvm alias default node
EOF

## Install GitHub CLI
brew install gh

brew install tree

./mac_config.sh
