#!/bin/bash

install_signal_desktop() {
    if dpkg -s "signal-desktop" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Signal Desktop est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        clear
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Signal Desktop..."
        sleep 2
        clear
        apt install signal-desktop -y
        clear 
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Installation de Signal Desktop terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_signal_desktop