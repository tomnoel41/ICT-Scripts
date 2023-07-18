#!/bin/bash


display_fs_info() {
    clear
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Affichage des informations file system en cours..."
    sleep 2
    clear
    df -h
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Affichage des informations file system terminé, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

display_fs_info