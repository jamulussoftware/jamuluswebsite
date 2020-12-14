---
layout: wiki
title: "Options en ligne de commande"
lang: "fr"
permalink: "/wiki/Command-Line-Options"
---

# Options en ligne de commande

Si les fonctions les plus courantes de Jamulus peuvent être configurées à l'aide de l'interface graphique, Jamulus peut également être contrôlé à l'aide de ces options lorsqu'il est démarré en ligne de commande. La manière exacte de procéder dépendra de votre système d'exploitation.

Par exemple, sous Windows pour activer l'enregistrement avec l'option `-R` : cliquez-droit sur le raccourci Jamulus et choisissez `Propriétés` > `Cible`. Ajoutez les arguments nécessaires au fichier `Jamulus.exe` :

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" -s -R "C:\chemin\vers\vos\enregistrements de bœufs"
```

Pour macOS, lancez une fenêtre de terminal et exécutez Jamulus avec les options souhaitées comme ceci:

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus -s -R "/chemin/vers/vos/enregistrements de bœufs"
```

***

Vous pouvez voir toutes les options possibles prises en charge par votre version en démarrant Jamulus avec l'option `-h`.


| Courte | Nom long  | `[...]` signifie paramètre optionnel     |  |
|--------|-----------|----------------------------------|-----------|
|    `-c` |`--connect`        | Se connecter à une adresse de serveur donnée au démarrage, format `adresse[:port]`. | (client uniquement) |
|    `-d` |`--discononquit`   | Déconnecter tous les clients à fermeture | (serveur uniquement) |
|    `-e` |`--centralserver`  | Rend le serveur public et fixe son genre. Voir aussi `-o`| [Voir la liste](Central-Servers) |
|    `-f` |`--listfilter`     | Serveurs de la liste blanche s'inscrivant sur la liste de serveur, format `adresse IP 1[;adresse IP 2]` | (serveur central uniquement) [Voir la note note](Choosing-a-Server-Type#3-central). |
|    `-F` |`--fastupdate`     | Mode taille de trame de 64 échantillons. Réduit la latence si les clients se connectent avec l'option "Activer les petits tampons de réseau". Nécessite un processeur plus rapide pour éviter les décrochages, et plus de bande passante pour les clients actifs. | (serveur uniquement) |
| `-h,-?` |`--help`           | Ce texte d'aide | (client et serveur) |
|    `-i` |`--inifile`        | Définir l'emplacement du fichier d'initialisation (écrase la valeur par défaut) | (client (toujours) et serveur (avec IUG)) |
|    `-j` |`--nojackconnect`  | Désactiver les connexions JACK automatiques | (client uniquement) |
|    `-l` |`--log` | Activer la journalisation, définir le chemin et le nom du fichier | (serveur uniquement) |
|    `-m` |`--htmlstatus`     | Activer le fichier de statut HTML, définir le chemin et le nom du fichier | (serveur uniquement) |
|    `-M` |`--mutestream`     | Démarrer Jamulus en mode silence | (client uniquement) |
|    `-n` |`--nogui`          | Désactiver l'IUG | (client et serveur) |
|    `-o` |`--serverinfo`     | Détails sur l'emplacement du serveur dans le format : <br/>`[nom];[ville];[valeur de la locale]` (voir [valeurs](https://doc.qt.io/qt-5/qlocale.html#Country-enum))| (serveurs publics uniquement) |
|    `-p` |`--port`           | Numéro de port UDP local. 22124 par défaut | (serveur uniquement) |
|    `-R` |`--recording`      | Inclure un chemin d'accès en écriture où les fichiers doivent être stockés (entre guillemets si nécessaire). | (serveur uniquement) Voir la description dans [paramétrage du serveur](Server-Win-Mac#recording). |
|       | `--norecord`      | Démarrer l'enregistreur avec l'enregistrement désactivé | (serveur uniquement) |
|    `-s` |`--server`         | Démarrer en mode serveur | (serveur uniquement) [Voir note](Choosing-a-Server-Type) |
|    `-t` |`--notranslation`  | Désactiver les traductions | (client et serveur) |
|    `-T` |`--multithreading` | Activer le multithreading | (serveur uniquement) |
|    `-u` |`--numchannels`    | Nombre maximum d'utilisateurs. 10 par défaut, 50 au maximum | (serveur  uniquement) |
|    `-w` |`--welcomemessage` | Accepte le formatage  HTML et CSS en ligne (entre guillemets), ou définit le chemin d'accès vers un fichier texte. | (serveur uniquement) |
|    `-z` |`--startminimized` | Démarrage minimisé | (serveur uniquement) |
|       |`--ctrlmidich`     | Canal de contrôle MIDI à écouter et décalage de numéro de contrôle, format : `channel[;offset]` | (client uniquement) voir [Trucs et astuces](Tips-Tricks-More#using-ctrlmidich-for-midi-controllers) |
|       |`--clientname`     | Titre de la fenêtre et nom du client Jack | (client uniquement) |
