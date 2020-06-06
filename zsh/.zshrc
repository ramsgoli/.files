# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZDOTDIR=~/dotfiles/zsh
export ZSH=${ZDOTDIR}/.oh-my-zsh

# Path to my personal binaries

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
DEFAULT_USER="ramsgoli"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
plugins=(git warhol)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Path to my own personal binaries
export PATH=$PATH:${HOME}/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ]; then source '${HOME}/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ]; then source '${HOME}/google-cloud-sdk/completion.zsh.inc'; fi

# Path to node binaries
export PATH=$PATH:/usr/local/bin/node
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# source git scripts
if [[ -f ~/git_scripts.sh ]] then
	source ~/git_scripts.sh
fi

# Go path (yeah I know its the default path, but just to be explicit"
export GOPATH=~/go
export PATH=$PATH:$(go env GOPATH)/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# initialize pyenv
export PATH="/Users/ramsgoli/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH="$HOME/.jenv/shims:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NODE_ENV=dev
eval "$(direnv hook zsh)"  # If you use Zsh
export PGHOST=localhost
export PGUSER=heap
export PGDATABASE=heap

_git_checkout ()
{
	__git_has_doubledash && return

	case "$cur" in
	--conflict=*)
		__gitcomp "diff3 merge" "" "${cur##--conflict=}"
		;;
	--*)
		__gitcomp_builtin checkout
		;;
	*)
		# check if --track, --no-track, or --no-guess was specified
		# if so, disable DWIM mode
		local flags="--track --no-track --no-guess" track_opt="--track"
		if [ "$GIT_COMPLETION_CHECKOUT_NO_GUESS" = "1" ] ||
		   [ -n "$(__git_find_on_cmdline "$flags")" ]; then
			track_opt=''
		fi
		if [ "$command" = "checkoutr" ]; then
		    __git_complete_refs $track_opt
		else
		    __gitcomp_direct "$(__git_heads "" "$cur" " ")"
		fi
		;;
	esac
}
fpath=(${ZDOTDIR}/.zsh_functions $fpath);
autoload -U $fpath[1]/*(.:t)
