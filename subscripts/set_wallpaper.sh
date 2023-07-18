#!/bin/bash


set_wallpaper() {
  local wallpaper_dir="files"
  local wallpaper_file="wallpaper.png"

  clear
  echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Lancement de l'application du nouveau fond d'écran..."
  sleep 2
  clear
  
  # Vérifier si le dossier "files" existe
  if [ ! -d "$wallpaper_dir" ]; then
    clear
    mkdir $wallpaper_dir
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Le dossier 'files' n'est pas présent, \nAppuyez sur Enter pour réessayer")" -e
    set_wallpaper
  fi
  
  # Vérifier si le fichier de fond d'écran existe dans le dossier "files"
  if [ ! -f "$wallpaper_dir/$wallpaper_file" ]; then
    clear 
    read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Le fichier '$wallpaper_file' n'éxiste pas dans le dossier '$wallpaper_dir', \nAppuyez sur Enter pour retourner à l'accueil")" -e
    main_menu
  fi
  
  # Définir le fond d'écran
  gsettings set org.gnome.desktop.background picture-uri "file://$PWD/$wallpaper_dir/$wallpaper_file"
  
  clear 
  read -p "$(echo -e "${NC}[${RED}ICT Ubuntu Script${NC}] -> Application du nouveau fond d'écran terminée, \nAppuyez sur Enter pour retourner à l'accueil")" -e
  main_menu
}

set_wallpaper