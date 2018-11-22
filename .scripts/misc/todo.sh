#!/bin/bash
d=( $(date +%a))
if [[ $d == "Mon" ]]; then
cat ~/.scripts/docs/Mon.todo
elif [[ $d == "Tue" ]]; then
cat ~/.scripts/docs/Tue.todo
elif [[ $d == "Wed" ]]; then
cat ~/.scripts/docs/Wed.todo
elif  [[ $d == "Thu" ]]; then
cat ~/.scripts/docs/Thu.todo
else [[ $d == "Fri" ]]; 
cat ~/.scripts/docs/Fri.todo
fi
