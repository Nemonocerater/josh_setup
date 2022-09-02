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
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install nvm
brew install nvm
mkdir -p ~/.nvm

## Install hub
brew install hub

./mac_config.sh
