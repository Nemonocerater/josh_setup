#!/bin/sh

## Install Oh-my-zsh
sudo apt-get remove zsh
sudo apt-get install zsh
rm -rf ~/.oh-my-zsh
curl -L http://install.ohmyz.sh | sh

## Install Vundle
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

## Install nvm
rm -rf ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

## Install command line utilities
sudo apt-get install tree
sudo apt-get install markdown

sudo apt-get install tmux
sudo apt-get install irssi
sudo apt-get install lynx

./unix_config.sh
