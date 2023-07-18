#!/bin/bash


install_spotify() {
    clear
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Lancement de l'installation de Spotify..."
    sleep 2
    clear
    if dpkg -s "spotify-client" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Spotify est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        # Ajout de la clé GPG de Spotify
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify-keyring.gpg

        # Ajout du dépôt Spotify
        echo "deb [signed-by=/usr/share/keyrings/spotify-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list >/dev/null

        # Mettre à jour les paquets
        sudo apt update -y

        # Installation de Spotify
        sudo apt install spotify-client -y
        clear 
        read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Installation de Spotify terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_spotify