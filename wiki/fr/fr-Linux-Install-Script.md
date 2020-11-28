---
layout: wiki
title: "Trucs et astuces Jamulus – Script bash d'installation pour Linux"
lang: "fr"
permalink: "/wiki/Linux-Client-Install-Script"
---


# Script bash pour télécharger et compiler sous Linux

Si vous prévoyez d'installer Jamulus sur plusieurs machnine Linux, vous pourrier avoir envie d'éssayer ce script.

L'exemple suivant a été testé sous Linux Mint et combine toutes les commandes ci-dessous en un seul script pour Ubuntu/Linux. Pour pouvoir incorporer les commandes spécifiques aux différents distributions Linux des variables définissent la distribution et la version pour lesquelles ce script d'installation pourrait être utilisé. L'exemple utilise Ubuntu version 18.04 comme référence. Donc le nom suggéré pour le script est, par ex., `install4ubuntu18_4.sh`. Les commandes du script sont génériques afin que le script puisse être modifié pour fonctionner avec d'autres distributions.

### L'installation dépend de la distribution Linux

Le script suivant appèle différentes commandes d'isntallation qui dépendent de la distribution Linux.
La variable `DISTRO` définie quelles commandes sont éxécutées. La valeur de cette variable dépend de la distribution Linux que vous utilisez :

* `DISTRO="Ubuntu"` pour une Ubuntu ou Linux Mint
* `DISTRO="Debian"` pour une Debian ou Raspian Linux
* `DISTRO="Fedora"` pour une Fedora Linux

D'autre part si l'installation est dépendante de la version, la variable `LINVERSION` a été introduite mais n'est pour l'instant pas utilisée. 
Dans l'algorithme if pour Ubuntu il y a un exemple démontrant comment les appels dépendants de la version peuvent être utilisés. 

```bash
if [ "$LINVERSION"  = "18.4" ]
then
    echo "Perform Installation Specifics for $DISTRO Version $DISTRO" 
fi  
```

La variable `LINVERSION` n'est actuellement pas utilisé dans le script suivant, c'est juste une démonstration sur la manière dont les commandes spécifiques à une version peuvent être utilisées.

### Adaptation du script d'installation
Si vous voulez créer un script d'installation pour debian, copiez simplement le script `install4ubuntu18_4.sh` en le renommant `install4debian10_6.sh` et modifez la varable distribution :

```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Debian"
LINVERSION="10.6"
```

Après, testez l'installation sous debian et modifiez les commandes pour que le script d'installation fonctionne sous Debian. Partagez, s'il vous plait, vos scipts d'installation fonctionnels sur ce Wiki. Le responsable du dépot peut y ajouter un répertoire `/install_scripts` pour les scripts d'installation fonctionnels. Créez une demande de fusion pour votre nouveau script d'installation ou ouvrez une « issue » pour demander l'ajout du script documenté et testé dans ce dépôt. 

### Le script d'installation

Copiez le script d'installation suivant dans un ficher et suvegardez le avec le nom `install4ubuntu18_4.sh`. Après avoir sauvegardé ce fichier dans, par ex., votre répertoire `Téléchargements`, placez vous dans ce répertoire et appelez le script avec `sh install4ubuntu18_4.sh`.

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

Avec la commande `lsb_release` qui retourne les informations spécifiques à la ditribution sous Linux.    
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

La problématique est que la commande `lsb_release` doit être disponible sur le système Linux. Pour les systèmes basés sur CentOS ou Fedora la commande `lsb_release` n'est disponible que si les paquets de base `lsb` sont installés. La détéction automatique de la version de Linux pourrait donc ne pas fonctionner.

En conséquece, obtenir les valeurs de `DISTRO` et `LINVERION` avec la commande `read` devrait être la meilleure amélioration dépendante de la distribution plutôt que d'automatiser la configuration avec `lsb_release`.
