#!/bin/bash

create_ict_user() {
    clear
    username="ict"
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Choisissez le mot de passe de l'utilisateur ${username} : ")" -e password
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Création de l'utilisateur ${username}..."
    if ! id -u "$username" >/dev/null 2>&1 ; then
        sudo useradd -s /bin/bash -m "$username"
        echo "$username:$password" | sudo chpasswd
        sudo usermod -aG sudo "$username"
        sudo chown -R "$username":"$username" /home/"$username"
        clear
        read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Création de l'utilisateur ${username} faite, \nAppuyez sur Entrée pour retourner à l'accueil")" -e
        main_menu
    else
        clear
        echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> L'utilisateur ${username} existe déjà. Retour à l'accueil."
        sleep 5
        clear
        main_menu
    fi
}

create_ict_user