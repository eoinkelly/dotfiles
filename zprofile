
## Initialisation that makes sense for both interactive and non-interactive shells
# ###########################

# `psql` without any args should do what I mean!
export PGDATABASE="postgres"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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

# Add android dev tools
export PATH="/usr/local/android-dev-tools/sdk/platform-tools:$PATH"
export PATH="/usr/local/android-dev-tools/sdk/tools:$PATH"

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
