# ICT Scripts

Ce script est conçu pour automatiser diverses tâches liées à l'informatique et à l'administration système. Il propose un menu interactif permettant de choisir parmi plusieurs options d'installation, de configuration et de gestion du système pour la gestion de déploiement d'ordinateurs Linux dans un parc informatique.

## Fonctionnalités

- Mise à jour complète de l'ordinateur
- Installation de différentes applications :
  - Signal (Discussions)
  - Bitwarden (Gestionnaire de mots de passe)
  - Chrome (Navigateur)
  - Spotify (Musique)
  - Remmina (Remote Desktop Client)
  - TeamViewer (Outil d'aide à distance)
- Affichage des informations du système de fichiers
- Gestion des utilisateurs et des comptes ICT :
  - Création d'un nouvel utilisateur
  - Création d'un compte ICT (administrateur)
  - Modification du nom d'utilisateur d'un compte
  - Suppression d'un utilisateur
- Configuration de l'encryption du disque :
  - Changement de la passphrase d'encryption
  - Ajout d'une YubiKey pour l'authentification du compte
  - Suppression de l'authentification par YubiKey

## OS Supportés

| Operating System | Supported          |
| ---------------- | ------------------ |
| Ubuntu           | :white_check_mark: |
| Debian           | :white_check_mark:  |

## Utilisation

1. Clonez ce référentiel sur votre ordinateur.
2. Exécutez le script `ict-scripts.sh` dans un terminal.
3. Suivez les instructions affichées dans le menu principal pour effectuer les différentes actions.

## Installation

```bash
apt-get install git -y
git clone https://github.com/tomnoel41/ICT-Scripts/
cd ICT-Scripts
chmod +x ict-scripts.sh
bash ict-scripts.sh
```

Assurez-vous d'exécuter le script en tant qu'utilisateur disposant des privilèges nécessaires pour effectuer les opérations demandées.

## Avertissement

Ce script est fourni tel quel, sans aucune garantie. Assurez-vous de comprendre les actions effectuées par le script avant de l'exécuter sur votre système. Utilisez-le à vos propres risques.

## Contributions

Les contributions sont les bienvenues ! Si vous souhaitez améliorer ce script ou ajouter de nouvelles fonctionnalités, n'hésitez pas à soumettre une demande de fusion (pull request) avec vos modifications.