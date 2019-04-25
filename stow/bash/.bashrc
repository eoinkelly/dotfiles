# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

COLOR_PREFIX="\[\033[0;38;5;"
COLOR_POSTFIX="m\]"

COLOR_OFF="\[\033[0m\]"       # Text Reset
GREEN="154"
YELLOW="178"
BLUE="27"
PURPLE="140"
RED="9"
ORANGE="208"
AQUA="87"

### Keychain Setup
# keychain --nocolor ~/.ssh/id_rsa
# . ~/.keychain/$HOSTNAME-sh

### Git Stuff

# function _git_prompt() {
#     local git_status="`git status -unormal 2>&1`"
#     if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
#         if [[ "$git_status" =~ nothing\ to\ commit ]]; then
#             local ansi=42
#         elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
#             local ansi=43
#         else
#             local ansi=45
#         fi
#         if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
#             branch=${BASH_REMATCH[1]}
#             test "$branch" != master || branch=' '
#         else
#             # Detached HEAD.  (branch=HEAD is a faster alternative.)
#             branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
#                 echo HEAD`)"
#         fi
#         #echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
#         echo -n "$COLOR_PREFIX$ansi$COLOR_POSTFIX$branch$COLOR_OFF "
#     fi
# }
#
# function _prompt_command() {
#     PS1="`_git_prompt`$PS1"
# }
# PROMPT_COMMAND=_prompt_command

function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        #remote_pattern="# Your branch is (.*) of"
        remote_pattern="# Your branch is (.*) " # trailing space important here!
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status} =~ ${not_staged_pattern} ]]; then
            state=" ✔"
        fi

        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote=" ↑"
            else
                remote=" ↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote=" +"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote=" ✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote=" ↕"
        fi

        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi
        branch="${COLOR_PREFIX}${YELLOW}${COLOR_POSTFIX}${branch}${COLOR_OFF}"

        echo "${branch}${state}${remote}"
    fi
    return
}

# alias ga='git add'
# alias gp='git push'
# alias gl='git log'
# alias gs='git status'
# alias gd='git diff'
# alias gdc='git diff --cached'
# alias gm='git commit -m'
# alias gma='git commit -am'
# alias gb='git branch'
# alias gc='git checkout'
# alias gra='git remote add'
# alias grr='git remote rm'
# alias gpu='git pull'
# alias gcl='git clone'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# ps1_rvm() {
#   command -v rvm-prompt >/dev/null 2>&1 && printf "%s" " $(rvm-prompt) "
# }

# RVM_PART_OF_PROMPT=$(~/.rvm/bin/rvm-prompt v p g)
# RVM_PART_OF_PROMPT=$(echo 'hello')
# GIT_PART_OF_PROMPT=$(parse_git_branch)

function prompt_command {
	# RVM_PART_OF_PROMPT=$(~/.rvm/bin/rvm-prompt v p g)
	RVM_PART_OF_PROMPT=""
	GIT_PART_OF_PROMPT=$(parse_git_branch)
	# GIT_PART_OF_PROMPT=""
	export PS1="${debian_chroot:+($debian_chroot)}\u@\h[$COLOR_PREFIX$PURPLE$COLOR_POSTFIX$RVM_PART_OF_PROMPT$COLOR_OFF][$GIT_PART_OF_PROMPT]:$COLOR_PREFIX$BLUE$COLOR_POSTFIX\w$COLOR_OFF\$ "
}

export PROMPT_COMMAND=prompt_command

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias tmux='tmux -2'
alias pryr='pry -r ./config/environment'

alias netrst='sudo service networking restart'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Setup our environment
# #####################

# https://gist.github.com/1688857
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
export EDITOR=/usr/bin/vim
# For 100k+ lines rails apps consider
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_FREE_MIN=500000
# export RUBY_HEAP_MIN_SLOTS=40000

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$HOME/.cabal/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

TERM=xterm-256color

# Setup Bash Shortcuts
# ####################

# Enable vi shortcuts in bash
# set -o vi
 # ^l clear screen
# bind -m vi-insert "\C-l":clear-screen

# Prevent Ctrl-s from sending XOFF and making it seem like the session is dead
stty ixany
stty ixoff -ixon

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
