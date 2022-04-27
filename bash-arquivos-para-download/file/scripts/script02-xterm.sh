#!/bin/bash
# Script 02-xterm
# Para fins didáticos do capítulo e módulo do Curso Extremamente Avançado em Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'

_xterm(){
	clear && echo
	echo -e "$red CRIE UM ARQUIVO NO DIRETÓRIO RAÍZ DO SEU USUÁRIO $cian~/.Xdefaults $red E COLE O CONTEÚDO ABAIXO, SE QUISER EDITE$off\n"
cat <<EOF
xterm*background:   #333
xterm*foreground:   #8ae234
xterm*faceName:   Monospace
xterm*vt100.allowTitleOps:   false
xterm*title:   Terminal
xterm*geometry:		100x30
EOF

	echo -e "\n$red DEPOIS RODE O COMANDO: $cian xrdb ~/.Xdefaults $red e abra o $off xterm\n"
}
_xterm
