#!/bin/sh

## Update the zsh files
rm ~/.zshrc 
ln -s $HOME/code/josh_setup/zsh/.zshrc ~/.zshrc

## Update the vim files
rm ~/.vimrc
ln -s $HOME/code/josh_setup/vim/.vimrc ~/.vimrc

rm -rf ~/.vimtemplates
ln -s $HOME/code/josh_setup/vim/.vimtemplates ~/.vimtemplates

## Update the tmux files
rm ~/.tmux.conf
ln -s $HOME/code/josh_setup/tmux/.tmux.conf.mac ~/.tmux.conf

function brewInstall() {
	if [ -z "`brew ls --versions $1`" ]; then
		brew install $1
	else
		echo "$1 are already installed!"
	fi
}

# Setup Coreutils
brewInstall coreutils
