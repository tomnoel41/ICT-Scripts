#!/bin/bash


change_encryption_passphrase() {
    clear
    echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Lancement du changement de passphrase de l'encryption LVM LUKS..."
    sleep 2
    clear
    
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Entrez le chemin du volume chiffré LUKS : ")" -e volume_path
    
    # Vérifier si le volume existe
    if ! sudo cryptsetup isLuks $volume_path >/dev/null 2>&1; then
        clear
        echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Le volume chiffré LUKS n'existe pas."
        sleep 2
        main_menu
    fi

    # Changer la passphrase
    sudo cryptsetup luksChangeKey $volume_path

    clear 
    read -p "$(echo -e "${NC}[${YELLOW}ICT Scripts${NC}] -> Changement de passphrase de l'encryption LVM LUKS terminé, \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
}

change_encryption_passphrase