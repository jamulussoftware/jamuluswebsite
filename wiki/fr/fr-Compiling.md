---
layout: wiki
title: "Compilation"
lang: "fr"
permalink: "/wiki/Compiling"
---

# Compiler Jamulus depuis le code source

## Linux

Veuillez vous référer à la [page d'installation du client](Installation-for-Linux) ou ces instructions si vous souhaitez [compiler un serveur sans <abbr title="Interface utilisateur graphique.">IUG</abbr>](Server-Linux#serveur-sans-iug).

## macOS
Vous n'avez pas besoin de compiler Jamulus sous macOS puisque nous fournissons des binaires officiels, mais si vous souhaitez vraiment le faire, suivez les instructions ci-dessous.

### Pré-requis

1. Installez XCode
1. Installez Qt comme suit

```shell
brew install qt5
brew link qt5 --force
```

### Construire le projet

#### Générer le fichier de projet XCode
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Afficher les cibles de construction et la configuration dans la console
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
affichera
```shell
Targets:
    Jamulus
    Qt Preprocess

Build Configurations:
    Debug
    Release

If no build configuration is specified and -scheme is not passed then "Release" is used.

Schemes:
    Jamulus
```

#### Construire le projet

```shell
xcodebuild build
```

Construira l'application et la rendra disponible dans `./Release/Jamulus.app`.


## Windows
Vous n'avez pas besoin de compiler Jamulus sous Windows puisque nous fournissons des binaires officiels, mais si vous souhaitez vraiment le faire, suivez les instructions ci-dessous.

**Logiciels pré-requis**: [QT](https://www.qt.io/download), un compilateur comme Visual Studio, les fichiers de développement ASIO

- Obtenez le code source de Jamulus, par ex. via git ou en téléchargeant l'archive zip depuis le dépôt de Jamulus.
- Obtenez et copiez les fichiers de développement [ASIOSDK](https://www.steinberg.net/de/company/developer.html) dans le répertoire `[\chemin\vers\les\sources\jamulus]\windows` afin que, par ex., le répertoire `[\chemin\vers\les\sources\jamulus]\ASIOSDK2\common` existe.
- ouvrez Jamulus.pro dans Qt Creator puis compilez et exécutez.


## Notes générales

### Le fanion de compilation "headless"

La compilation avec le fanion `headless` signifie que vous pouvez éviter d'installer certains des paquets dépendants, économiser de l'espace disque et/ou accélérer votre temps de construction dans les circonstances suivantes :

1. Si vous prévoyez d'utiliser Jamulus sous Gentoo Linux, les seuls paquets dont vous devriez avoir besoin pour une compilation headless sont `qtcore`, `qtnetwork`, `qtconcurrent` et `qtxml` (à la fois pour compiler et exécuter le serveur).

1. Si vous utilisez Jamulus sur Ubuntu/Debian, vous aurez besoin de tous les paquets dépendants pour **compiler** le binaire, mais pour **executer** le serveur Jamulus sans IUG résultant, vous ne devriez avoir besoin que de `libqt5core5a`, `libqt5network5`, `libqt5xml5` et probablement `libqt5concurrent5`. Ceci peut être utile pour compiler/mettre à jour sur une machine pour exécuter le binaire sur une autre (un Raspberry Pi, par exemple).

1. Notez que si vous voulez compiler un client avec IUG sur une machine et l'exécuter sur une autre (par ex. un Raspberry Pi), vous n'avez besoin que des dépendances listées pour un [serveur sans IUG](Server-Linux#serveur-sans-iug) (voir le point ci-dessus), seulement _avec_ les bibliothèques JACK.
