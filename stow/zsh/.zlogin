# vi: ft=zsh

# zlogin
#
# * sourced when entering login shells only
# * Similar function to .zprofile (.zprofile exists to make ksh fans happy)
#
# Good:
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
echo "Starting .zlogin (run when entering a zsh login shell)"
echo "Finished .zlogin"
