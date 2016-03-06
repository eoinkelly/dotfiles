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
# echo "Running zshenv: sourced for ALL zsh shells"

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

export PATH="$GOPATH/bin:$PATH"

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
# Ruby setup
# ##########
#
# * We want to use rbenv to provide `ruby` to both interactive and
#   non-interactive shells

# Pass --no-rehash to prevent rehashing when we create a shell. This makes
# starting the shell *much* quicker.
# eval "$(rbenv init -)"
eval "$(rbenv init - --no-rehash)"

# ############
# Elixir setup
# ############
eval "$(exenv init -)"


# ##########
# Node setup
# ##########
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
