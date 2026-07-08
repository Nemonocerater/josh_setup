#!/bin/sh

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi
brew doctor

## Install packages from Brewfile
brew bundle install

## Install nvm and latest Node
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
bash <<'EOF'
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  . "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
  . "/usr/local/opt/nvm/nvm.sh"
else
  echo "nvm not found after brew install" >&2
  exit 1
fi
nvm install node
nvm alias default node
EOF

./mac_config.sh
