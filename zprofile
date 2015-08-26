# vi: ft=zsh
# Initialisation that makes sense for both interactive and non-interactive
# shells
# ###########################

# `psql` without any args should do what I mean!
export PGDATABASE="postgres"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ##############
# Go Development
# ##############
export GOPATH="$HOME/code/go"
export PATH="$GOPATH/bin:$PATH"

# Add homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add xiki
export PATH="$HOME/xiki-bin:$PATH"

# Add node & npm
export PATH="/usr/local/share/npm/bin:$PATH"

# Add my little utilities
export PATH="$HOME/bin:$PATH"

# Add cabal
export PATH="$HOME/.cabal/bin:$PATH"

# android dev
# export GRADLE_HOME="/usr/local/Cellar/gradle/2.0" # used for homebrew gradle
export PATH="/usr/local/android-dev-tools/sdk/platform-tools:$PATH"
export PATH="/usr/local/android-dev-tools/sdk/tools:$PATH"

# for zip-align (will probably break sometime)
export PATH="/usr/local/android-dev-tools/sdk/build-tools/20.0.0:$PATH"


# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# We want the ./bin of rails apps we trust to be first on our path so that we
# can run bundler binstubs (and not have to type `bundle exec foo` everytime we
# want to run `foo).This little hack lets us have this convenience on git repos
# we consider "safe". Mark a repo as safe by creating an empty `.git/safe` dir
# in it.
export PATH=".git/safe/../../bin:$PATH"
