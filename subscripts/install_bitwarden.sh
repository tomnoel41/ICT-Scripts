#!/bin/bash


install_bitwarden() {
    clear
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Bitwarden..."
    sleep 2
    clear
    if ! command -v snap &> /dev/null; then
        # S'il n'y a pas snap, l'installer
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'utilitaire snap n'est pas installé, installation en cours..."
        sudo apt install snapd -y
        clear
    fi
    
    sudo snap install bitwarden
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Installation de Bitwarden terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

install_bitwarden