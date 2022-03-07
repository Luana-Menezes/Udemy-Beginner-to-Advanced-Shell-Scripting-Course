#!/bin/bash
# my comment

HELLO="HELLO, WORLD!"
echo $HELLO

world=("Shell Script" "Bash" "GNU" "Linux" "Debian" "del")
echo $world
world[0]="nada"
echo ${world[0]}
echo ${world[4]}
# count
echo ${#world[@]}
# show all elements
echo ${world[*]}
# array slices
echo ${world[@]:2}
echo ${world[@]:1:3}
#delete array element
unset world[5]
echo ${world[*]}
#delete array
unset world
echo $world