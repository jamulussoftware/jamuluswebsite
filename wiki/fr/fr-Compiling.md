---
layout: wiki
title: "Compiling"
lang: "fr"
permalink: "/wiki/Compiling"
---

# Compiler Jamulus depuis les sources

## Linux

Veuillez vous reporter à la page d'[installation sous linux](Installation-for-Linux) ou à ces instructions si vous souhaitez [compiler un serveur headless](Server-Linux#running-a-headless-server).

## macOS
Vous n'avez pas besoin de compiler Jamulus pour macOS puisque nous fournissons des binaires officiels, mais si vous le souhaitez vraiment, suivez les instructions ci-dessous.
### Exigences

1. Installer XCode
1. Installer Qt comme suit

```shell
brew install qt5
brew link qt5 --force
```

### Construire le projet

#### Générer le fichier du projet XCode
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Imprimer les cibles de construction et la configuration dans la console
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

Construira le fichier et le rendra disponible dans `./Release/Jamulus.app`


## Windows
Vous n'avez pas besoin de compiler Jamulus pour Windows puisque nous fournissons des binaires officiels, mais si vous le souhaitez vraiment, suivez les instructions ci-dessous.

### Logiciels requis
* Un compilateur comme [Visual Studio](https://visualstudio.microsoft.com) (Vous avez seulement besoin de [Build Tools 2017 or 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16) mais vous pouvez aussi choisir de télécharger et d'installer l'IDE complet depuis la [Visual Studio download page](https://visualstudio.microsoft.com/downloads/))
* [Qt](https://www.qt.io/download)
    * Utiliser la licence gratuite GPLv2 pour le développement de logiciels libres.
    * Pour déterminer la version de Qt dont vous avez besoin, vérifiez [qt-installer-windows.qs](https://github.com/jamulussoftware/jamulus/blob/master/windows/qt-installer-windows.qs): dans INSTALL_COMPONENTS vous verrez `qt.qt5.[version]`, par exemple, 5123 signifie version 5.12.3.
    * Sélectionnez Composants pendant l'installation : Développez la section Qt, trouvez la version correspondante, par exemple **Qt 5.12.3**, et ajoutez les composants du compilateur pour votre compilateur, par exemple `MSVC 2017 32-bit/64-bit` pour Visual Studio 2019.
* [Fichiers de développement ASIO](https://www.steinberg.net/en/company/developer.html)


### Télécharger le code source de Jamulus
Obtenez le code source de Jamulus, par exemple via git ou [téléchargement zip](https://github.com/jamulussoftware/jamulus/archive/master.zip) à partir du [dépôt Jamulus](https://github.com/jamulussoftware/jamulus).


### Compilation et construction de l'installateur

La plupart des utilisateurs voudront probablement utiliser cette méthode :

1. Ouvrir PowerShell
1. Naviguer vers le répertoire `jamulus`.
1. Pour autoriser les scripts non signés, faire un clic droit sur le script `windows\deploy_windows.ps1`, sélectionner les propriétés et autoriser l'exécution de ce script. Vous pouvez également exécuter `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`. (Vous pouvez revenir en arrière après avoir exécuté ce script. Pour plus d'informations, voir la [page de documentation Microsoft PowerShell] (https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)).
1. Modifier les variables $QtCompile32 et $QtCompile64.
1. Exécuter le script de compilation et d'installation de Jamulus dans PowerShell : `.\windows\deploy_windows.ps1 C:\Qt\QtVersion`.
1. Le programme d'installation de Jamulus se trouve dans le répertoire `.\deploy`.

### Compilation uniquement

1. Créer un dossier sous ``windows`` appelé ASIOSDK2
1. Télécharger le [ASIOSDK](https://www.steinberg.net/asiosdk), ouvrir le dossier de premier niveau du fichier .zip et copier le contenu dans `[\path\to\jamulus\source]\windows\ASIOSDK2` de sorte que, par exemple, le dossier `[\path\to\jamulus\source]\windows\ASIOSDK2\common` existe.
1. Ouvrir Jamulus.pro dans Qt Creator, configurer le projet avec un kit par défaut, puis le compiler et l'exécuter.


## Notes générales

### Le drapeau de compilation "headless"

Compiler avec le drapeau `headless` signifie que vous pouvez éviter d'installer certains des paquets dépendants, économiser de l'espace disque et/ou accélérer votre temps de construction dans les circonstances suivantes :

1. Si vous prévoyez de faire tourner Jamulus sur Gentoo Linux, les seuls paquets dont vous aurez besoin pour une compilation sans tête sont `qtcore`, `qtnetwork`, `qtconcurrent` et `qtxml` (à la fois pour construire et faire tourner le serveur).

1. Si vous exécutez Jamulus sur Ubuntu/Debian, vous aurez besoin de tous les paquets dépendants pour **compiler** le binaire, mais pour **exécuter** le serveur sans tête Jamulus résultant, vous devriez seulement avoir besoin de `libqt5core5a`, `libqt5network5`, `libqt5xml5` et probablement `libqt5concurrent5`. Cela peut être utile pour compiler/mettre à jour sur une machine pour exécuter le binaire sur une autre (un Raspberry Pi, par exemple).

1. Notez que si vous voulez compiler un client GUI sur une machine et l'exécuter sur une autre (par exemple un Raspberry Pi), vous n'avez besoin que des dépendances listées pour un [serveur headless](Server-Linux#running-a-headless-server) (voir point ci-dessus), seulement _avec_ les bibliothèques sonores JACK.
