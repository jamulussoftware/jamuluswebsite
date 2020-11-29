---
layout: wiki
title: "Compilation"
lang: "fr"
permalink: "/wiki/Compiling"
---

# Compiler Jamulus depuis le code source

## Linux

Veuillez vous référer à la page [Installation sous Linux](Installation-for-Linux) ou suivez [ces instructions](Server-Linux#serveur-sans-gui) si vous souhaitez compiler un serveur sans <abbr title="Interface utilisateur graphique.">IUG</abbr>.

## MacOS
Vous n'avez pas besoin de compiler Jamulus sous macOS car nous fournissons les binaires officiels. Cependant, si vous souhaitez vraiment le faire, suivez les instructions ci-dessous.

### Pré-requis

1. Installez XCode
1. Installez QT comme indiqué ci-dessous

```shell
brew install qt5
brew link qt5 --force
```

### Construire le projet

#### Générez le fichier de projet XCode
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Affichez la cible et la configuration dans la console
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
va afficher
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

Ça va construire l'application et la rendre disponible dans `./Release/Jamulus.app`.


## Windows
Vous n'avez pas besoin de compiler Jamulus sous Windows car nous fournissons les binaires officiels. Cependant, si vous souhaitez vraiment le faire, suivez les instructions ci-dessous.

**Logiciels pré-requis**: [QT](https://www.qt.io/download), un compilateur comme Visual Studio, les bibliothèques de développement ASIO

- Obtenez le code source de Jamulus, par ex. via `git` ou en téléchargeant l'archive `.zip` depuis le dépôt de Jamulus.
- Obtenez et copiez le kit de développement [ASIOSDK](https://www.steinberg.net/de/company/developer.html) dans le répertoire jamulus/windows afin que, par ex., le répertoire jamulus/windows/ASIOSDK2/common existe.
- ouvrez Jamulus.pro dans Qt Creator et lancez la compilation.


## Notes générales

### Le drapeau de compilation "headless"

La compilation avec le drapeau `headless` signifie que vous pouvez éviter d'installer certains des paquets dépendants, économiser de l'espace disque et/ou accélérer votre temps de compilation dans les circonstances suivantes :

1. Si vous prévoyez d'utiliser Jamulus sous Gentoo Linux, les seuls paquets dont vous devriez avoir besoin pour une compilation headless sont `qtcore`, `qtnetwork`, `qtconcurrent` et `qtxml` (à la fois pour compiler et executer du serveur).

1. Si vous voulez utilisez Jamulus sur Ubuntu/Debian, vous aurez besoin de tous les paquets dépendants pour **compiler** le binaire, mais pour **executer** le serveur Jamulus sans IUG résultant, vous ne devriez avoir besoin que de `libqt5core5a`, `libqt5network5`, `libqt5xml5` et probablement `libqt5concurrent5`. Ça peut être utile pour compiler/mettre à jour sur une machine et utiliser le binaire sur une autre (un Raspberry Pi, par exemple).

1. Notez que si vous voulez compiler un client avec IUG sur une machine et l'exécuter sur une autre (par ex. un Raspberry Pi), vous n'avez besoin que des dépendances énumérées pour un [serveur sans IUG](Server-Linux#serveur-sans-iug) (voir le point ci-dessus), seulement _avec_ les bibliothèques Jack.

