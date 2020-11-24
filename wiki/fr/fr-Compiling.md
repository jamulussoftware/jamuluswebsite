---
layout: wiki
title: "Compiler Jamulus"
lang: "fr"
permalink: "/wiki/Compiling"
---

# Compiler Jamulus depuis le code source

## Linux

Veuillez vous référer aux documents [Installation sous Linux](Installation-for-Linux) ou ces instructions si vous souhaitez [compiler un serveur sans _GUI_](Server-Linux#serveur-sans-interface-graphique)

## MacOS
Il n'est pas nécéssaire de compiler Jamulus sous macOS depuis que nous fournissons les binaires officiels. Mais si vous tenez vraiment à le faire, suivez les instructions ci-dessous.

### Pré-requis

1. Installez XCode
1. Installez QT comme indiqué ci-dessous

```shell
brew install qt5
brew link qt5 --force
```

### Compiler Jamulus

#### Generrer le fichier de projet XCode
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Affichez la cible et la configuration dans la console
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
va afficher :
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

#### Compilez le projet

```shell
xcodebuild build
```

Ceci va compiler et construire l'application `Jamulus.app` et la rendre disponible dans le répertoire `./Release`.


## Windows
Il n'est pas nécéssaire de compiler Jamulus sous Windows depuis que nous fournissons les binaires officiels. Mais si vous tenez vraiment à le faire, suivez les instructions ci-dessous.

**Logiciels pré-requis**: [QT](https://www.qt.io/download), un compilateur comme Visual Studio, les bibilothèque de développement ASIO

- Obtenez les sources de Jamulus via `git` ou en téléchargeant l'archive `.zip` depuis le dépot de Jamulus.
- Obtenez et copiez le kit de développement [ASIOSDK](https://www.steinberg.net/de/company/developer.html) dans le répertoire `jamulus/windows` afin que le répertoire (par exemple) `jamulus/windows/ASIOSDK2/common` existe.
- ouvrez Jamulus.pro dans `Qt Creator` et lancez la compilation.


## Notes générales

### Option de compilation _headless_

La compilation avec l'option _headless_ signifie que vous pouvez éviter d'installer certains des paquets dépendants, économiser de l'espace disque et/ou accélérer votre temps de compilation dans les circonstances suivantes :

1. Si vous prévoyez d'utiliser Jamulus sous Gentoo Linux, les seuls paquets dont vous devriez avoir besoin pour une compilation _headless_ sont `qtcore`, `qtnetwork` et `qtxml` (à la fois pour la compilation et l'exécution du serveur).

1. Si vous voulez utilisez Jamulus sur Ubuntu/Debian, vous aurez besoin de tous les paquets dépendants pour **compiler** le binaire, mais pour **exécuter** le serveur _headless_ Jamulus résultant, vous ne devriez avoir besoin que de `libqt5core5a`, `libqt5network5`, `libqt5xml5` et probablement `libqt5concurrent5`. Cela peut être utile pour compiler/mettre à jour sur une machine afin de faire tourner le binaire sur une autre (un Raspberry Pi, par exemple).

1. Notez que si vous voulez compiler un client _GUI_ sur une machine et l'exécuter sur une autre (par exemple un Raspberry Pi), vous n'avez besoin que des dépendances énumérées pour un [serveur sans _GUI_](Server-Linux#serveur-sans-interface-graphique) (_voir le point ci-dessus_), seulement _avec_ les bibliothèques Jack.

