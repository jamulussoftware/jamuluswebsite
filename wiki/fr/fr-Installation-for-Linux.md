---
layout: wiki
title: "Installation sous Linux"
lang: "fr"
permalink: "/wiki/Installation-for-Linux"
---


# Installation sous Linux

Assurez-vous d'avoir déjà lu la page [Premier pas](Getting-Started).

## Paquets jamulus

Bien que nous ne fournissions pas de paquets officiels, vous pourriez trouver Jamulus dans le gestionnaires de paquets de votre distribution. Consultez ce tableau :

[![Statut d'empaquetage](https://repology.org/badge/vertical-allrepos/jamulus.svg)](https://repology.org/project/jamulus/versions)

Il existe aussi une liste de [paquets non officiels pour les différentes distributions ici](https://github.com/corrados/jamulus/issues/223){: target="_blank" rel="noopener noreferrer"} (en anglais). Si vous ne le trouvez pas dans votre gestionnaire de paquet, vous devrez compiler Jamulus depuis le code source. C'est assez simple :

## Obtenir les sources de Jamulus

1. Ouvrez une fenêtre de terminal (ligne de commande - `CTRL+ALT+t` sur Ubuntu et distributions connexes)
1. Téléchargez et dézippez les sources de la dernière version :
```shell
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


## Installation des dépendances

Tout d'abord, mettez à jour la liste des paquets (par ex. sur les distributions basées sur Debian avec `sudo apt-get update`).

Sur les distributions **basées sur Ubuntu** 18.04+, et sur **Debian** 9+ ou 10 et Raspberry Pi Raspbian Buster et suivantes :

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Sur **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus libQt5Concurrent5 jack-audio-connection-kit-devel
```

### Qjackctl : optionnel, mais recommandé

[QjackCtl](https://qjackctl.sourceforge.io) est un utilitaire qui vous aide à configurer le serveur audio Jack (installé dans le cadre des dépendances ci-dessus). Installez-le, par ex., via

```shell
sudo apt-get install qjackctl
```

Vous pouvez également envisager d'utiliser un [noyau à faible latence](https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (ex. pour Ubuntu 18.04 : `sudo apt-get install linux-lowlatency-hwe-18.04`).


## Compilons ce vilain garçon

Maintenant, `cd` dans le répertoire des sources de Jamulus que avez téléchargé :

```shell
cd jamulus-latest
```
Maintenant, compilez les sources avec les commandes suivantes (le dernier `make` peut prendre plusieurs minutes à s'exécuter) :

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```


## Configurez votre interface audio

### Configurer Jack avec QjackCtl

Les clients Jamulus ont besoin de [Jack](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"} pour fonctionner, mais vous devez d'abord le configurer. La méthode recommandée est d'utiliser `QjackCtl`.

1. Ouvrez le terminal de commande, par ex. avec Crtl-Alt-T et
1. Exécutez la commande `qjackctl` vous verrez le **Jack Audio Connection Kit**
2. Configurez votre interface audio comme suit (les paramètres exacts pour Jack dépendront des fonctionnalités de votre interface audio/carte son) :

- Réglez l'**Interface audio** sur celle que vous souhaitez (il peut y en avoir plusieurs dans la liste)
- Paramétrez la **Fréquence d'échantillonnage à 48000** 
- Paramétrez les **Échantillons/Période à 128** et les Périodes/Tampons à 2 pour commencer

Redémarrez Jack pour prendre en compte ces nouveaux paramètres.

### Démarrer Jamulus

Ouvrez Jamulus, par ex. en ligne de commande. Si vous utilisez la ligne de commande, exécutez la commande `Jamulus` (avec un « J » majuscule) qui démarre le client Jamulus.

Jamulus se trouve dans `/usr/local/bin`. Vous pouvez maintenant supprimer le répertoire des sources que vous venez de compiler.

Si vous avez des problèmes de son qui se coupe (en particulier les erreurs XRUN rapportées par Jack/QJackCtl), essayez de définir des valeurs plus élevées (par exemple 256 échantillons ou 3 périodes) à l'étape 3 ci-dessus. Des valeurs plus basses (par ex. 64 échantillons) pourraient apporter de meilleures performances mais peut-être plus de problèmes avec le son. Sinon, consultez la [section dépannage](Client-Troubleshooting).

## Tout est installé ?

Jamulus a été installé et peut désormais être utilisé. Vous pouvez maintenant jeter un coup d'œil à la 

[page d'embarquement Jamulus](Onboarding){: .button}

## Pour mettre à jour votre installation vers une nouvelle version

Téléchargez les nouvelles sources conformément à la section [Obtenir les sources de Jamulus](Installation-for-Linux#obtenir-les-sources-de-jamulus) puis répétez simplement les [instructions de compilation](#compilons-ce-vilain-garçon) comme pour une nouvelle installation ci-dessus.

## Notes à l'attention des « geeks »

* La commande `make clean` est essentielle pour supprimer les fichiers Qt générés automatiquement qui sont présents dans le fichier .tar.gz et qui peuvent ne pas correspondre à la version Qt que vous utilisez.

* Pour utiliser une bibliothèque OPUS partagée externe au lieu de la bibliothèque intégrée, utilisez `qmake "CONFIG+=opus_shared_lib" Jamulus.pro`.

* Pour utiliser ce fichier, configurez le logiciel avec `qmake "CONFIG+=noupcasename" Jamulus.pro` pour vous assurer que le nom du binaire cible soit **j**amulus au lieu de **J**amulus.

* Utilisateurs de Raspberry Pi : vous pourriez vouloir compiler le client sur une autre machine et exécuter le binaire sur le Raspberry Pi. Dans ce cas, les seules bibliothèques dont vous avez besoin pour l'exécuter sont celles d'un [serveur sans <abbr title="Interface utilisateur graphique">IUG</abbr>](Server-Linux#serveur-sans-iug), mais _avec_ les paquets sons Jack. En particulier, jetez un œil à la note de bas de page pour la compilation sans IUG.

* À partir de la version 3.5.3, Jamulus n'est plus compatible avec Qt4.
