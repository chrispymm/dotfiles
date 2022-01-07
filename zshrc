#!/bin/zsh

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

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

# Git
alias g="git"
alias gs="git status"
alias gc="git commit -m $1"
alias co="git checkout"
alias glp="git log --pretty"
# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)"
