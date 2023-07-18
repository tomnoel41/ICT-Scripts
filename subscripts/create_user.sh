#!/bin/bash


create_user() {
    clear
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Choisissez le nom d'utilisateur : ")" -e username
    sleep 2
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Choisissez le mot de passe de l'utilisateur : ")" -e password
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Création de l'utilisateur ${username}..."
    if ! id -u "$username" >/dev/null 2>&1 ; then
        sudo useradd -s /bin/bash -m $username
        echo $username:$password | sudo chpasswd
        sudo usermod -aG lpadmin,plugdev,netdev $username
        sudo chown -R $username:$username /home/$username
        clear
        read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Création de l'utilisateur ${username} faite, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}


create_user