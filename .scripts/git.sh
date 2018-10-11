#!/bin/bash
git add ~/.mutt
git add ~/.screenlayout
git add ~/.scripts
git add ~/.vim
git add ~/.Xauthority
git add ~/.Xresources
git add ~/.bashrc
git add ~/.vimrc
git add ~/.xinitrc

read message

echo "Commit message"

git commit -m "$message"

git push
