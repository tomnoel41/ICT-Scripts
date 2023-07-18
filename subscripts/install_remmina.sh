#!/bin/bash


install_remmina() {
    clear
    echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Remmina..."
    sleep 2
    clear
    if dpkg -s "remmina" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Remmina est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        sudo apt install remmina -y
        clear 
        read -p "$(echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Installation de Remmina terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_remmina