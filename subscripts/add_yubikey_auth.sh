#!/bin/bash


add_yubikey_auth() {
    clear 
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Pas encore disponible, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

add_yubikey_auth