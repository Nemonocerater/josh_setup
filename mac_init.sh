#!/bin/sh

sudo ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

sudo brew doctor

brew install tmux

curl -L http://install.ohmyz.sh | sh
