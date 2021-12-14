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

# Install oh-my-zsh
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# You might have to turn off some bits of the dotfiles
# which are not yet installed on the machine
# setup vim
# #########

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# open vim
:PluginInstall

git clone https://github.com/madumlao/phpenv.git ~/.phpenv

# finish fzf setup
$(brew --prefix)/opt/fzf/install
```

## Apple stuff


Keyboard prefs
    keyboard tab
        set fastest key repeating
        set shortest delay until repeat
    text tab
        turn off smart quotes
        turn off period after double space

```
defaults write -g ApplePressAndHoldEnabled -bool false
```
