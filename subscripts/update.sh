#!/bin/bash

update() {
    clear
    echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Lancement de l'installation des mises à jours de l'ordinateur..."
    sleep 2
    clear
    # Mettre à jour le système
    sudo apt update -y 
    sudo apt upgrade -y
    sudo apt dist-upgrade -y 
    sudo snap refresh -y
    sudo apt autoremove -y
    clear
    read -p "$(echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Installation des mises à jours terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

update