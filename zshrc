#!/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"
export MUSIC_APP="Music"
export PATH="$HOME/bin:$PATH"

# your project folder that we can `c [tab]` to
# export PROJECTS="$HOME/Code"

# needs to be before plugins
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
  alias dircolors='gdircolors'
fi

# Plugins {{{
# ==============================================================================

# Load Plugins
source ~/.zplug/init.zsh

zplug "woefe/git-prompt.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi

# Load all plugins
zplug load

# }}}

# Configuration {{{
# ==============================================================================

# your default editor
export EDITOR='vim'
export VEDITOR='code'
export GIT_EDITOR=vim

unsetopt sharehistory
# }}}


# Aliases & Functions {{{
# ==============================================================================

# Colors
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ls='ls -lhF ${colorflag}'
alias lsa='ls -A'
alias ll='ls -A'

alias clear="clear && printf '\e[3J'";

alias df="df -h"
alias du="du -h"

# Git
alias lg='lazygit'

alias g="git"
alias gaa="git add -A"
alias gs="git status"
alias gc="git commit -m $1"
alias gco="git checkout"
alias gcob="git checkout -b"
alias grbm="git fetch && git rebase origin/main"
alias grbi="git rebase -i HEAD~$1"
alias gpush="git push"
alias gpull="git pull"
alias glp="git log --pretty"

# Docker
alias lzd="lazydocker"
alias d="docker"
alias dc="docker-compose"
alias dce="docker-compose exec"

# Rails
alias be="bundle exec"


# General
alias vim="nvim"

# switchdesktop() {
#     typeset -A desktophash
#     desktophash[0]=29
#     desktophash[1]=18
#     desktophash[2]=19
#     desktophash[3]=20
#     desktophash[4]=21
#     desktophash[5]=23
#     desktophash[6]=22
#     desktophash[7]=26
#     desktophash[8]=28
#     desktophash[9]=25
#     desktopkey=${desktophash[$1]}
#     osascript -e "tell application \"System Events\" to key code $desktopkey using control down" && osascript -e "tell application \"Übersicht\" to refresh widget id \"polybar-left-bar-coffee\""
# }
# alias switchdesktop=switchdesktop


# Always be in tmux
_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

#ensure_tmux_is_running


# }}}

##########
# Colors #
##########

if dircolors > /dev/null 2>&1; then
  eval $(dircolors -b ~/.dircolors)
fi

reset=$(tput sgr0)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
brightblack=$(tput setaf 8)
brightred=$(tput setaf 9)
brightgreen=$(tput setaf 10)
brightyellow=$(tput setaf 11)
brightblue=$(tput setaf 12)
brightmagenta=$(tput setaf 13)
brightcyan=$(tput setaf 14)
brightwhite=$(tput setaf 15)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
