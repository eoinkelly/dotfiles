##
# - `.zprofile` is sourced when entering login shells only (both interactive and non-interactive).
# - does same as `.zlogin` - `.zprofile` exists for ksh compatibility.
#
# vi: ft=zsh

# echo -n "[~/.zprofile"
# echo " ~/.zprofile]"
eval "$(/opt/homebrew/bin/brew shellenv)"
