#!/bin/bash


rename_user() {
    clear
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Entrez le nom d'utilisateur : ")" -e oldname
    sleep 2
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Choisissez le nouveau nom d'utilisateur : ")" -e newname
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Modification de l'utilisateur ${oldname}..."

    # Vérifier si l'utilisateur est actuellement connecté
    if who | grep -wq "^$oldname"; then
        echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> L'utilisateur ${oldname} est actuellement connecté. Veuillez vous déconnecter avant de renommer l'utilisateur."
        sleep 5
        clear
        main_menu
    fi

    if [ ! $( id -u $newname 2> /dev/null ) ] ; then
        if [ $newname != $oldname ] ; then
            sudo usermod -l $newname -d /home/$newname -m $oldname
            sudo groupmod -n $newname $oldname
            read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Modification faite pour l'utilisateur ${newname} (Anciennement : ${oldname}), \nAppuyez sur Enter pour retourner à l'accueil")" -e
            main_menu
        fi
    fi
}

rename_user