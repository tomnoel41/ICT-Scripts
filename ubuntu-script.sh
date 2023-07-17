#!/bin/bash

# Couleurs
GREEN='\033[0;32m'
RED='\033[0;31m'
RED2='\033[1;31m' # Rouge clair
NC='\033[0m' # Couleur par défaut

# Menu principal
main_menu() {
    clear

    echo -e "${RED}"

    echo "  ___ ___ _____   _   _ _             _          ___         _      _   "
    echo " |_ _/ __|_   _| | | | | |__ _  _ _ _| |_ _  _  / __| __ _ _(_)_ __| |_ "
    echo "  | | (__  | |   | |_| | '_ \ || | ' \  _| || | \__ \/ _| '_| | '_ \  _|"
    echo " |___\___| |_|    \___/|_.__/\_,_|_||_\__|\_,_| |___/\__|_| |_| .__/\__|"
    echo -e "${NC}"

    echo -e "========================= ${RED2}Mises à jours / Installation ${NC}========================"

    echo -e "[ ${RED}- 1 -${NC} ] Mettre à jour l'ordinateur complètement"
    echo -e "[ ${RED}- 2 -${NC} ] Installer ${RED2}Signal${NC} (Discussions)"
    echo -e "[ ${RED}- 3 -${NC} ] Installer ${RED2}Bitwarden${NC} (Gestionnaire de mot de passe)"
    echo -e "[ ${RED}- 4 -${NC} ] Installer ${RED2}Chrome${NC} (Navigateur)"
    echo -e "[ ${RED}- 5 -${NC} ] Installer ${RED2}Spotify${NC} (Musique)"
    echo -e "[ ${RED}- 6 -${NC} ] Installer ${RED2}Remmina${NC} (Remote Desktop Client)"
    echo -e "[ ${RED}- 7 -${NC} ] Installer ${RED2}TeamViewer${NC} (Outil d'aide à distance)"
    echo -e "[ ${RED}- * -${NC} ] Préparer l'ordinateur pour un utilisateur (all)"

    echo -e "============================ ${RED2}Informations systèmes ${NC}============================"

    echo -e "[ ${RED}- 8 -${NC} ] Afficher les informations du files systems"

    echo -e "============================= ${RED2}Utilisateurs / ICT ${NC}=============================="

    echo -e "[ ${RED}- 9 -${NC} ] Créer un utilisateur sur le système"
    echo -e "[ ${RED}- 10 -${NC} ] Créer un compte ICT (administrateur) sur le système"
    echo -e "[ ${RED}- 11 -${NC} ] Changer le nom d'utilisateur d'un compte"
    echo -e "[ ${RED}- 12 -${NC} ] Supprimer un utilisateur du système"

    echo -e "============================= ${RED2}Encryption / Disque ${NC}============================="

    echo -e "[ ${RED}- 13 -${NC} ] Changer la passphrase d'encryption du disque"
    echo -e "[ ${RED}- 14 -${NC} ] ${RED2}Ajouter${NC} une ${RED2}YubiKey${NC} pour l'authentification du compte"
    echo -e "[ ${RED}- 15 -${NC} ] ${RED2}Supprimer${NC} l'authentification par ${RED2}YubiKey${NC}"
    echo -e ""
    echo -e "[ ${RED}- 0 -${NC} ] ${RED2}Quitter${NC} l'utilitaire"
    echo -e ""
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez une option à exécuter : ")" -e choice
    
    case $choice in
        0)
            exit;;
        1)
            source subscripts/update.sh;;
        2)
            source subscripts/install_signal_desktop.sh;;
        3)
            source subscripts/install_bitwarden.sh;;
        4)
            source subscripts/install_chrome.sh;;
        5)
            source subscripts/install_spotify.sh;;
        6)
            source subscripts/install_remmina.sh;;
        7)
            source subscripts/install_teamviewer.sh;;
        8)
            source subscripts/display_fs_info.sh;;
        9)
            source subscripts/create_user.sh;;
        10)
            source subscripts/create_ict_user.sh;;
        11)
            source subscripts/rename_user.sh;;
        12)
            source subscripts/delete_user.sh;;
        13)
            source subscripts/change_encryption_passphrase.sh;;
        14)
            source subscripts/add_yubikey_auth.sh;;
        15)
            source subscripts/remove_yubikey_auth.sh;;
        *)
            echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Option invalide. Veuillez réessayer.${NC}"
            sleep 2
            main_menu
            ;;
    esac
}

main_menu