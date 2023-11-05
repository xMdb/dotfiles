#!/bin/zsh

for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

echo "\nEnter a number for the colour:"
read colour_number

# Define the file
file=".p10k.zsh"

# Use sed to replace the line that matches the pattern with the new line
sed -E -i 's/  typeset -g POWERLEVEL9K_DIR_BACKGROUND=[0-9]+/  typeset -g POWERLEVEL9K_DIR_BACKGROUND='"$colour_number"'/' $file

echo "\nDone! Please restart your terminal to see the changes."
