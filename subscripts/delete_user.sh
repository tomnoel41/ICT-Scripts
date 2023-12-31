#!/bin/bash


delete_user() {
    clear
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Entrez le nom d'utilisateur à supprimer : ")" -e username
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Suppression de l'utilisateur ${username}..."

    # Vérifier si l'utilisateur existe
    if id -u $username >/dev/null 2>&1 ; then
        # Tuer les processus de l'utilisateur
        sudo pkill -KILL -u $username
        # Supprimer l'utilisateur
        sudo userdel -r $username
        echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Utilisateur ${username} supprimé avec succès."
        sleep 2
        main_menu
    else
        echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> L'utilisateur ${username} n'existe pas."
        sleep 2
        main_menu
    fi
}

delete_user