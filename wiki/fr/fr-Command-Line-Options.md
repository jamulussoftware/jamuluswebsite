---
layout: wiki
title: "Options en ligne de commande"
lang: "fr"
permalink: "/wiki/Command-Line-Options"
---

# Options en ligne de commande

Si les fonctions les plus courantes de Jamulus peuvent être configurées à l'aide de l'interface graphique, Jamulus peut également être contrôlé à l'aide de ces options lorsqu'il est démarré en ligne de commande. La manière exacte de procéder dépendra de votre système d'exploitation.

Par exemple, sous Windows pour activer l'enregistrement avec l'option `-R` : cliquez avec le bouton droit de la souris sur le raccourci Jamulus pour afficher le menu contextuel, choisissez `Propriétés` > `Cible` et ajoutez les arguments nécessaires au fichier `Jamulus.exe` :

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" -s -R "C:\path\to\your\Jam Recordings"
```

Sous MacOS, lancez `Terminal.app` _(`Applications` > `Utilitaire` > `Terminal`)_ et executez Jamulus avec l'option désirée comme ci-dessous (nous partons du principe que Jamulus est dans le dossier `Applications`) :

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus -s -R "/path/to/your/jam recordings"
```

***

Vous pouvez afficher l'ensemble des options de configuration que votre version de Jamulus supporte en executant la commande avec l'option `-h`, `--help` ou `-?`. 


| Courte | Longue    | `[...]` signifie en option       | type      |
|--------|-----------|----------------------------------|-----------|
|    `-c` |`--connect`        | Se connecter à l'adresse ou l'IP d'un serveur précis au démarrage, format `adresse[:port]`<br/>Pour se connecter à un serveur privé, par exemple. | client |
|    `-d` |`--discononquit`   | Déconnecter tous les clients à fermeture | serveur |
|    `-e` |`--centralserver`  | Rendre le serveur public et se connecter à un [serveur central](Central-Servers), format `adresse:port`. Voir aussi l'option `-o`| [serveur&nbsp;public](Choosing-a-Server-Type#1-serveur-public) |
|    `-f` |`--listfilter`     | Serveurs autorisés à se référencer sur ce serveur cantral, format `adresse IP 1[;adresse IP 2]` | [serveur&nbsp;central](Choosing-a-Server-Type#3-serveur-central) |
|    `-F` |`--fastupdate`     | 64 échantillons pour la taille des tampons. Réduit la latence si les clients se connectent avec l'option "Activer les petits tampons réseau". Nécessite un processeur plus rapide pour éviter les coupures, et plus de bande passante pour les _clients_ connectés. | serveur |
| `-h,-?` |`--help`           | La présente aide | client<br/>serveur |
|    `-i` |`--inifile`        | Définir l'emplacement du fichier d'initialisation (annule la valeur par défaut) | client (toujours)<br/>serveur (IUG) |
|    `-j` |`--nojackconnect`  | Désactiver la connexion automatique à Jack | client |
|    `-l` |`--log` | Activer la journalisation, définir le chemin et le nom du fichier. | serveur |
|    `-m` |`--htmlstatus`     | Activer le fichier de statut HTML, définir le chemin et le nom du fichier | [serveur](Tips-Tricks-More#making-a-server-status-page) |
|    `-M` |`--mutestream`     | Démarrer Jamulus en mode silence | client |
|    `-n` |`--nogui`          | Désactiver l'interface graphique (IUG) | client<br/>serveur |
|    `-o` |`--serverinfo`     | Localisation géogaphique et nom du serveur au format: <br/>`[name];[city];[id de la locale]`<br/>_voir [valeurs](https://doc.qt.io/qt-5/qlocale.html#Country-enum)_| [serveur public](Choosing-a-Server-Type#1-serveur-public) |
|    `-p` |`--port`           | Port d'écoute du serveur, 22124 par défaut si non spécifié | serveur |
|    `-R` |`--recording`      | Active l'enregistrement.<br/>Inclure un chemin d'accès en écriture où les fichiers doivent être stockés (entre guillemets si nécessaire). | [serveur](Server-Win-Mac#enregistrement) |
|       | `--norecord`      | Démarrer l'enregistreur avec l'enregistrement désactivé | serveur |
|    `-s` |`--server`         | Démarrer en mode serveur | [serveur](Choosing-a-Server-Type) |
|    `-t` |`--notranslation`  | Désactiver les traductions | client<br>serveur |
|    `-T` |`--multithreading` | Activer le multithreading | serveur |
|    `-u` |`--numchannels`    | Nombre maximum de canaux/clients autorisés sur le serveur&nbsp;: 10 par défaut, 50 au maximum | serveur |
|    `-w` |`--welcomemessage` | Message affiché dans la fenêtre de chat à la connexion au serveur. Accèpte le HTML et les CSS (entre guillemets simple), ou définir le chemin d'accès vers un fichier texte. | serveur |
|    `-z` |`--startminimized` | Démarrage fenêtre réduite | serveur (IUG) |
|       |`--ctrlmidich`     | Canal de contrôle MIDI à écouter | [client](Tips-Tricks-More) |
|       |`--clientname`     | Titre de la fenêtre et nom du client Jack | client |
