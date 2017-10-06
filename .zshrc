# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

#screen integration to set caption bar dynamically
	function title {
		if [[ $TERM == "screen" || $TERM == "screen.linux" ]]; then
# Use these two for GNU Screen:
			print -nR $'\033k'$1$'\033'\\\

				print -nR $'\033]0;'$2$'\a'
				elif [[ $TERM == "xterm" || $TERM == "urxvt" ]]; then
# Use this one instead for XTerms:
				print -nR $'\033]0;'$*$'\a'
#trap 'echo -ne "\e]0;$USER@$HOSTNAME: $BASH_COMMAND\007"' DEBUG
				fi
	}



#set screen title if not connected remotely
function precmd {
	title "`print -Pn "%~" | sed "s:\([~/][^/]*\)/.*/:\1...:"`" "$TERM $PWD"
		echo -ne '\033[?17;0;127c'
}

function preexec {
	emulate -L zsh
	local -a cmd; cmd=(${(z)1})
	if [[ $cmd[1]:t == "ssh" ]]; then
		title "@"$cmd[2] "$TERM $cmd"
	elif [[ $cmd[1]:t == "sudo" ]]; then
		title "#"$cmd[2]:t "$TERM $cmd[3,-1]"
	elif [[ $cmd[1]:t == "for" ]]; then
		title "()"$cmd[7] "$TERM $cmd"
	elif [[ $cmd[1]:t == "svn" ]]; then
		title "$cmd[1,2]" "$TERM $cmd"
	else
		title $cmd[1]:t "$TERM $cmd[2,-1]"
	fi
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="victor"

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

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# #screen integration to set caption bar dynamically

stty ixany
stty ixoff -ixon