# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="miloshadzic"
ZSH_THEME="simple"
#ZSH_THEME="sorin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
source ~/.bashrc
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin ~/Library/Python/2.7/bin:/opt/X11/bin:/usr/local/git/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



local VAGRANT_DEV_DIR=~/Code/vagrant-dev
alias vagrant_xdebug="vagrant ssh -- -N -R 9000:localhost:9000 &"
if [ -d "$VAGRANT_DEV_DIR" ]; then
	local VAGRANT_XDEBUG_RUNNING="`ps -ax | grep "\d*:\d*\.\d* bash /usr/bin/vagrant ssh -- -N -R 9000:localhost:9000"`"
	if [ -z "$VAGRANT_XDEBUG_RUNNING" ]; then
		local PREVIOUS_DIR=`pwd`
		cd $VAGRANT_DEV_DIR
		printf "forwarding vagrant debug port (process id): "
		vagrant_xdebug
		cd $PREVIOUS_DIR
	fi
fi




export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH=~/code/josh_setup/scripts:$PATH

# The next line updates PATH for the Google Cloud SDK.
source '/Users/joshua/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/Users/joshua/google-cloud-sdk/completion.zsh.inc'

alias 'git-log'='git log --decorate'



export PATH=~/code/josh_setup/scripts:$PATH

