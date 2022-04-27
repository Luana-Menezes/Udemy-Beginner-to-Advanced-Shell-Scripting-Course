#!/bin/bash
# Script de animação Ryu dando Hadouken
setterm -cursor off
interromper(){
	setterm --cursor on
	exit 0 
}
while :
do
	trap interromper SIGINT SIGTERM
	
	for i in $(seq 0 30);
	do
		clear
		echo -e "\n\n\n\n"		
		if [[ "$i" = "3" ]]; then
			jp2a "ryu-3.jpg" | sed 's/M/ /g'
			$(aplay hadouken.wav 2>/dev/null) &
			jp2a "ryu-4.jpg" | sed 's/M/ /g'
		else
			jp2a "ryu-$i.jpg" | sed 's/M/ /g'
			sleep 0.08
		fi
		
	done
	
	#$(aplay hadouken.wav 2>/dev/null)
	#sleep 0.1

done
