#!/usr/bin/env bash

stow_packages_dir="$HOME/.dotfiles/stow"
stow_target_dir=$HOME

for d in `ls $stow_packages_dir`;
do
  # -R = restow (delete and then stow)
  # -v = be verbose
  ( stow -vR $d --target=$stow_target_dir --dir=$stow_packages_dir )
done
