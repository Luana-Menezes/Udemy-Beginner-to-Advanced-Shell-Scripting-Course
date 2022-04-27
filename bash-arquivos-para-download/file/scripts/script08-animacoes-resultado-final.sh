#!/bin/bash
# Script 08-animacoes-resultado-final
# Para fins didáticos do módulo e capítulo no Curso Extremamente Avançado de Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
r='\e[31;1m'
b='\e[36;1m'
g='\e[32;1m'
y='\e[33;1m'
o='\e[m'
clear
ctrl_c(){
	setterm -cursor on
	clear
	echo -e '\rSaindo após Ctrl+c e ligando novamente o cursor'
	reset
	exit 1
}
trap ctrl_c SIGINT SIGTERM
setterm -cursor off
LINE=10
COL=45
tput cup $LINE $COL
echo ▅
while true;
	do		
		if [[ "$COL" < "60" && "$LINE" = "10" ]];
			then
				let COL=COL+1
				clear
				tput cup $LINE $COL
				echo -e "$g►"
				sleep 0.2
		fi
		
		if [[ "$COL" = "60" && "$LINE" < "15" ]];
			then
				let LINE=LINE+1
				clear
				tput cup $LINE $COL
				echo -e "$y▼"
				sleep 0.2
		fi
		
		if [[ "$COL" > "45" && "$LINE" = "15" ]];
			then
				let COL=COL-1
				clear
				tput cup $LINE $COL
				echo -e "$r◀"
				sleep 0.2
		fi
		
		if [[ "$COL" = "45" && "$LINE" > "10" ]];
			then
				let LINE=LINE-1
				clear	
				tput cup $LINE $COL
				echo -e "$b▲"
				sleep 0.2
		fi
		
done
setterm -cursor on
