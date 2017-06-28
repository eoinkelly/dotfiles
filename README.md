# Eoin's dotfiles


# Setup new machine

This section is WIP

```
# setup dotfiles
# ##############
brew install git stow vim
git clone repo ~/.dotfiles
cd ~/.dotfiles
bash ./install-all-with-stow.sh

# You might have to turn off some bits of the dotfiles
# which are not yet installed on the machine
# setup vim
# #########

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# open vim
:PluginInstall
```
