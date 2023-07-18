#!/bin/bash


install_chrome() {
    clear
    echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Google Chrome..."
    sleep 2
    clear
    if dpkg -s "google-chrome-stable" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Google Chrome est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        # Téléchargement du paquet d'installation de Google Chrome
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

        # Installation de Google Chrome
        sudo dpkg -i google-chrome-stable_current_amd64.deb

        # Correction des éventuelles dépendances manquantes
        sudo apt --fix-broken install -y

        # Suppression du fichier d'installation téléchargé
        rm google-chrome-stable_current_amd64.deb

        clear 
        read -p "$(echo -e "${NC}[${YELLOW}ICT Ubuntu Script${NC}] -> Installation de Google Chrome terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_chrome