# vi: ft=zsh
#
# zshrc
#
# * Sourced for interactive shells only
#
# Good choice for:
#
# * aliases
# * functions
# * color themes
# * key bindings
# * commands that need a tty
# * commands that produce output
#
# Bad choice for:
#
# * environment setup that would be needed by both interactive shells and
#   shells spawned by other processes e.g. text editors
#
# Details: http://zsh.sourceforge.net/Intro/intro_3.html
#

print "Starting .zshrc (run for interactive shells only)"

print "START: oh-my-zsh setup"
# See ~/.oh-my-zsh/templates/zshrc.zsh-template for default oh-my-zsh options
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="" # I'm not using oh-my-zsh to manage the theme
export UPDATE_ZSH_DAYS=30
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=()
source $ZSH/oh-my-zsh.sh
print "END: oh-my-zsh setup"

# ###########
# Setup Theme
# ###########

source  ~/.zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv virtualenv nvm vcs)
# rust_version virtualenv
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status) # also available: history, time
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
export DEFAULT_USER=eoinkelly

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

export EDITOR="/usr/local/bin/vim"

# #########################
# Shell globbing
# #########################
setopt extendedglob # enable fancy extended glob syntax
setopt dotglob # include hidden files in shell globs

# `psql` without any args should do what I mean!
export PGDATABASE="postgres"

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
  echo "Setting window/tab title to $(basename $PWD)"
  echo -ne "\033]0;"$(basename $PWD)"\007"
}

chpwd_functions=(${chpwd_functions[@]} "eoin_set_title_to_cwd")

eoin_set_title_to_cwd

# ##########
# Ruby setup
# ##########
#
# * We want to use rbenv to provide `ruby` to both interactive and
#   non-interactive shells

print "START ruby"
# Pass --no-rehash to prevent rehashing when we create a shell. This makes
# starting the shell *much* quicker.
# eval "$(rbenv init -)"
eval "$(rbenv init - --no-rehash)"
print "END ruby"

# ############
# Elixir setup
# ############
print "START elixir"
eval "$(exenv init -)"
print "END elixir"

# #################
# Rails Development
# #################
export DISABLE_SPRING=1 # disable spring because I don't trust it

# ################
# Node Development
# ################

print "START node"

function load_nvm() {
  print -n "Loading nvm ... "
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  print "done."
}

function load_nvm_if_nvmrc_exists_in_cwd() {
  if [[ -r "${PWD}/.nvmrc" ]]; then
    print "Found .nvmrc in current working dir."
    load_nvm
  fi
}

# Add load_nvm_if_nvmrc_exists_in_cwd to the list of function zsh will run when you chdir
# chpwd_functions=(${chpwd_functions[@]} "load_nvm_if_nvmrc_exists_in_cwd")

# run load_nvm_if_nvmrc_exists_in_cwd() once at shell startup in case we are
# already in a dir with a .nvmrc
# load_nvm_if_nvmrc_exists_in_cwd
load_nvm

# optional completions
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
# . <(npm completion) # enable npm tab completion

print "END node"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"

# #########################
# Custom local environments
# #########################

eval "$(direnv hook zsh)"

echo "Finished .zshrc"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eoinkelly/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/eoinkelly/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eoinkelly/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/eoinkelly/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
