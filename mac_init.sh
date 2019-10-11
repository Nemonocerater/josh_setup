#!/bin/sh

## Turn off the dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock

## Install Homebrew
sudo ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
sudo brew doctor

## Install vim
brew install macvim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## Install tmux
brew install tmux

## Install hub
brew install hub

## Install Oh-my-zsh
curl -L http://install.ohmyz.sh | sh

## Install irc client (irssi)
#brew install irssi

## Install Markdown and Browser
#brew install markdown
#brew install lynx

./mac_config.sh
