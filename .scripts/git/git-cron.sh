#!/bin/bash
cd ~/
git add .mutt
git add .muttrc
git add .screenlayout
git add .scripts
git add .vim
git add .Xauthority
git add .Xresources
git add .bashrc
git add .vimrc
git add .viminfo
git commit -m "Uploaded via cron at 7:10am mon - fri"
git push
