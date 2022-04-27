#!/bin/bash
# Script 01-2-infopages
# Para fins didáticos do capítulo e módulo do Curso Extremamente Avançado em Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'

infopages(){

	clear && echo
	
	echo -e "$red 01 - NAVEGANDO NAS INFOPAGES ----"
	echo -e "$cian COMANDOS: n,p,u,q,h"
	echo -e "$white PRECISA: sudo apt install info texinfo\n"
	sleep 1
	
	echo -e "$red 02 - LOCAL INFOPAGES ----"
	echo -e "$cian COMANDOS: info, /usr/share/info/\n"
	sleep 1
	
	echo -e "$red 03 - MAKE INFOPAGES ----"
	echo -e "$cian COMANDOS: makeinfo teste.texi, bzip2 -z teste.info, mv teste.info.bz2 /usr/share/info/,info teste\n"
	echo -e "\n\tconteúdo teste infopage BÁSICO\n\t"
	echo -e "$white\n\tPRECISA: dentro do diretório desse conteúdo precisa do arquivo _null.texi , para esse exemplo: cat _infopage_basic > teste.texi && makeinfo teste.texi # automaticamente será criado o documento teste.info\n"
	sleep 1
	whiptail --title "Example Dialog" --msgbox "$(sed '1,48!d' ../files/_infopage_basic)" 52 78
	
	
}
infopages
