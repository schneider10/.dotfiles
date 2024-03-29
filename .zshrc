#zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH="/Users/stephen/.oh-my-zsh"
export PATH="$HOME/.poetry/bin:$PATH"

ZSH_THEME=awesomepanda

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git web-search zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/Stephen/.alias_list

alias python='python3'
alias pip=/usr/local/bin/pip3
alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -r now"
alias s=google
alias v=vim
alias o="open ."
alias e="exit"
alias rg="rg -iC3"
alias weather="s weather today"
alias psh="pipenv shell"
alias t="tmux"
alias del="rmtrash"
alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"

# Docker related:
alias dc="docker-compose"
alias ds="dc up -d" # d for detached
alias dcd="dc down"
alias dcr="dc restart"
alias dv="docker volume"
alias dvl="dv ls"
alias dvrm="dv rm"
alias dps='docker ps --format "table {{.Names}}: {{.Status}}\t{{.Image}}:{{.Mounts}}\t{{.Command}}\t{{.Ports}}"'
alias drm="docker rm -f"
alias de="docker exec -it"


tch () { touch $1 && echo '#!/bin/bash' >> $1  && chmod +x $1 }


to_gif () {
  docker run --rm -v=$(pwd):/tmp/workdir jrottenberg/ffmpeg -i "$1" "${1%.*}".gif
}

to_hive () {
  scp -P 2253 $1 runner@192.168.1.7:~/Code/
}

awsume () {
  docker run --rm -v ~/.aws/:/root/.aws/ -v awsume_data:/root schneider10/awsume awsume "$1"
}

awsc () {
  URL=$( { docker run --rm -v ~/.aws/:/root/.aws/ -v awsume_data:/root schneider10/awsume awsume "$1" -csl "$2"; } 2>&1 )
  chrome $(echo "$URL" | grep "http")
}

chrome () {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "$1"
}


## ------ FZF Configs ------ ##
export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# if file exists, source it
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

#zprof
