# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH Themes (yey)
#ZSH_THEME="robbyrussell"
#ZSH_THEME="miloshadzic"
ZSH_THEME="simple"
#ZSH_THEME="sorin"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set to Vim mode
set -o vi

# Set up SSH
eval `ssh-agent -s` >> /dev/null

### Aliases
alias 'c'='clear'
alias 'glog'='git log --pretty="%C(yellow bold)%h%Creset %C(magenta dim)(%ae) %Creset%s"'
alias 'pgrep'='ps aux | grep'
alias 'clear-local-branches'='git branch | grep -v "master|personal" | xargs git branch -D'
alias 'open-desktop'='sudo ufw allow proto tcp from any to any port 6109'
alias 'beep'='tput bel'

# Add my custom scripts to the path
export PATH=~/code/josh_setup/scripts:$PATH
export PATH=~/code/josh_setup/node_scripts:$PATH

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Manually added for brew
export PATH="/usr/local/bin/:$PATH"
export HOMEBREW_GITHUB_API_TOKEN=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

# Setup Go
export PATH=$PATH:$GOPATH/bin

# Pull in services
source ~/code/josh_setup/zsh/.zshrc.services

# Mac OS X Improvements
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
