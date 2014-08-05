#!/bin/sh

if [ ! -d "vim" ]; then
	mkdir vim
fi

if [ ! -d "tmux" ]; then
	mkdir tmux
fi

cp ~/.vimrc vim/.vimrc
cp -r ~/.vimtemplates vim/.vimtemplates
cp ~/.tmux.conf tmux/.tmux.conf
