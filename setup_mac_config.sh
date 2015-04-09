#!/bin/sh

## ask if user wants to keep their current .files
read -p "Do you want to keep your current .files (y/n)? " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "yanking files from ~"
	./yank_mac_config.sh
fi

## Update the zsh files
cp ./.zshrc ~/.zshrc

## Update the vim files
cp vim/.vimrc ~/.vimrc
cp -r vim/.vimtemplates ~/.vimtemplates

## Update the tmux files
cp tmux/.tmux.conf ~/.tmux.conf
