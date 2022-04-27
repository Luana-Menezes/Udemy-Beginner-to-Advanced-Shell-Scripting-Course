#!/bin/bash
# Script 09-games
# Para fins didáticos do módulo e capítulo no Curso Extremamente Avançado de Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'

_reply(){
	while true;
		do
			read -sn 1
			echo -n "Você digitou o caractere: '$REPLY'"
			if [[ "$REPLY" = "q" ]]; then
					echo "Você digitou 'q', o script será interrompido."
					exit 0
			fi
		done
}

_teclas(){
	while true;
		do
			read -sn 1
			case "$REPLY" in
				h|H) echo 'Esquerda';;
				l|L) echo 'Direita';;
				k|K) echo 'Cima';;
				j|J) echo 'Baixo';;
				q|Q) echo 'Saindo...'; exit 0;;
			esac
		done
}

_move(){
	clear
	tput sc
	setterm -cursor off
	A=$(( $(tput lines) / 2 ))
	B=$(( $(tput cols) / 2 ))
	tput cup "$A" "$B"
	echo -n "X"
	while true;
		do
			tput cup "$A" "$B"
			echo -n "X"
			read -sn 1
			case "$REPLY" in
				h|H) let B=B-1;;
				l|L) let B=B+1;;
				k|K) let A=A-1;;
				j|J) let A=A+1;;
				q|Q) setterm -cursor on; tput rc; exit 0;;
			esac
			clear
		done
}

_game_init(){
	clear
	tput sc

	_terminal=$(stty -g)
	stty -echo -icanon -icrnl min 0 #time 0
	tput civis

	function ctrl_c {
		echo 'Você apertou Ctrl+c, saindo de forma certa agora!'
		stty echo
		tput cvvis
		clear
		exit 1
	}

	trap ctrl_c SIGINT SIGTERM

	A=$(( $(tput lines) / 2 ))
	B=$(( $(tput cols) / 2 ))
	tput cup "$A" "$B"
	echo -n "X"

	CIMA=$(echo -ne '\e[A')
	ESQUERDA=$(echo -ne '\e[D')
	DIREITA=$(echo -ne '\e[C')
	BAIXO=$(echo -ne '\e[B')
	BACKSPACE=$(printf '\x7f')
	SPACE=$(printf '\x20') # podia usar também: " "
	ENTER=$(printf '\x0d')
	ESC=$(printf '\x1b')

	tput cup "$A" "$B"
	echo -n "X"

	function LeituraTeclado {

			TECLA=$(dd bs=3 count=1 2>/dev/null)	
			case "$TECLA" in
				$ESQUERDA) let B=B-1;;
				$DIREITA) let B=B+1;;
				$CIMA) let A=A-1;;
				$BAIXO) let A=A+1;;
				$ESC) stty echo; tput cvvis; tput rc; exit 0;;
			esac

	}

	while true; do
			tput cup "$A" "$B"
			echo -n "X"
			sleep 0.03
			LeituraTeclado
			clear
	done
}

_game_limit(){
	clear
	tput sc

	#_terminal=$(stty -g)
	stty -echo -icanon -icrnl min 0 #time 0
	tput civis

	function ctrl_c {
		echo 'Você apertou Ctrl+c, saindo de forma certa agora!'
		stty echo
		tput cvvis
		clear
		exit 1
	}

	trap ctrl_c SIGINT SIGTERM

	A=$(( $(tput lines) / 2 ))
	B=$(( $(tput cols) / 2 ))

	CIMA=$(echo -ne '\e[A')
	ESQUERDA=$(echo -ne '\e[D')
	DIREITA=$(echo -ne '\e[C')
	BAIXO=$(echo -ne '\e[B')
	BACKSPACE=$(printf '\x7f')
	SPACE=$(printf '\x20') # podia usar também: " "
	ENTER=$(printf '\x0d')
	ESC=$(printf '\x1b')

	tput cup "$A" "$B"
	echo -n "X"

	function LeituraTeclado {

			TECLA=$(dd bs=3 count=1 2>/dev/null)	
			case "$TECLA" in
				$ESQUERDA) let B=B-1;;
				$DIREITA) let B=B+1;;
				$CIMA) let A=A-1;;
				$BAIXO) let A=A+1;;
				$ESC) stty echo; tput cvvis; tput rc; exit 0;;
			esac

	}

	while true; do
			cat 'area.map'
			tput cup "$A" "$B"
			echo -n "X"
			sleep 0.03
			LeituraTeclado
			clear
	done
}

_game_alvo(){
	clear
	tput sc
	stty -echo -icanon -icrnl min 0 #time 0
	tput civis

	function ctrl_c {
		echo 'Você apertou Ctrl+c, saindo de forma certa agora!'
		stty echo
		tput cvvis
		clear
		exit 1
	}

	trap ctrl_c SIGINT SIGTERM

	A=$(( $(tput lines) / 2 ))
	B=$(( $(tput cols) / 2 ))
	S=-1

	CIMA=$(echo -ne '\e[A')
	ESQUERDA=$(echo -ne '\e[D')
	DIREITA=$(echo -ne '\e[C')
	BAIXO=$(echo -ne '\e[B')
	BACKSPACE=$(printf '\x7f')
	SPACE=$(printf '\x20')
	ENTER=$(printf '\x0d')
	ESC=$(printf '\x1b')

	ALVO(){
		E=5
		tput cup $E $F
		echo "$1"
	}

	TIRO(){
		C=$1
		D=$2
	
		while [[ "$C" > "0" ]];do
			tput cup $C $D
			echo -n "•"
			let C=C-1
			sleep 0.008
		done
	
	}

	SCORE(){
		let S=S+1
	}

	function LeituraTeclado {

			TECLA=$(dd bs=3 count=1 2>/dev/null)	
			case "$TECLA" in
				$ESQUERDA)
					if [[ "$B" != "20" ]]; then
						let B=B-1
					fi
				;;
				$DIREITA)
					if [[ "$B" != "107" ]]; then
						let B=B+1
					fi			
				;;
				$CIMA)
					if [[ "$A" != "1" ]]; then
						let A=A-1
					fi			
				;;
				$BAIXO)
					if [[ "$A" != "28" ]]; then
						let A=A+1
					fi
				;;
				$SPACE)
					TIRO "$A" "$B"
				;;
				$ESC) stty echo; tput cvvis; tput rc; clear; exit 0;;
			esac

	}

	while true; do
		
			LeituraTeclado		
			clear
			cat 'area.map'		
			tput cup 1 97
			echo "Score: $S"		
			if [[ "$D" = "$F" ]]; then
					ALVO " "
					SCORE
					F=$(echo $(( ( RANDOM % 70 )  + 20 )))
			else
					ALVO "╳"
			fi		
			tput cup $A $B		
			echo "╽"
			sleep 0.03
		
	done
}

_game_semi_pronto(){
	clear
	tput sc
	stty -echo -icanon -icrnl min 0 #time 0
	tput civis

	function ctrl_c {
		stty echo
		tput cvvis
		clear
		exit 1
	}

	trap ctrl_c SIGINT SIGTERM

	A=23
	B=$(( $(tput cols) / 2 ))
	F=107
	S=0

	CIMA=$(echo -ne '\e[A')
	ESQUERDA=$(echo -ne '\e[D')
	DIREITA=$(echo -ne '\e[C')
	BAIXO=$(echo -ne '\e[B')
	BACKSPACE=$(printf '\x7f')
	SPACE=$(printf '\x20')
	ENTER=$(printf '\x0d')
	ESC=$(printf '\x1b')

	TANQUE(){
		tput cup $A $B
		echo -en "╽"
		tput cup $(($A+1)) $B
		echo -en "█"
		tput cup $(($A+2)) $(( $B - 3))
		echo -en "███████"
		tput cup $(($A+3)) $(( $B - 7))
		echo -en "▂▄▅█████████▅▄▃▂"
		tput cup $(($A+4)) $(( $B - 10))
		echo -en "[███████████████████]"
		tput cup $(($A+5)) $(( $B - 9))
		echo -en "..◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙◤.."
	}

	ALVO(){
		E=5
		if [[ "$F" -lt "20" ]];then
			F=107
		fi
	
		if [[ "$2" = "1" ]];then
				tput cup $(( $E - 1 )) $(( $F - 1 ))
				echo -en "\e[31;1m•\e[m"
				tput cup $(( $E + 1 )) $(( $F + 1 ))
				echo -en "\e[31;1m•\e[m"				
				tput cup $(( $E - 1 )) $(( $F + 1 ))
				echo -en "\e[31;1m•\e[m"
				tput cup $(( $E + 1 )) $(( $F - 1 ))
				echo -en "\e[31;1m•\e[m"
							
		fi
	
		tput cup $E $F
		echo -e "$1"
	}

	TIRO(){
		C=$1
		D=$2
	
		while [[ "$C" > "0" ]];do
			tput cup $C $D
			echo -n "•"
			let C=C-1
			sleep 0.008
		done
	
	}

	SCORE(){
		let S=S+1
	}

	function LeituraTeclado {

			TECLA=$(dd bs=3 count=1 2>/dev/null)	
			case "$TECLA" in
				$ESQUERDA)
					if [[ "$B" != "20" ]]; then
						let B=B-1
					fi
				;;
				$DIREITA)
					if [[ "$B" != "107" ]]; then
						let B=B+1
					fi			
				;;			
				$SPACE)
					TIRO "$A" "$B"
				;;
				$ESC) stty echo; tput cvvis; tput rc; clear; exit 0;;
			esac

	}

	while true; do
		
			LeituraTeclado		
			clear
			cat 'area.map'		
			tput cup 1 97
			echo "Score: $S"		
			if [[ "$D" = "$F" ]]; then
					ALVO "\e[31;1m•\e[m" 1
					SCORE
					F=107
			else
					unset D
					ALVO "\e[37;1m◀\e[m" 0
					if [[ "$( echo $(date +%S) % 2 | bc)" -lt "1" ]]; then
						F=$(( $F - 1 ))
					fi
			fi		
			TANQUE
			sleep 0.035
		
	done
}

game(){
	clear
	tput sc
	stty -echo -icanon -icrnl min 0 #time 0
	tput civis

	function ctrl_c {
		stty echo
		tput cvvis
		clear
		exit 1
	}

	trap ctrl_c SIGINT SIGTERM

	A=23
	B=$(( $(tput cols) / 2 ))
	F=103
	S=0
	V=3
	P=1
	F1=0

	CIMA=$(echo -ne '\e[A')
	ESQUERDA=$(echo -ne '\e[D')
	DIREITA=$(echo -ne '\e[C')
	BAIXO=$(echo -ne '\e[B')
	BACKSPACE=$(printf '\x7f')
	SPACE=$(printf '\x20')
	ENTER=$(printf '\x0d')
	ESC=$(printf '\x1b')

	TANQUE(){
		tput cup $A $B
		echo -en "╽"
		tput cup $(($A+1)) $B
		echo -en "█"
		tput cup $(($A+2)) $(( $B - 3))
		echo -en "███████"
		tput cup $(($A+3)) $(( $B - 7))
		echo -en "▂▄▅█████████▅▄▃▂"
		tput cup $(($A+4)) $(( $B - 10))
		echo -en "[███████████████████]"
		tput cup $(($A+5)) $(( $B - 9))
		echo -en "..◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙▲⊙◤.."
	}

	ALVO(){
		E=5
		if [[ "$F" -lt "20" ]];then
			F=103
			if [[ "$V" -le "0" ]]; then				
					tput cup $(( $(tput lines) / 2 )) 55
					echo ">>> GAME OVER <<<"											
					stty echo; tput cvvis; tput rc
				
					exit 0
			else
				let V=V-1
			fi
		fi
	
		if [[ "$2" = "1" ]];then
				tput cup $(( $E - 1 )) $(( $F - 1 ))
				echo -en "\e[31;1m•\e[m"
				tput cup $(( $E + 1 )) $(( $F + 1 ))
				echo -en "\e[31;1m•\e[m"
				tput cup $(( $E - 1 )) $(( $F + 1 ))
				echo -en "\e[31;1m•\e[m"
				tput cup $(( $E + 1 )) $(( $F - 1 ))
				echo -en "\e[31;1m•\e[m"			
		fi
	
		tput cup $E $F
		echo -e "\e[37;1m$1\e[m"
	}

	TIRO(){
		C=$1
		D=$2
	
		while [[ "$C" > "0" ]];do
			tput cup $C $D
			echo -n "•"
			let C=C-1
			sleep 0.008
		done
	
	}

	SCORE(){
		let S=S+1
		if [[ "$S" = "40" ]]; then
			tput cup $(( $(tput lines) / 2 )) 21
			echo "☹ ☺ ☻ ☼ ☽ ☾ ☿ ♀ ♁ ♂ ♃ ♄ ♅ ♆ ♇ ♈ PARABÉNS VOCÊ ZEROU O JOGO !!! ♉ ♊ ♋ ♌ ♍ ♎ ♏"											
			stty echo; tput cvvis; tput rc				
			exit 0
		fi 
		if [[ "$S" -ge "10" && "$F1" = "0" ]]; then
			F1=1
			let P=P+1
		fi 
	}

	COLISAO(){
		F=$1
		if [[ "$D" = "$F" || "$D" = "$(( $F + 1 ))" || "$D" = "$(( $F + 2 ))" || "$D" = "$(( $F + 3 ))" || "$D" = "$(( $F + 4 ))" ]]; then
			return 1
		else
			return 0
		fi
	}

	function LeituraTeclado {

			TECLA=$(dd bs=3 count=1 2>/dev/null)	
			case "$TECLA" in
				$ESQUERDA)
					if [[ "$B" != "20" ]]; then
						let B=B-1
					fi
				;;
				$DIREITA)
					if [[ "$B" != "107" ]]; then
						let B=B+1
					fi			
				;;			
				$SPACE)
					TIRO "$A" "$B"
				;;
				$ESC) stty echo; tput cvvis; tput rc; clear; exit 0;;
			esac

	}

	while true; do
		
			LeituraTeclado		
			clear
			cat 'area.map'		
			tput cup 1 97
			echo "Score: $S"
			tput cup 1 21
			echo "$V♥"
			tput cup 1 50
			echo "$P☰ fase"	
			if [[ "$D" = "$F" || "$D" = "$(($F+1))" || "$D" = "$(($F+2))" || "$D" = "$(($F+3))" || "$D" = "$(($F+4))" || "$D" = "$(($F+5))" || "$D" = "$(($F+6))" || "$D" = "$(($F+7))" || "$D" = "$(($F+8))" ]]; then
					ALVO "\e[31;1m•\e[m" 1					
					SCORE
					F=103
			else
					unset D
					ALVO "◀█▬▬◤" 0
					F=$(( $F - 4 ))
			fi		
			TANQUE
			sleep 0.035
		
	done
}

case $1 in
	1) _reply ;;
	2) _teclas ;;
	3) _move ;;
	4) _game_init ;;
	5) _game_limit ;;
	6) _game_alvo ;;
	7) _game_semi_pronto ;;
	9|--game) game ;;
	*) echo 'opção inválida' ;;
esac
