#!/bin/bash

# Couleurs
GREEN='\033[0;32m'
RED='\033[0;31m'
RED2='\033[1;31m' # Rouge clair
YELLOW='\e[93m'
BLUE='\e[34m'
NC='\033[0m' # Couleur par défaut

VER='0.0.1'

# Vérification des dépendances et mises à jour
if ! command -v sudo &> /dev/null; then
    clear
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Sudo n'est pas installé, installation en cours..."
    sleep 2
    apt update -y
    apt install sudo -y
fi
if ! command -v curl &> /dev/null; then
    clear
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Curl n'est pas installé, installation en cours..."
    sleep 2
    sudo apt update
    apt install curl -y
fi
clear
echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Vérficiations des mises à jours du script (actuellement : v$VER)..."
latest_version=$(curl -s https://raw.githubusercontent.com/tomnoel41/ICT-Scripts/main/last_version.txt)
sleep 2
if [[ "$latest_version" != "$VER" ]]; then
   clear
   echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Attention, une nouvelle version est disponible (nouvelle : v$latest_version)..."
   sleep 5
fi


# Menu principal
main_menu() {
    clear
    echo -e "${BLUE}"
    echo -e "########################################################################################################################"
    echo -e "################################################# ${YELLOW}ICT Scripts ${RED2}BETA v$VER${BLUE} ##############################################"
    echo -e "########################################################################################################################"
    echo -e "${NC}"
    # Afficher les options du menu principal
    echo -e "${YELLOW}Mises à jour / Installation${NC}"
    echo -e "[ ${YELLOW}- 1 -${NC} ] Mettre à jour l'ordinateur complètement\t\t[ ${YELLOW}- 2 -${NC} ] Installer ${BLUE}Signal${NC}"
    echo -e "[ ${YELLOW}- 3 -${NC} ] Installer ${BLUE}Bitwarden${NC}\t\t\t\t\t[ ${YELLOW}- 4 -${NC} ] Installer ${BLUE}Chrome${NC}"
    echo -e "[ ${YELLOW}- 5 -${NC} ] Installer ${BLUE}Spotify${NC}\t\t\t\t\t[ ${YELLOW}- 6 -${NC} ] Installer ${BLUE}Remmina${NC}"
    echo -e "[ ${YELLOW}- 7 -${NC} ] Installer ${BLUE}TeamViewer${NC}\t\t\t\t\t[ ${YELLOW}- * -${NC} ] Préparer l'ordinateur pour un utilisateur (all)"

    echo -e ""
    echo -e "${YELLOW}Utilisateurs / ICT${NC}"
    echo -e "[ ${YELLOW}- 8 -${NC} ] ${BLUE}Créer${NC} un ${BLUE}utilisateur${NC} sur le système\t\t\t[ ${YELLOW}- 9 -${NC} ] Créer un compte ${BLUE}ICT${NC}"
    echo -e "[ ${YELLOW}- 10 -${NC} ] ${BLUE}Changer${NC} le ${BLUE}nom d'utilisateur${NC} d'un compte\t\t[ ${YELLOW}- 11 -${NC} ] ${BLUE}Supprimer${NC} un ${BLUE}utilisateur${NC}"
    echo -e "[ ${YELLOW}- 12 -${NC} ] Appliquer un ${BLUE}fond d'écran${NC} général"

    echo -e ""
    echo -e "${YELLOW}Encryption / Disque${NC}"
    echo -e "[ ${YELLOW}- 13 -${NC} ] ${BLUE}Changer${NC} la ${BLUE}passphrase d'encryption${NC} du disque"
    echo -e "[ ${YELLOW}- 14 -${NC} ] ${BLUE}Ajouter${NC} une ${BLUE}YubiKey${NC} pour l'authentification du compte"
    echo -e "[ ${YELLOW}- 15 -${NC} ] ${BLUE}Supprimer${NC} l'authentification par ${BLUE}YubiKey${NC}"
    echo -e "[ ${YELLOW}- 15 -${NC} ] ${BLUE}Afficher${NC} les informations du ${BLUE}files systems${NC}"
    echo -e ""

    # Lire le choix de l'utilisateur
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Choisissez une option à exécuter : ")" -e choice
    
    case $choice in
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
            source subscripts/create_user.sh;;
        9)
            source subscripts/create_ict_user.sh;;
        10)
            source subscripts/rename_user.sh;;
        11)
            source subscripts/delete_user.sh;;
        12)
            source subscripts/set_wallpaper.sh;;
        13)
            source subscripts/change_encryption_passphrase.sh;;
        14)
            source subscripts/add_yubikey_auth.sh;;
        15)
            source subscripts/remove_yubikey_auth.sh;;
        16)
            source subscripts/display_fs_info.sh;;
        *)
            echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Option invalide. Veuillez réessayer.${NC}"
            sleep 2
            main_menu
            ;;
    esac
}

main_menu