#!/bin/bash

while true ;
    do
    distros=$(dialog --stdout --title "Escolha sua Distro" --menu "Qual sua distro preferida?" 0 0 0 \
        1   "Debian"    \
        2   "Red Hat"   \
        3   "Gentoo"    \
        4   "Slackware" \
        5   "Ubuntu"    \
        0   "Sair"  )

    [ $? -ne 0 ] && echo "Cancelou ou apertou ESC"

    case "$distros" in
        1) dialog --stdout --msgbox "Essa é a MELHOR distro! :)" 5 30 ; break ;;
        2) dialog --title "Red Hat" --infobox "\nEla agora é ENTERPRISE. :(" 5 30; break ;;
        3) dialog --title "Gentoo" --msgbox "\nVocê é PSICOPATA!" 5 25 ; break ;;
        4) dialog --title "Slackware" --yesno "\nVocê é ATEU?" 5 30;

        if [ $? = 0 ]; then
            dialog --title "Slackware Ateu" --infobox "\nSabia." 0 0;
        else
            dialog --title "Slackware Não Ateu" --infobox "\nAmarelou." 0 0;
        fi

        break ;;

        5) dialog --title "Ubuntu" --timebox "\nVou gravar a hora que você escolheru esse absurdo." 0 0; break ;;
        0) echo "Você escolheu sair" ; break ;;

    esac
done
