#!/bin/bash
# Script de aminação Ryu dando Hadouken
# 01 - baixa o gif
# 02 - combina as camadas que estão com (combine) com as logo abaixo (Combinar abaixo) , além de visualizar cada imagem para que estejam certamente combinadas 30 imagens, nesse caso
# 03 - Arquivo > Exportar como > GIF > marcar ([x] Como animação)
# 04 - Exportar
# 05 - convert ryu.gif ryu.jpg
# 06 - O áudio você também pode pegar da internet e convertê-lo com ffmpeg para wav se desejar

setterm -cursor off
interromper(){
	setterm --cursor on
	exit 0 
}
ryu_hadouken_move_sem_som(){
	while :
	do
		trap interromper SIGINT SIGTERM	
		for i in $(seq 0 30);
		do
			clear
			echo -e "\n\n\n\n"
			jp2a "../images/ryu/ryu-$i.jpg" | sed 's/M/ /g'
			sleep 0.1		
		done
	done
}

ryu_hadouken_move_com_som(){
	while :
	do
		trap interromper SIGINT SIGTERM	
		for i in $(seq 0 30);
		do
			clear
			echo -e "\n\n\n\n"		
			if [[ "$i" = "3" ]]; then
				jp2a "../images/ryu/ryu-3.jpg" | sed 's/M/ /g'
				$(aplay ../images/ryu/hadouken.wav 2>&-) &
				jp2a "../images/ryu/ryu-4.jpg" | sed 's/M/ /g'
			else
				jp2a "../images/ryu/ryu-$i.jpg" | sed 's/M/ /g'
				sleep 0.1
			fi		
		done
	done
}

case $1 in 
	--audio) ryu_hadouken_move_com_som ;;
	*) ryu_hadouken_move_sem_som ;;
esac
