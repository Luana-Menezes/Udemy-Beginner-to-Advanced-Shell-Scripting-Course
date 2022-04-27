#!/bin/bash
# Script 10-progress-bar
# Para fins didáticos do módulo e capítulo no Curso Extremamente Avançado de Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

_basic(){
	x=1
	while [[ "$x" -lt "100" ]]; do
		echo -ne "X"
		sleep 0.3
		let x=x+1
	done
}

_medio(){
	x=1
	echo -ne "[ =>"
	while [[ "$x" -le "100" ]]; do
		if [[ "$x" -lt "10" ]];then
		    echo -ne " \b\b\b\b=>$x%"
		else
		    echo -ne " \b\b\b\b\b=>$x%"
		fi
		sleep 0.08
		let x=x+1
		done
	echo -ne "\b\b\b\b\b\b\b=>]"
	echo -e "\nCompleto!"
}

_sexy(){
	setterm -cursor off
	echo -e "\e[37;1m\n  Aguarde carregando...\e[m"
	echo -ne "  "
	x=1
	function ctrl_c() {
		    echo
		    setterm -cursor on
		    exit 130
	}
	trap ctrl_c SIGINT SIGTERM
	while [[ "$x" -lt "100" ]]; do
		if [[ "$x" -lt "50" ]]; then
		    echo -ne "\b\e[30;1m█\e[m█"
		    if [[ "$x" -lt "30" ]]; then
		        sleep 0.01
		    else
		        sleep 0.03
		    fi
		else
		    echo -ne " \b█\e[30;1m█\e[m\b\b\b"
		    if [[ "$x" -lt "70" ]]; then
		        sleep 0.01
		    else
		        sleep 0.03
		    fi
		fi    
		let x=x+1
		if [[ "$x" -gt "98" ]]; then
		    x=1
		fi
	done
}

_model1(){
	t=0; 
	echo -n " 0 "; 
	while [ $t -lt 100 ];do
		    t=$[t+1]; 
		    echo -ne "\e[${#t}D#$t"; 
		    sleep 1; 
	done
}

_model2(){
	i=1
	sp="/-\|"
	echo -n ' '
	while true
	do
		printf "\b${sp:i++%${#sp}:1}"
	done
}

_model3(){
	function ProgressBar {
		let _progress=(${1}*100/${2}*100)/100
		let _done=(${_progress}*4)/10
		let _left=40-$_done
		_fill=$(printf "%${_done}s")
		_empty=$(printf "%${_left}s")
	printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
	}
	_start=1
	_end=100
	for number in $(seq ${_start} ${_end})
	do
		sleep 0.1
		ProgressBar ${number} ${_end}
	done
	printf '\Completo!!\n'
}

_model4(){
	progress-bar() {
	  local duration=${1}
		already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
		remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
		percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
		clean_line() { printf "\r"; }
	  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
		  already_done; remaining; percentage
		  sleep 0.1
		  clean_line
	  done
	  clean_line
	}
	progress-bar 100
}

case $1 in
	1) _basic ;;
	2) _medio ;;
	3) _sexy ;;
	4) _model1 ;;
	5) _model2 ;;
	6) _model3 ;;
	7) _model4 ;;
	*) echo 'opção inválida' ;;
esac
