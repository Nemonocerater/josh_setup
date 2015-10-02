#!/bin/sh

## Install Hub
git clone https://github.com/github/hub.git
cd hub
script/build
mv ./hub ~/bin

## Install Oh-my-zsh
curl -L http://install.ohmyz.sh | sh
