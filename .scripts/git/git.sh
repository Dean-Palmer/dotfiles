#!/bin/bash
git add ~/.screenlayout
git add ~/.scripts
git add ~/.vim
git add ~/.Xauthority
git add ~/.Xresources
git add ~/.bashrc
git add ~/.vimrc
git add ~/.xinitrc
git add ~/.muttrc
git add ~/.config/i3/config
git add ~/.config/polybar/config
git add ~/.config/ranger/
echo "Commit message"
read message
git commit -m "$message"
git push
