#!/bin/sh

# Zsh
if [ ! -d "zsh" ]; then
	mkdir zsh 
fi
cp ~/.zshrc zsh/

# Vim
if [ ! -d "vim" ]; then
	mkdir vim
fi
cp ~/.vimrc vim/.vimrc
cp -r ~/.vimtemplates vim/

# Tmux
if [ ! -d "tmux" ]; then
	mkdir tmux
fi
cp ~/.tmux.conf tmux/.tmux.conf

