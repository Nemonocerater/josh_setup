#!/bin/sh

PKG_MNG="apt-get"

## Install Oh-my-zsh
sudo $PKG_MNG remove zsh
sudo $PKG_MNG install zsh
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
sudo $PKG_MNG install tree
sudo $PKG_MNG install markdown

sudo $PKG_MNG install tmux
sudo $PKG_MNG install irssi
sudo $PKG_MNG install lynx

./unix_config.sh
