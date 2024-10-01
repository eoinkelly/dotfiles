##
# There are 4 kinds of zsh shell:
#
# 1. login + interactive
# 2. login + non-interactive
# 3. non-login + interactive
# 4. non-login + non-interactive
#
# This file is only run for _interactive_ shells (1. and 3. above).
# This file is **not** run when you run a shell script!
#
#     $ zsh ./script.sh # will source this file
#     $ zsh -l ./script.sh # will not source this file
#
# Good choices for this file are anything which configures the shell for a human to use e.g.
#
# * aliases
# * functions
# * color themes
# * key bindings
# * commands that need a tty
# * commands that produce output
#
# Bad choices for this file:
#
# * environment setup that would be needed by both interactive shells and
#   shells spawned by other processes e.g. text editors
#
# Details: http://zsh.sourceforge.net/Intro/intro_3.html
#

# vi: ft=zsh

echo "Loading .zshrc"

# See ~/.oh-my-zsh/templates/zshrc.zsh-template for default oh-my-zsh options
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="" # I'm not using oh-my-zsh to manage the theme
export UPDATE_ZSH_DAYS=30
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=()
source $ZSH/oh-my-zsh.sh

# ###########
# Setup Theme
# ###########

# not sure if this is in theme or not
# export DEFAULT_USER=eoinkelly

# POWERLEVEL9K_MODE:
#
#   flat|awesome-patched|awesome-fontconfig|awesome-mapped-fontconfig|nerdfont-complete|nerdfont-fontconfig|compatible|<empty> (default)
#
# POWERLEVEL9K_MODE="nerdfont-complete"
#
# # https://github.com/bhilburn/powerlevel9k#available-prompt-segments
# # e.g.
# #
# #     history time rust_version virtualenv
# #
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh dir_writable dir background_jobs aws rbenv nvm vcs status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# # POWERLEVEL9K_SHOW_CHANGESET=true
# # POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
# # POWERLEVEL9K_NVM_FOREGROUND='white'
# # POWERLEVEL9K_NVM_BACKGROUND='124' # a vivid red
#
# source  ~/.zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

##
# Instruct zsh to trust the terminal to display combining characters correctly
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-COMBININGCHARS
#
# Apple does this for Terminal.app only in /etc/zshrc so we set it here also
# for iTerm
#
setopt combining_chars

# Never know when you're gonna need to popd!
setopt auto_pushd

# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# #################
# Setup starship.rs
# #################

eval "$(starship init zsh)"

# ####################
# Setup hook functions
# ####################

# chpwd() is executed by Zsh whenever the current working directory is changed
chpwd() {
  # Show contents of directory after cd-ing into it
  # set_title_to_cwd
  echo "Now in: $(pwd)"
  ls -lrthG
  echo "Now in: $(pwd)"
}

# #############
# Setup history
# #############
#
# HISTSIZE and SAVEHIST should have the same value because reasons - see
# http://zsh.sourceforge.net/Guide/zshguide02.html
#
#     > except for special reasons which I won't talk about, you should set
#     > $SAVEHIST to be no more than $HISTSIZE, though it can be less
#
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=$HOME/.zsh_history


source $HOME/.zsh/aliases
source $HOME/.zsh/functions


# Disable flow control commands (prevents C-s from freezing everything)
# stty start undef
# stty stop undef

# Setup our environment
# #####################

# Prevent Ctrl-s from sending XOFF and making it seem like the session is dead
stty ixany
stty ixoff -ixon

# I think this is for Tmux (can't remember)
TERM=xterm-256color

# export EDITOR="/usr/local/bin/vim"
export EDITOR="/opt/homebrew/bin/nvim"

# #########################
# Shell globbing
# #########################
setopt extendedglob # enable fancy extended glob syntax
setopt dotglob # include hidden files in shell globs

# ##################
# Setup window title
# ##################

DISABLE_AUTO_TITLE="true" # tell oh-my-zsh not to set title

# set title to whatever string you provide
# e.g.
#     eoin_title hi there
function eoin_title { # 'title' is already a shell alias so don't call it that
  echo -ne "\033]0;"$*"\007"
}

# Set the title to be the current working directory name
function eoin_set_title_to_cwd {
  # echo "Setting window/tab title to $(basename $PWD)"
  echo -ne "\033]0;"$(basename $PWD)"\007"
}

chpwd_functions=(${chpwd_functions[@]} "eoin_set_title_to_cwd")

eoin_set_title_to_cwd

# ############
# Python setup
# ############
#
# * We want to use pyenv to provide `python` to both interactive and
#   non-interactive shells

# Pass --no-rehash to prevent rehashing when we create a shell. This makes
# starting the shell *much* quicker.
# eval "$(rbenv init -)"
export PATH="${HOME}/.pyenv/shims:${PATH}"
eval "$(pyenv init - --no-rehash)"

# ##########
# PHP setup
# ##########
#
# * We want to use phpenv to provide `php` to both interactive and
#   non-interactive shells
#
#export PATH="$HOME/.phpenv/bin:$PATH:$HOME/.composer/vendor/bin"
#eval "$(phpenv init -)"

# ############
# Elixir setup
# ############

function load_exenv_if_available() {
  which exenv 1>/dev/null 2>&1
  if [[ $? == 0 ]]; then
    print -n "Loading elixir ... "
    eval "$(exenv init -)"
    print "done."
  fi
}
load_exenv_if_available

# #################
# Rails Development
# #################
export DISABLE_SPRING=1 # disable spring because I don't trust it

# ################
# Node Development
# ################

# function load_nvm() {
#   print -n "Loading nvm ... "
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#   print "done."
# }
#
# function load_nvm_if_nvmrc_exists_in_cwd() {
#   if [[ -r "${PWD}/.nvmrc" ]]; then
#     # nvm use prints stuff to stdout so we don't need to
#     print "Found .nvmrc file. Running 'nvm use'"
#     nvm use
#   fi
# }

# Add load_nvm_if_nvmrc_exists_in_cwd to the list of function zsh will run when you chdir
# chpwd_functions=(${chpwd_functions[@]} "load_nvm_if_nvmrc_exists_in_cwd")

# run load_nvm_if_nvmrc_exists_in_cwd() once at shell startup in case we are
# already in a dir with a .nvmrc
# load_nvm
# load_nvm_if_nvmrc_exists_in_cwd

# optional completions
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
# . <(npm completion) # enable npm tab completion

eval "$(nodenv init - --no-rehash)"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"

# #########################
# Setup Postgres
# #########################
# print "Setting up Postgres env vars"
export PGHOST=localhost
export PGUSER=postgres

# `psql` without any args should do what I mean!
export PGDATABASE="postgres"
export PG_COLOR=always


# #########################
# Custom local environments
# #########################

echo "Loading direnv"
eval "$(direnv hook zsh)"

# tell homebrew not to keep cached files for very long
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=3

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

# Stop run-help pointing at 'man' and instead load the actually useful version
# which comes with zsh. Then alias 'help' to it so my muscle memory continues
# to work.
unalias run-help
autoload run-help
alias help=run-help

# print "Enabling fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f"
# --height 40%
# export FZF_DEFAULT_OPTS="--border --preview 'head -100 {}' --inline-info"
export FZF_DEFAULT_OPTS="--border --preview 'head -100 {}'"
export FZF_DEFAULT_OPTS="--border"

# tabtab source for packages
# uninstall by removing these lines
# print "Configuring tab completion for serverless"
# [[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# print " .zshrc]"


export PATH="/opt/homebrew/sbin/:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# BEGIN SNIPPET: Platform.sh CLI configuration
# HOME=${HOME:-'/Users/eoinkelly'}
# export PATH="$HOME/"'.platformsh/bin':"$PATH"
# if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

# Opt-in to faster homebrew
# export HOMEBREW_INSTALL_FROM_API=1

# ################
# Ruby development
# ################
#
# * We want to use rbenv to provide `ruby` to both interactive and
#   non-interactive shells

# Pass --no-rehash to prevent rehashing when we create a shell. This makes
# starting the shell *much* quicker.
# eval "$(rbenv init -)
eval "$(rbenv init - --no-rehash)"
source /Users/eoinkelly/.config/op/plugins.sh
