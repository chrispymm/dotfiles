# Launch a tmux session
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

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
zplug 'dracula/zsh', as:theme

# # Install plugins if there are plugins that have not been installed
if ! zplug check; then
    zplug install
fi
#
# # Load all plugins
zplug load

# }}}

# Configuration {{{
# ==============================================================================
export XDG_CONFIG_HOME="$HOME/.config"
# your default editor
export EDITOR='nvim'
export VEDITOR='code'
export GIT_EDITOR='nvim'
# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"
export MUSIC_APP="Music"
export PATH="$HOME/bin:$PATH"
# }}}


# Aliases & Functions {{{
# ==============================================================================

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

# Eza (better ls)
alias ls="eza --all --oneline --group-directories-first --icons=always"

# Always be in tmux
_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

# not compatible with powerlevel 10k
# ensure_tmux_is_running

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

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
eval "$(rbenv init - zsh)"

# RVM
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Users/chris.pymm/.nvm/versions/node/v18.16.1/bin:/Users/chris.pymm/.rvm/gems/ruby-3.1.3/bin:/Users/chris.pymm/.rvm/gems/ruby-3.1.3@global/bin:/Users/chris.pymm/.rvm/rubies/ruby-3.1.3/bin:/Users/chris.pymm/.rbenv/shims:/Users/chris.pymm/.nvm/versions/node/v14.18.1/bin:/Users/chris.pymm/.zplug/bin:/Users/chris.pymm/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/Apple/usr/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/chris.pymm/.rvm/gems/ruby-3.1.3/bin:/Users/chris.pymm/.rvm/gems/ruby-3.1.3@global/bin:/Users/chris.pymm/.rvm/rubies/ruby-3.1.3/bin:/Users/chris.pymm/.rbenv/shims:/Users/chris.pymm/.nvm/versions/node/v14.18.1/bin:/usr/local/opt/fzf/bin:/Users/chris.pymm/.rvm/bin:/Users/chris.pymm/.rvm/bin:/Users/chris.pymm/.nvm/versions/node/v18.16.1/bin"

#Componser
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# Apply dracula theme colors
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --no-ignore . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden
}

export BAT_THEME="Dracula"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# p10k 
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# Herd injected PHP binary.
export PATH="/Users/chris.pymm/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/chris.pymm/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/chris.pymm/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/chris.pymm/Library/Application Support/Herd/config/php/84/"
