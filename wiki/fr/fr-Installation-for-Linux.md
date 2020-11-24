---
layout: wiki
title: "Installation sous Linux"
lang: "fr"
permalink: "/wiki/Installation-for-Linux"
---


# Installation sous Linux

Assurez-vous de lire le [guide de démarrage et installation](Getting-Started) avant de commencer.

**Pour l'instant, nous ne fournissons pas de paquets officiels pour Jamulus**

Vous trouverez [ici]((https://github.com/corrados/jamulus/issues/223#issue-619038918){: target="_blank" rel="noopener noreferrer"}) une liste de paquets non officiels pour les différentes distributions. Vous pouvez également utiliser [ce script tout-en-un](Linux-Client-Install-Script) si vous le souhaitez.

En revanche, la compilation des sources est assez facile :

## Obtenir les sources de Jamulus

1. Ouvrez une fenêtre de terminal (ligne de commande - `CTRL+ALT+t` sur Ubuntu et les distributions dérivées)
1. Téléchargez et dézippez les sources de la dernière version :
```shell
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


## Installation des dépendances

Tout d'abord, mettez à jour votre liste de paquets (par exemple sur les distributions basées sur Debian avec `sudo apt-get update`).

Sur les distributions basées sur **Ubuntu** 18.04+, et sur Debian 9 ou 10 :

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Sur **Debian** 11 (bullseye) et suivante, ainsi que sur Raspberry Pi Raspbian Buster et suivante :

```shell
sudo apt-get install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Sur **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel
```

### Qjackctl : Optionnel, mais recommandé

[QjackCtl](https://qjackctl.sourceforge.io) est un utilitaire qui vous aide à configurer le serveur audio Jack (installé dans le cadre des dépendances ci-dessus). Installez-le par exemple via

```shell
sudo apt-get install qjackctl
```

Vous pouvez également envisager d'utiliser un [noyau à faible latence](https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (ex. pour Ubuntu 18.04 : `sudo apt-get install linux-lowlatency-hwe-18.04`).


## Compiler Jamulus

Maintenant, placez vous (`cd`) dans le répertoire des sources jamulus que vous avez téléchargé :

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


## Configurer l'interface audio

### Configuration de Jack avec QJackCtl

Les clients de Jamulus ont besoin de [Jack](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"} pour fonctionner, mais vous devez d'abord le configurer. La méthode recommandée est d'utiliser `QjackCtl`.

1. Ouvrez le terminal, par exemple avec Crtl-Alt-T et
1. Exécutez la commande `qjackctl` vous verrez le **Jack Audio Connection Kit**
2. Configurez votre interface audio comme suit (les paramètres exacts pour Jack dépendront de ce dont votre interface audio/carte son est capable) :

- Réglez l'**interface audio** sur celle que vous souhaitez (il peut y en avoir plusieurs dans la liste)
- Fixer le **taux d'échantillonnage à 48000** (48 KHz)
- Fixer les **cadres/périodes à 128** et les périodes/tampons à 2 au début

Redémarrez Jack pour prendre en compte ces nouveaux paramètres.

### Démarrer Jamulus
1. Ouvrez le terminal, par exemple avec `Crtl-Alt-T`, puis,
1. Executez la commande `Jamulus` (avec un **'J' majuscule**) et vous démarrerez le client Jamulus

Jamulus se trouve dans `/usr/local/bin`. Vous pouvez maintenant supprimer le répertoire des sources à partir duquel vous l'avez compilé.

Si vous avez des problèmes de coupure du son (en particulier des erreurs XRUN signalées par Jack/QJackCtl), essayez de définir des valeurs plus élevées (par exemple 256 images ou 3 périodes) à l'étape 3 ci-dessus. Des valeurs plus basses (par exemple 64 images) pourraient apporter de meilleures performances mais peut-être plus de problèmes de son. Sinon, consultez la [section dépannage](Client-Troubleshooting).

## Tout es installé ?
Consultez la section [configuration du matériel](Hardware-Setup).

Pour des informations plus détaillées sur l'utilisation de Jamulus, vous pouvez aussi consulter l'[aide de Jamulus (Manuel du Logiciel)](Software-Manual).


## Pour mettre à jour votre installation vers une nouvelle version

Téléchargez de nouveau les sources comme à la section [obtenir les sources de Jamulus](#obtenir-les-sources-de-jamulus) et répétez simplement les [instructions de compilation](#compiler-jamulus) comme pour une nouvelle installation ci-dessus.

## Notes à l'attention des « _geeks_ » et des curieux

* La commande `make clean` est essentielle pour supprimer les fichiers Qt générés automatiquement qui sont présents dans le fichier `.tar.gz` et qui peuvent ne pas correspondre à la version Qt que vous utilisez.

* Pour utiliser une bibliothèque OPUS externe partagée au lieu de la bibliothèque intégrée, utilisez `qmake "CONFIG+=opus_shared_lib" Jamulus.pro`.

* Pour utiliser ce fichier, configurez le logiciel avec `qmake "CONFIG+=noupcasename" Jamulus.pro` pour vous assurer que le nom de la cible de sortie de ce logiciel est **j**amulus au lieu de **J**amulus (avec un **'j' minuscule**).

* Utilisateurs de Raspberry Pi : Vous pouvez compiler le client sur une autre machine et exécuter le binaire sur le Raspberry Pi. Dans ce cas, les seules bibliothèques dont vous avez besoin pour l'exécuter sont celles d'un [serveur sans _GUI_](Server-Linux#serveur-sans-gui)) (« _Headless Server_ »), mais _avec_ les paquets de Jack. Regardez surtout la note de bas de page pour la [compilation sans GUI](Server-Linux#que-fait-le-drapeau-de-compilation-headless).

* À partir de la version 3.5.3, Jamulus n'est plus compatible avec Qt4.
