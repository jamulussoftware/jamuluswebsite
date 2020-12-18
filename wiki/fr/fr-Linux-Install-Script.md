---
layout: wiki
title: "Trucs et astuces Jamulus – Script bash d'installation pour Linux"
lang: "fr"
permalink: "/wiki/Linux-Client-Install-Script"
---


# Script bash pour télécharger et compiler sous Linux

Si vous prévoyez d'installer Jamulus sur plusieurs machines Linux, vous pourrier avoir envie d'essayer ce script.

L'exemple suivant a été testé sous Linux Mint et combine toutes les commandes ci-dessus en un seul script pour Ubuntu/Linux Mint. Pour pouvoir incorporer les différentes commandes des distributions Linux, des variables définissent la distribution et la version pour lesquelles ce script d'installation pourrait être utilisé. L'exemple utilise Ubuntu version 18.04 comme référence. Ainsi le nom suggéré pour le script est, par ex., `install4ubuntu18_4.sh`. Les commandes du script sont génériques afin que l'installation puisse être modifiée pour fonctionner avec d'autres distributions.

### Installation en fonction de la distribution Linux

Le script suivant appelle différentes commandes d'installation en fonction de la distribution Linux.
La variable `DISTRO` définie quelles commandes sont exécutées. Paramétrez la variable en fonction de la distribution Linux que vous utilisez :

* `DISTRO="Ubuntu"` pour une Ubuntu ou Linux Mint
* `DISTRO="Debian"` pour une Debian ou Raspian Linux
* `DISTRO="Fedora"` pour une Fedora Linux

D'autre part si l'installation est dépendante de la version, la variable `LINVERSION` a été introduite mais n'est pour l'instant pas utilisée. 
Dans la déclaration `if` pour Ubuntu il y a un exemple de la façon dont les appels d'installation en fonction de la version peuvent être utilisés. 

```bash
if [ "$LINVERSION"  = "18.4" ]
then
    echo "Perform Installation Specifics for $DISTRO Version $DISTRO" 
fi  
```

La variable `LINVERSION` n'est pas actuellement utilisée dans le script suivant, c'est juste une démonstration sur la manière dont les commandes d'installation spécifiques à une version peuvent être utilisées.

### Adaptation du script d'installation
Si vous voulez créer un script d'installation pour Debian, copiez simplement le script `install4ubuntu18_4.sh` en le renommant `install4debian10_6.sh` et modifez la variable distro :

```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Debian"
LINVERSION="10.6"
```

Ensuite, testez l'installation sous Debian et modifiez les commandes pour que le script d'installation fonctionne sous Debian. Partagez, s'il vous plait, vos scripts d'installation fonctionnels sur ce Wiki. Le responsable du dépôt pourrait y ajouter un répertoire `/install_scripts` pour les scripts d'installation fonctionnels. Créez une demande de fusion pour votre nouveau script d'installation ou ouvrez une « issue » pour demander l'ajout du script documenté et testé dans ce dépôt. 

### Le script d'installation

Copiez le script d'installation suivant dans un ficher et sauvegardez le avec le nom `install4ubuntu18_4.sh`. Après avoir sauvegardé ce fichier dans, par ex., votre répertoire `Téléchargements`, placez vous dans ce répertoire et appelez le script suivant avec `sh install4ubuntu18_4.sh`.

```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Ubuntu"
LINVERSION="18.04"

# Get Jamulus Release Name with "curl" and "grep"  
R=`curl -s https://api.github.com/repos/corrados/jamulus/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'` 
echo "Jamulus Installation Script for $DISTRO $LINVERSION"
echo "Release: $R"
INSTALLJAMULUS="no"
while true; do
    read -p "Do you wish to install Jamulus on $DISTRO $LINVERSION? (y/n) " yn
    case $yn in
        [Yy]* ) 
           echo "Start Installation $DISTRO $LINVERSION"
           echo "(1) Fetch Release $R from GitHub"
           wget https://github.com/corrados/jamulus/archive/$R.tar.gz 
           echo "(2) Extract Source Code for Jamulus Release $R from GitHub"
           tar -xvf $R.tar.gz
           echo "(3) Delete ${R}.tar.gz from GitHub"
           rm $R.tar.gz
           echo "(4) Update Repository"
           sudo apt-get update
           INSTALLJAMULUS="yes" 
           break;;
        [Nn]* ) 
           echo "Cancelled Jamulus Installation on $DISTRO $LINVERSION"
           exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# echo "Check Variable: $INSTALLJAMULUS"
	
if [ "$INSTALLJAMULUS" = "yes" ]; then     
	echo "(5) Install Build Essentials for $DISTRO"
	
	if [ "$DISTRO"  = "Ubuntu" ]
	then  
		      echo "Installation for $DISTRO" 
		      sudo apt-get install cmake qmake gcc g++ 
		      sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev 
		      sudo apt-get install qjackctl
                      if [ "$LINVERSION"  = "18.4" ]
                      then
                          echo "Perform Installation Specifics for $DISTRO Version $DISTRO" 
                      fi  
	
  	elif [ "$DISTRO" = "Debian" ]
	then    
			  sudo apt-get install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev 
			  sudo apt-get install qjackctl
	elif [ "$DISTRO" = "Fedora" ]
	then    
			  sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel 
			  sudo dnf install qjackctl
	fi
           
	echo "(6) Compile Jamulus $R"
	echo "Change to Directory jamulus-$R" 
	cd "jamulus-$R"
	# ls
	qmake Jamulus.pro
	make clean
        make
        sudo make install
        echo "Compilation DONE"
        cd ..
        echo "(6) Delete the Source Files after Installation"
        rm -R "jamulus-$R"
           
else

	echo "Installation cancelled"

fi

```  

## Améliorations possibles du script d'installation pour Jamulus

Le script peut, au tout début, demander pour quelle distribution Linux il doit être appelé.  
Ça peut être testé avec la commande `lsb_release`.

Avec la commande `lsb_release` qui retourne les informations spécifiques à la distribution sous Linux.    
Avec la commande `grep` et en utilisant des expressions rationnelles pour les variables `DISTRO` et `LINVERSION`.  
Par ex., un système basé sur Unbuntu retourne les informations suivantes avec cette commande :

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 11.04
Release:        11.04
Codename:       natty
```

La problématique est que la commande `lsb_release` doit être disponible sur le système Linux. Pour les systèmes basés sur CentOS ou Fedora la commande `lsb_release` n'est disponible que si les paquets de base `lsb` sont installés. La détection automatique de la version de Linux pourrait donc ne pas fonctionner.

En conséquence, obtenir les valeurs de `DISTRO` et `LINVERION` avec la commande `read` serait la meilleure amélioration en fonction de la distribution plutôt que d'automatiser la configuration avec `lsb_release`.
