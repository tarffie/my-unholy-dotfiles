#! /bin/bash

echo 'updating repo files'
# moving the files to their correct locations 
cp /home/$USER/.emacs /home/$USER/opt/my-unholy-dotfiles/
cp -r /home/$USER{/.emacs.d,/.vim,/.vimrc} /home/$USER/opt/my-unholy-dotfiles/
cp -r /home/$USER/.config{/i3,/picom,/rofi,/polybar,} /home/$USER/opt/my-unholy-dotfiles

echo 'repo files updated'
