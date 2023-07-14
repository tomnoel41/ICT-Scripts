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
    echo -e " Made by Tom with <3"
    echo -e "${NC}"

    echo -e "========================= ${RED2}Mises à jours / Installation ${NC}========================"

    echo -e "[ ${RED}- 1 -${NC} ] Mettre à jour l'ordinateur complètement"
    echo -e "[ ${RED}- 2 -${NC} ] Installer ${RED2}Signal${NC} (Discussions)"
    echo -e "[ ${RED}- 3 -${NC} ] Installer ${RED2}Bitwarden${NC} (Gestionnaire de mot de passe)"
    echo -e "[ ${RED}- 4 -${NC} ] Installer ${RED2}Chrome${NC} (Navigateur)"
    echo -e "[ ${RED}- 5 -${NC} ] Installer ${RED2}Spotify${NC} (Musique)"
    echo -e "[ ${RED}- 6 -${NC} ] Installer ${RED2}Remmina${NC} (Remote Desktop Protocol)"
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
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez une option à exécuter : ")" -e choice
    
    case $choice in
        1)
            update;;
        2)
            install_signal_desktop;;
        3)
            install_bitwarden;;
        4)
            install_chrome;;
        5)
            install_spotify;;
        6)
            install_remmina;;
        7)
            install_teamviewer;;
        8)
            display_fs_info;;
        9)
            create_user;;
        10)
            create_ict_user;;
        11)
            rename_user;;
        12)
            delete_user;;
        13)
            change_encryption_passphrase;;
        14)
            add_yubikey_auth;;
        15)
            remove_yubikey_auth;;
        *)
            echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Option invalide. Veuillez réessayer.${NC}"
            sleep 2
            main_menu
            ;;
    esac
}

# Fonction de mise à jours
update() {
    clear
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation des mises à jours de l'ordinateur..."
    sleep 2
    clear
    # Mettre à jour le système
    sudo apt update -y 
    sudo apt upgrade -y
    sudo apt dist-upgrade -y 
    sudo snap refresh -y
    sudo apt autoremove -y
    clear
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Installation des mises à jours terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

install_signal_desktop() {
    if dpkg -s "signal-desktop" >/dev/null 2>&1; then
        clear
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Signal Desktop est déjà installé sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    else
        clear
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Signal Desktop..."
        sleep 2
        clear
        apt install signal-desktop -y
        clear 
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Installation de Signal Desktop terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

install_bitwarden() {
    clear
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'installation de Bitwarden..."
    sleep 2
    clear
    if ! which snap &> /dev/null; then
        # S'il n'y a pas snap, l'installer
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'utilitaire snap n'est pas installé, installation en cours..."
        sudo apt instal snap -y
        clear
    fi
    if ! which bitwarden &> /dev/null; then
        # S'il n'y a pas bitwarden, l'installer
        sudo snap install bitwarden
    else
        # Si il y'a déjà bitwarden, le notifier
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'application Bitwarden est déjà installée sur l'ordinateur, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

display_fs_info() {
    clear
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Affichage des informations file system en cours..."
    sleep 2
    clear
    df -h
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Affichage des informations file system terminé, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}
 
create_user() {
    clear
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez le nom d'utilisateur : ")" -e username
    sleep 2
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez le mot de passe de l'utilisateur : ")" -e password
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Création de l'utilisateur ${username}..."
    if ! id -u "$username" >/dev/null 2>&1 ; then
        sudo useradd -s /bin/bash -m $username
        echo $username:$password | sudo chpasswd
        sudo usermod -aG lpadmin,plugdev,netdev $username
        sudo chown -R $username:$username /home/$username
        clear
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Création de l'utilisateur ${username} faite, \nAppuyez sur Enter pour retourner à l'accueil")" -e
        main_menu
    fi
}

rename_user() {
    clear
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Entrez le nom d'utilisateur : ")" -e oldname
    sleep 2
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez le nouveau nom d'utilisateur : ")" -e newname
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Modification de l'utilisateur ${oldname}..."

    # Vérifier si l'utilisateur est actuellement connecté
    if who | grep -wq "^$oldname"; then
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'utilisateur ${oldname} est actuellement connecté. Veuillez vous déconnecter avant de renommer l'utilisateur."
        sleep 5
        clear
        main_menu
    fi

    if [ ! $( id -u $newname 2> /dev/null ) ] ; then
        if [ $newname != $oldname ] ; then
            sudo usermod -l $newname -d /home/$newname -m $oldname
            sudo groupmod -n $newname $oldname
            read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Modification faite pour l'utilisateur ${newname} (Anciennement : ${oldname}), \nAppuyez sur Enter pour retourner à l'accueil")" -e
            main_menu
        fi
    fi
}

delete_user() {
    clear
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Entrez le nom d'utilisateur à supprimer : ")" -e username
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Suppression de l'utilisateur ${username}..."

    # Vérifier si l'utilisateur existe
    if id -u $username >/dev/null 2>&1 ; then
        # Tuer les processus de l'utilisateur
        sudo pkill -KILL -u $username
        # Supprimer l'utilisateur
        sudo userdel -r $username
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Utilisateur ${username} supprimé avec succès."
        sleep 2
        main_menu
    else
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'utilisateur ${username} n'existe pas."
        sleep 2
        main_menu
    fi
}

create_ict_user() {
    clear
    username="ict"
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Choisissez le mot de passe de l'utilisateur ${username} : ")" -e password
    echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Création de l'utilisateur ${username}..."
    if ! id -u "$username" >/dev/null 2>&1 ; then
        sudo useradd -s /bin/bash -m "$username"
        echo "$username:$password" | sudo chpasswd
        sudo usermod -aG sudo "$username"
        sudo chown -R "$username":"$username" /home/"$username"
        clear
        read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Création de l'utilisateur ${username} faite, \nAppuyez sur Entrée pour retourner à l'accueil")" -e
        main_menu
    else
        clear
        echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> L'utilisateur ${username} existe déjà. Retour à l'accueil."
        sleep 5
        clear
        main_menu
    fi
}

main_menu