# Eoin's dotfiles


# Setup new machine

This section is WIP

```bash
# install packages my config depends on
brew install neovim fzf pyenv rbenv nodenv direnv starship font-monaspace-nerd-font font-sauce-code-pro-nerd-font diff-so-fancy git stow vim

# setup dotfiles
# ##############
# use https because git ssh not set up yet
git clone https://github.com/eoinkelly/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash ./install-all-with-stow.sh

# Install oh-my-zsh
git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# setup vim
# #########
brew install neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
pyenv install <latest-python>
pyenv global <latest-python>
pip install pynvim
# open vim
:PluginInstall

# finish fzf setup
$(brew --prefix)/opt/fzf/install

# after installing vscode
./set-default-open-with-macos.sh


mkdir -p ~/Code/repos
git clone git@github.com:chriskempson/tomorrow-theme.git ~/Code/repos/tomorrow-theme
# set colors in tools as required
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
