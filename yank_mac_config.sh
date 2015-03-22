#!/bin/sh

if [ ! -d "vim" ]; then
	mkdir vim
fi

if [ ! -d "tmux" ]; then
	mkdir tmux
fi

## Yank zsh
cp ~/.zshrc ./.zshrc

## Yank vim
cp ~/.vimrc vim/.vimrc
cp -r ~/.vimtemplates vim/

## Yank tmux
cp ~/.tmux.conf tmux/.tmux.conf
