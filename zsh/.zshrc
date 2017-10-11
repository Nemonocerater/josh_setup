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

# vagrant stuffs
local VAGRANT_DEV_DIR=~/Code/vagrant-dev

alias 'vagrant_logs'='vagrant ssh -c "sudo tail -n0 -f /var/log/messages"'
alias 'vagrant_errors'='vagrant ssh -c "sudo tail -n0 -f /var/log/messages | grep --color=auto \"CRITICAL\|ALERT\|ERROR\|Fatal\|EMERGENCY\""'
alias 'vagrant_xdebug'='vagrant ssh -- -N -R 9000:localhost:9000'
alias 'vagrant_test'='vagrant ssh -c "./phpunit $1"'
alias 'rmux'='vagrant ssh -- sudo start rmux'
alias 'vrestart'='vagrant halt && vagrant up && rmux'
export DESKTOP='10.71.20.62'


### Aliases
eval "$(thefuck --alias)"
alias 'c'='clear'
alias 'glog'='git log --pretty="%C(yellow bold)%h%Creset %C(magenta dim)(%ae) %Creset%s"'
alias 'pgrep'='ps aux | grep'
alias 'clear-local-branches'='git branch | grep -v "master|aaa" | xargs git branch -D'
alias 'open-desktop'='sudo ufw allow proto tcp from any to any port 6109'
alias 'beep'='tput bel'

export P4PORT="ssl:p4proxy.atlanta.soma.salesforce.com:1999"

# Add my custom scripts to the path
export PATH=~/code/josh_setup/scripts:$PATH
export PATH=~/code/josh_setup/node_scripts:$PATH

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Set to Vim mode
set -o vi

# Added by GraphLab Create Launcher v3.0.0
export PATH="/Users/joshua.harris/anaconda/bin:$PATH"

# Pull in services
source ~/code/josh_setup/zsh/.zshrc.services

# Run OS dependant code
if [ `is_mac` ]; then
	source ~/code/josh_setup/zsh/.zshrc.mac
else
	source ~/code/josh_setup/zsh/.zshrc.unix
fi
