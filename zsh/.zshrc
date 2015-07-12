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

if [ -f ~/.bash_profile ]; then
	source ~/.bash_profile
fi
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:~/bin ~/Library/Python/2.7/bin:/opt/X11/bin:/usr/local/git/bin"
export PATH="$HOME/.rbenv/bin:$PATH"


if [ "$(which rbenv)" != "rbenv not found" ]; then
	eval "$(rbenv init -)"
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# nvm stuffs
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# vagrant stuffs
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


### Google Cloud
if [ -d "/Users/joshua/google-cloud-sdk" ]; then
	# The next line updates PATH for the Google Cloud SDK.
	source '/Users/joshua/google-cloud-sdk/path.zsh.inc'

	# The next line enables bash completion for gcloud.
	source '/Users/joshua/google-cloud-sdk/completion.zsh.inc'
fi


### Aliases
alias 'git-log'='git log --decorate'


# Add my custom scripts to the path
export PATH=~/code/josh_setup/scripts:$PATH
export PATH=~/code/josh_setup/node_scripts:$PATH
export PATH=~/android-sdk-macosx/platform-tools:$PATH
