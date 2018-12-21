#!/bin/bash

# This script is to make mupdf easier to use because adding & to then end of the command every time annoyed me and I could not figure out how to add it in as an alias then I decided to add the listing of all the dirs.
# To modify this script to your env change the dir variable to the root dir for you pdfs this is made with having separate directories organizing your PDF's.
# Typing the wrong file or dir name when selecting a PDF will drop you back to the select dir part of the while loop so if you go into the wrong dir you can just type anyting as long as it is not a pdf do go back.
# You can customize the color output too by editing the color vars using ANSI escape codes.

# dir var and ls command
dir=~/Projects/Work/PDF
list=( $( ls $dir ))

# Color vars
orange='\033[0;33m'
red='\033[0;31m'
purple='\033[0;35m'
# Asks the user what pdf folder they want go into.
# Lists the dirs so the user know what files there are to pick from and then accepts user input for a folder name.
while true ; do
clear
echo -e "${red}What pdf folder?" 
echo -e "${orange} ${list[*]}"
read folder

# If the dir  or file the user typed is not there then echo "No such dir check spelling etc."
if [[ -d $dir/$folder ]]; then 
	clear
	cd $dir/$folder
	echo -e "${red}Pick a PDF to open."
	ls --color=auto
	echo -e "${purple}"
	read pdf

	if [[ -e $dir/$folder/$pdf ]]; then
		mupdf ~/Projects/Work/PDF/$folder/$pdf &
		clear
		exit
	fi
else
	continue
fi
done
