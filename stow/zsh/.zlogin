# vi: ft=zsh

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
# * is sourced when entering login shells only (1. and 2. above)
# * is similar function to .zprofile (.zprofile exists to make ksh fans happy)
#
# Good chocies for this file:
#
# * set terminal type
# * run login commands e.g. uptime or fortune
#
# Bad
#
# * anything that changes the shell environment
#
# Details: http://zsh.sourceforge.net/Intro/intro_3.html
#
echo -n "[~/.zlogin"
echo " ~/.zlogin]"
