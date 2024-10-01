# Eoin's dotfiles


# Setup new machine

This section is WIP

```
brew install fzf neovim pyenv rbenv nodenv direnv
brew install font-monaspace-nerd-font font-sauce-code-pro-nerd-font diff-so-fancy

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
pyenv install <latest-python>
pyenv global <latest-python>
pip install pynvim
# open vim
:PluginInstall

git clone https://github.com/madumlao/phpenv.git ~/.phpenv

# finish fzf setup
$(brew --prefix)/opt/fzf/install

rbenv install 3.something_modern
pyenv install 3.something_modern

# after installing vscode
./set-default-open-with-macos.sh

```

## Apple stuff


* Finder sidebar
    * show filename extension
    * enable the shortcuts I like in finder sidebar
    * show hidden files `cmd-shift-.`
* copy `private_bin` dir from old and wire it up
* change keyboard modifier keys to match microsoft keyboard (swap option and cmd)
* Keyboard prefs
    ```
    keyboard tab
        set fastest key repeating
        set shortest delay until repeat
    text tab
        turn off smart quotes
        turn off period after double space
    ```

Setup key repeating the way I like:

```
defaults write -g ApplePressAndHoldEnabled -bool false
# needs a restart to take hold
```
