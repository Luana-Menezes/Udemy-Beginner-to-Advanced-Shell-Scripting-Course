#!/bin/bash
# Script 01-1-manual
# Para fins didáticos do capítulo e módulo do Curso Extremamente Avançado em Shell Script Bash
# Criado por Marcos Oliveira <terminalroot.com.br>

#----[ CORES ]------>
red='\e[31;1m'
cian='\e[36;1m'
white='\e[37;1m'
off='\e[m'

manual(){
	clear && echo
	echo -e "$red 01 - LOCAL MANUAIS ----"
	echo -e "$cian COMANDOS: \n\tcd /usr/share/man/man1\n\tls -l\n\tzcat ls.1.gz\n"
	#echo -e "$white PRECISA: "
	sleep 1

	echo -e "$red 02 - MANIPULAR MANUAIS"
        echo -e "$cian COMANDOS: \n\tman -a|-f|-k [comando]\n\tman ls > teste.txt"
        echo -e "$white \n\tPRECISA: # mandb\n"
	sleep 1

        echo -e "$red 03 - CONFIG MANUAIS"
	echo -e "$cian COMANDOS: \n\tcat /etc/manpath.config\n\twhatis,apropos,catman , groff , troff , roff , yelp , xman,...\n\t"
	sleep 1

	echo -e "$red 04 - MAKE MANUAIS"
	echo -e "$cian COMANDOS: \n\tvim teste\n\tconteúdo de teste BÁSICO"
	echo -e "$cian\n\tcp teste /usr/share/man/man1/teste.1\n\tbzip2 -z /usr/share/man/man1/teste.1\n\tman teste"
	sleep 1
	whiptail --title "Example Dialog" --msgbox "$(cat ../files/_man_basic)" 30 78	
	echo -e "\n\tconteúdo da linha 1 até a linha 41 de teste COMPLETO"
	sleep 1
	whiptail --title "Example Dialog" --msgbox "$(sed '1,41!d' ../files/_man_full)" 50 78
	echo -e "\n\tconteúdo da linha 42 até o final de teste COMPLETO"
	sleep 1
	whiptail --title "Example Dialog" --msgbox "$(sed '42,$!d' ../files/_man_full)" 50 78
	echo -e "\n\t\t$white OBSERVAÇÕES: Algumas distros, como Debian,... precisa instalar o groffer pra funcionar o PDF, no entanto, existem outras ferramentas."
	echo
}
manual
