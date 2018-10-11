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
echo "Commit message"
read message
git commit -m "$message"
git push
