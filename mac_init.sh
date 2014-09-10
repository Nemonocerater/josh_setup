#!/bin/sh

## Turn off the dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock

## Install Homebrew
sudo ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
sudo brew doctor

## Install vim
brew install macvim

## Install tmux
brew install tmux

## Install Oh-my-zsh
curl -L http://install.ohmyz.sh | sh
