# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_VERIFY

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
export COMPLETION_WAITING_DOTS=true

# Prompt
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' %F{9}✗%F{12}'
zstyle ':vcs_info:*' stagedstr ' %F{9}✗%F{12}'
zstyle ':vcs_info:git:*' formats ' %F{12}(%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{12}(%b%u%c)%f'

precmd() {
	vcs_info
	# zsh 5.9 has no cleanstr; append ✔ when the repo is clean
	if [[ -n ${vcs_info_msg_0_} && ${vcs_info_msg_0_} != *✗* ]]; then
		vcs_info_msg_0_=${vcs_info_msg_0_/\)%f/' %F{10}✔%F{12})%f'}
	fi
}

setopt PROMPT_SUBST
PROMPT='%F{green}%~%f${vcs_info_msg_0_} '

# Set to Vim mode
set -o vi

### Aliases
alias 'c'='clear'
alias 'glog'='git log --pretty="%C(yellow bold)%h%Creset %C(magenta dim)(%ae) %Creset%s"'
alias 'pgrep'='ps aux | grep'
alias 'beep'='tput bel'
alias 'rezsh'='source ~/.zshrc && echo "~/.zshrc has been reloaded"'
alias 'envload'='env $(xargs < .env)'

# Add my custom scripts to the path
export PATH=~/code/josh_setup/scripts:$PATH
export PATH=~/code/josh_setup/node_scripts:$PATH

export PATH="/opt/homebrew/bin:$PATH"

# Setup Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Pull in services
source ~/code/josh_setup/zsh/.zshrc.services

# Terraform
alias 'tf'='terraform'

# Mac OS X Improvements
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/.local/bin:$PATH"

# Local Config
source ~/.zshrc.local
