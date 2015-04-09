#!/bin/sh

## Update the zsh files
cp zsh/.zshrc ~/.zshrc

## Update the vim files
cp vim/.vimrc ~/.vimrc
cp -r vim/.vimtemplates ~/

## Update the tmux files
cp tmux/.tmux.conf ~/.tmux.conf
