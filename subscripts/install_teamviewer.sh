#!/bin/bash


install_teamviewer() {
    clear
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation de TeamViewer..."
    sleep 2
    clear
    if dpkg -s "teamviewer" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> TeamViewer est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        # Téléchargement du paquet d'installation de TeamViewer
        wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

        # Installation de TeamViewer
        sudo dpkg -i teamviewer_amd64.deb

        # Correction des éventuelles dépendances manquantes
        sudo apt --fix-broken install -y

        # Suppression du fichier d'installation téléchargé
        rm teamviewer_amd64.deb

        clear 
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Installation de TeamViewer terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_teamviewer