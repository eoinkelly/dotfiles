##
# There are 4 kinds of zsh shell:
#
# 1. login + interactive
# 2. login + non-interactive
# 3. non-login + interactive
# 4. non-login + non-interactive
#
# This file:
#
# * is the **only** zsh startup file run for **all** shells
# * is run immediately after running /etc/zshenv (assuming that file exists)
#
# Good choices for this file:
#
# * Anything that should be availble to both interactive shell environments and
#   shells spawned by other processes e.g. a text editor
# * Setting environment variables e.g. PATH
#
# Bad choices for this file:
#
# * any command that produces output
# * any command that assumes it is connected to a tty
#
# Details: http://zsh.sourceforge.net/Intro/intro_3.html
#
echo "Loading .zshenv"

# ##########
# PATH setup
# ##########
#
# * ALl path setup for my shell happens here!
# * I have moved everything PATH related from /etc/zprofile to here as it was
#   making this very confusing

# Add the system paths first so that I can reliably prepend my custom dirs to
# PATH. This has been moved from /etc/zprofile so that I can keep all PATH
# stuff here.
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add xiki
export PATH="$HOME/xiki-bin:$PATH"

# Add node & npm
export PATH="/usr/local/share/npm/bin:$PATH"

# Add cabal
export PATH="$HOME/.cabal/bin:$PATH"

export PATH="/usr/local/android-dev-tools/sdk/platform-tools:$PATH"
export PATH="/usr/local/android-dev-tools/sdk/tools:$PATH"

# for zip-align (will probably break sometime)
export PATH="/usr/local/android-dev-tools/sdk/build-tools/20.0.0:$PATH"

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Load exenv (elixir)
export PATH="$HOME/.exenv/bin:$PATH"

# Load rabid toolbelt
export PATH="$HOME/Code/rabid-toolbelt/bin:$PATH"

# We want the ./bin of rails apps we trust to be first on our path so that we
# can run bundler binstubs (and not have to type `bundle exec foo` everytime we
# want to run `foo).This little hack lets us have this convenience on git repos
# we consider "safe". Mark a repo as safe by creating an empty `.git/safe` dir
# in it.
# export PATH=".git/safe/../../bin:$PATH"

# Add my little utilities last (so they are found first)
export PATH="$HOME/bin:$PATH"

# add ssh-tools
export PATH="$HOME/bin/ssh-tools:$PATH"

# add PHP composer global tools
export PATH="$HOME/.composer/vendor/bin:$PATH"
# ##########
# Rust setup
# ##########

export PATH="$HOME/.cargo/bin:$PATH"

# ##########
# Flutter setup
# ##########

export PATH="$HOME/flutter_dev/flutter/bin:$PATH"


# ##################
# Elixir Development
# ##################

# iex needs an editor which won't take over the terminal so we use code instead
# of vim. Help available at
#
#   iex> h open
#
export ELIXIR_EDITOR="code --goto __FILE__:__LINE__"

# ###################
# Android Development
# ###################

export JAVA_HOME=$(/usr/libexec/java_home)
# export ANDROID_HOME=/usr/local/android-dev-tools/sdk
# export GRADLE_HOME="/usr/local/Cellar/gradle/2.0" # used for homebrew gradle

# #################
# Python development
# #################

export PATH="$HOME/.local/bin:$PATH"

export PIP_CONFIG_FILE=$HOME/.pip.conf

# Stop python from creating __pycache__/ dirs everywhere
export PYTHONDONTWRITEBYTECODE=1

# Tell virtualenvwrapper to use pyenv python
# export VIRTUALENVWRAPPER_PYTHON=/Users/eoinkelly/.pyenv/shims/python

#export WORKON_HOME=$HOME/python-envs
# source /usr/local/bin/virtualenvwrapper.sh

# #################
# oCaml development
# #################

# OPAM configuration
# . /Users/eoinkelly/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# #################
# Go development
# #################

export GOPATH="$HOME/code/go/gopath"
export PATH="$GOPATH/bin:$PATH"

# #################
# Rust development
# #################

# rust auto completer (r_a_c_er)
export RUST_SRC_PATH="$HOME/Code/rust/src"

# #################
# Eoin's little helpers
# #################

# Stuff that I don't want to share with the world in my dotfiles
export PATH=$HOME/private_bin:$PATH

# Add custom work dev tools
export PATH=$HOME/Code/bitbucket.org/rabidtech/fairfax-dev-tools/bin:$PATH
export PATH=$HOME/code/bitbucket.org/rabidtech/rabid-toolbelt/bin:$PATH

# Allow running Visual studio Code from command line
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

# Fix problem that puma and many other things have with fork() on Catalina
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# echo " ~/.zshenv]"
. "$HOME/.cargo/env"


