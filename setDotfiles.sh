#! /bin/bash

echo 'starting setup...'
# moving the files to their correct locations 
cp -r {.emacs,.emacs.d/,vim/.vim/,vim/.vimrc} /home/$USER/
cp -r /home/$USER/opt/my-unholy-dotfiles{/i3,/picom,/rofi,/polybar,} /home/$USER/

mkdir /home/$USER{/notes,/.bkp,/.wallpapers}
