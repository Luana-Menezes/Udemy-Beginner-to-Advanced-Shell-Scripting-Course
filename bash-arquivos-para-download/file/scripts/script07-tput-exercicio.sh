#!/bin/bash
# exercicio-tput.sh
tput clear
function ctrl_c() {
        tput reset
        exit 130
}

trap ctrl_c SIGINT SIGTERM

set_vars(){
	RESETCOLOR="$(tput sgr0)"
	BOLD=$(tput smso)
	OFFBOLD=$(tput rmso)
	VERMELHO="$(tput bold ; tput setaf 1)"
	VERDE="$(tput bold ; tput setaf 2)"
	AMARELO="$(tput bold ; tput setaf 3)"
	AZUL="$(tput bold ; tput setaf 4)"
	AZULCYAN="$(tput bold ; tput setaf 6)"
	COLM=20
}

initial_menu(){
	tput cup 1 $COLM
	cat <<- EOF
					>>> Insira seus dados de acesso <<<
	EOF
	
	tput cup 5 $COLM
	echo -e "USUÁRIO: \c"

	tput cup 6 $COLM
	echo -e "LOGIN: \c"

	tput cup 7 $COLM
	echo -e "SENHA: \c"
}


get_info(){
	tput cup 5 $COLM
	echo -e "${VERMELHO}USUÁRIO: ${RESETCOLOR}\c"
	read _LOGIN

	tput cup 6 $COLM
	echo -e "${VERDE}LOGIN: ${RESETCOLOR}\c"
	read _USER

	tput cup 7 $COLM
	echo -e "${AZULCYAN}SENHA: ${RESETCOLOR}\c"
	read _PASS
}

output_info(){
	tput cup 10 2
	echo "${AZUL}DADOS DE ${AMARELO}ACESSO${RESETCOLOR}: user:${VERDE}$_USER${RESETCOLOR},login:${VERMELHO}$_LOGIN${RESETCOLOR},pass:${AZULCYAN}$_PASS${RESETCOLOR}"
	tput cup 13 0
}

set_vars
initial_menu
get_info
output_info
exit 0
