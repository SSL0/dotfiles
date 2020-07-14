#!/bin/sh

PACMAN=$(checkupdates | wc -l)
YAY=$(yay -Qun | wc -l)

echo "Updates: $(($PACMAN+$YAY))" 
