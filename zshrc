# Initialisation for interactive shells only
# ##########################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="steeef"

# Never know when you're gonna need to popd!
setopt AUTO_PUSHD

# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Show contents of directory after cd-ing into it
chpwd() {
  echo "Now in: $(pwd)"
  ls -lrthG
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions


# Stuff I got from r00k's zshrc that i'm not sure I need:
# Disable flow control commands (keeps C-s from freezing everything)
# stty start undef
# stty stop undef

# Setup our environment
# #####################

# Prevent Ctrl-s from sending XOFF and making it seem like the session is dead
stty ixany
stty ixoff -ixon

# ################
# Ruby development
# ################

# https://gist.github.com/1688857
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
export RUBY_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
# For 100k+ lines rails apps consider
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_FREE_MIN=500000
# export RUBY_HEAP_MIN_SLOTS=40000

# I think this is for Tmux (can't remember)
TERM=screen-256color

export EDITOR="/usr/local/bin/vim"

# ###################
# Android Development
# ###################

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/android-dev-tools/sdk

# ################
# Node Development
# ################

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# enable npm tab completion
. <(npm completion)

# ##############
# Keychain Setup
# ##############

# my keys all begin with id_rsa so this loads them all
keychain --agents ssh ~/.ssh/id_rsa ~/.ssh/id_rsa_deploy
. ~/.keychain/$(hostname)-sh

# #################
# oCaml development
# #################

# OPAM configuration
. /Users/eoinkelly/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# #########################
# Custom local environments
# #########################

eval "$(direnv hook zsh)"

# #########################
# Shell globbing
# #########################
setopt extendedglob # enable fancy extended glob syntax
setopt dotglob # include hidden files in shell globs
