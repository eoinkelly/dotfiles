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

echo "Starting .zshrc (run for interactive shells only)"

# #############
# Theme
# #############

source  ~/.zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status) # also available: history, time
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
export DEFAULT_USER=eoinkelly

# Never know when you're gonna need to popd!
setopt AUTO_PUSHD

# Instruct zsh to trust the terminal to display combining characters correctly
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-COMBININGCHARS
#
# Apple does this for Terminal.app only in /etc/zshrc so we set it here also
# for iTerm
#
setopt COMBINING_CHARS

# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Show contents of directory after cd-ing into it
chpwd() {
  echo "Now in: $(pwd)"
  ls -lrthG
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
alias history='fc -il 1' # show history with yyyy-mm-dd timestamp
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# #################
# Setup directories
# #################

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

##
# These are config options left-over from oh-my-zsh - they seem useful so I
# might copy & paste their code form oh-my-zsh someday
#
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"
# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

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

# ################
# Ruby development
# ################

# https://gist.github.com/1688857
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
# export RUBY_HEAP_INIT_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_HEAP_FREE_MIN=500000
# For 100k+ lines rails apps consider
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_FREE_MIN=500000
# export RUBY_HEAP_MIN_SLOTS=40000

# disable spring
export DISABLE_SPRING=1

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
# source $(brew --prefix nvm)/nvm.sh # more flexible but even slower
source /usr/local/opt/nvm/nvm.sh # this is pretty slow
. <(npm completion) # enable npm tab completion

# #################
# oCaml development
# #################

# OPAM configuration
# . /Users/eoinkelly/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# #########################
# Custom local environments
# #########################

eval "$(direnv hook zsh)"

# #########################
# Shell globbing
# #########################
setopt extendedglob # enable fancy extended glob syntax
setopt dotglob # include hidden files in shell globs

# `psql` without any args should do what I mean!
export PGDATABASE="postgres"
export GOPATH="$HOME/code/go"

# android dev
# export GRADLE_HOME="/usr/local/Cellar/gradle/2.0" # used for homebrew gradle

# rust auto completer (r_a_c_er)
export RUST_SRC_PATH="$HOME/Code/rust/src"

export PATH=$HOME/code/bitbucket.org/rabidtech/rabid-toolbelt/bin:$PATH

# Add scripts etc. that I don't want to share with the world
export PATH=$HOME/private_bin:$PATH

# Add custom dev tools for a specific project
export PATH=$HOME/Code/bitbucket.org/rabidtech/fairfax-dev-tools/bin:$PATH

export PATH=$HOME/Library/Python/3.6/bin:$PATH

# ##################
# Setup window title
# ##################

# set title to whatever string you provide
# e.g.
#     title hi there
function title {
  echo -ne "\033]0;"$*"\007"
}

# Set the title to be the current working directory name
function set_title_to_cwd {
  echo -ne "\033]0;"$(basename $PWD)"\007"
}

# Invoke command to automatically set the tab/window title
set_title_to_cwd

echo "Finished .zshrc"
