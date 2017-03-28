# zshenv
#
# * sourced for ALL zsh shells
#
# Good:
#
# * Anything that should be availble to both interactive shell environments and
#   shells spawned by other processes e.g. a text editor
# * Setting environment variables e.g. PATH
#
# Bad:
#
# * any command that produces output
# * any command that assumes it is connected to a tty
#
# Details: http://zsh.sourceforge.net/Intro/intro_3.html
#
# echo "Starting .zshenv (run for all zsh shells)"

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

# ##########
# Rust setup
# ##########

export PATH="$HOME/.cargo/bin:$PATH"

# ###################
# Android Development
# ###################

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/android-dev-tools/sdk
# export GRADLE_HOME="/usr/local/Cellar/gradle/2.0" # used for homebrew gradle

# #################
# Python development
# #################
#
export PATH=$HOME/Library/Python/3.6/bin:$PATH

# #################
# oCaml development
# #################

# OPAM configuration
# . /Users/eoinkelly/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# #################
# Go development
# #################

export GOPATH="$HOME/code/go"
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

# echo "Finished .zshenv"
