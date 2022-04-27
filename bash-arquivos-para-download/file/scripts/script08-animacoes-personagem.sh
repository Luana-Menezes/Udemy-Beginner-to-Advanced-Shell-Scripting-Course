#!/bin/bash
char_doll(){
	clear;tput sc;setterm -cursor off
	char=(" o    " "/|\   " "/ \   " "\ o / " "  |   " " / \     " 
	" _ o " "  /\  " " | \  " "  __\o" " /) | " "      " "__|    " 
	"  \o  " "  ( \ " " \ /  " "  |   " " /o\  " "  |__ " " o/   " 
	"/ )   " "o/__  " "|  (\ " "      " "o _   " "/\    " "/ |   " 
	"\ o / " "  |   " " / \  ")
	C=0;T=1;M=2
	for i in {1..30}; do
		[[ "$C" = "${#char[@]}" ]] && C=0 && T=1 && M=2
		sleep 0.3
		clear
		tput cup 4 50
		echo -e "${char[$C]}"
		tput cup 5 50
		echo -e "${char[$T]}"
		tput cup 6 50
		echo -e "${char[$M]}"
		let C=C+3;let T=T+3;let M=M+3
	
	done
	setterm -cursor on
	tput rc
}
char_doll
