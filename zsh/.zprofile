# vi: ft=zsh
# zprofile
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
# echo "Running zprofile: sourced for login zsh shells only" 
