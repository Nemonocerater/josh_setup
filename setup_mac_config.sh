#!/bin/sh

## Update the zsh files
rm ~/.zshrc 
ln -s $HOME/code/josh_setup/zsh/.zshrc ~/.zshrc
#cp zsh/.zshrc ~/.zshrc

## Update the vim files
rm ~/.vimrc
ln -s $HOME/code/josh_setup/vim/.vimrc ~/.vimrc
#cp vim/.vimrc ~/.vimrc

rm -rf ~/.vimtemplates
ln -s $HOME/code/josh_setup/vim/.vimtemplates ~/.vimtemplates
#cp -r vim/.vimtemplates ~/

## Update the tmux files
rm ~/.tmux.conf
ln -s $HOME/code/josh_setup/tmux/.tmux.conf ~/.tmux.conf
#cp tmux/.tmux.conf ~/.tmux.conf
