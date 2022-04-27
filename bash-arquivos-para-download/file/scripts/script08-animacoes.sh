#!/bin/bash
# Script 08-animacoes
# Para fins didáticos do módulo e capítulo no Curso Extremamente Avançado de Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'

#----[ ORDEM PARA APRENDIZADO DAS ANIMAÇÕES ]----#

primeiro_movimento(){
	MAX=$(tput cols)
	setterm -cursor off
	A="A"
	for i in $(seq 1 $MAX);
		do
			echo -en "$A" | tr 'B' ' '
			sleep 0.1
			A="B""$A\r"
		done
	echo
	setterm -cursor on
}

frames(){
	# Ainda coloquei um reset no final pra resetar a tela
	MEIO_LINHA=$(( $(tput lines) / 2 ))
	MAX=$(tput cols)
	setterm -cursor off
	A="A"
	for i in $(seq 1 $MAX);
		do
			tput cup $MEIO_LINHA 0
			echo -en "$A" | tr 'B' ' '
			sleep 0.06
			A="B""$A\r"
		done
	echo
	setterm -cursor on
	reset
}

frente(){

	MEIO_LINHA=$(( $(tput lines) / 2 ))
	MAX=$(tput cols)
	L=0
	setterm -cursor off
	for i in $(seq 1 $MAX)
		do	
			clear		
			tput cup $MEIO_LINHA $L		
			echo "A"		
			sleep 0.08		
			let L=L+1
		done
	echo
	setterm -cursor on
	reset
}

atras(){
	MAX=$(tput cols)
	MEIO_LINHA=$(( $(tput lines) / 2 ))
	setterm -cursor off
	for i in $(seq 1 $MAX)
		do
			clear
			tput cup $MEIO_LINHA $MAX
			echo "A"
			sleep 0.08
			let MAX=MAX-1
		done
	echo
	setterm -cursor on
	reset
}

cima(){
	MAX=$(tput lines)
	MEIO_LINHA=$(( $(tput cols) / 2 ))
	setterm -cursor off
	for i in $(seq 1 $MAX)
		do 
			clear
			tput cup $MAX $MEIO_LINHA
			echo "A"
			sleep 0.08
			let MAX=MAX-1
		done
	echo
	setterm -cursor on
	reset
}

baixo(){
	MAX=$(tput lines)
	MEIO_LINHA=$(( $(tput cols) / 2 ))
	L=0
	setterm -cursor off
	for i in $(seq 1 $MAX)
		do 
			clear
			tput cup $L $MEIO_LINHA
			echo "A"
			sleep 0.08
			let L=L+1
		done
	echo
	setterm -cursor on
	reset
}

case $1 in

	1)  echo "A";echo " A"; echo "  A";echo "   A" ;;
	2)  A="A";for i in $(seq 1 8); do echo $A | tr 'B' ' ';A="B"$A; done ;;
	3)  echo -n "A"; echo -n " A"; echo -n "  A"; echo -n "   A"; echo ;;
	4)  echo -en "\rA";sleep 1;echo -en "\r A";sleep 1;echo -en "\r  A";sleep 1;echo -en "\r   A";sleep 1;echo ;;
	5)  A="A";for i in $(seq 1 18); do echo -en "$A" | tr 'B' ' ';sleep 0.5;A="B""$A\r";done;echo ;;
	6)  primeiro_movimento ;;
	7)  frames ;;
	8)  frente ;;
	9)  atras ;;
	10) cima ;;
	11) baixo ;;
	
	*) echo 'opção inválida' ;;
	
esac
