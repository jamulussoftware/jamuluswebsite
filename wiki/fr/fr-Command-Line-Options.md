---
layout: wiki
title: "Command Line Options"
lang: "fr"
permalink: "/wiki/Command-Line-Options"
---

# Options de la ligne de commande

La plupart des fonctions courantes de Jamulus peuvent être définies à l'aide de l'interface graphique, mais ces fonctions et d'autres peuvent également être définies à l'aide d'options données dans une fenêtre de terminal. La manière exacte de procéder dépend de votre système d'exploitation.

Par exemple, sous Windows, pour qu'un client utilise un fichier de paramètres spécifique, cliquez avec le bouton droit de la souris sur le raccourci Jamulus et choisissez "Propriétés" > Cible. Ajoutez les arguments nécessaires à Jamulus.exe :

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" --inifile "C:\path\to\myinifile.ini"
```

Pour macOS, démarrez une fenêtre Terminal et exécutez Jamulus avec les options souhaitées comme ceci :

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus --inifile "/path/to/myinifile.ini"
```

_Notez que les options suivantes ne modifieront pas les reglages définis dans l'interface graphique._

### Paramètres généraux (modes client et serveur)

| Raccourci | Nom long 			| `[...]` signifie paramètre facultatif 															| Notes 								  |
|-----------|-------------------|---------------------------------------------------------------------------------------------------|-----------------------------------------|
|  `-h,-?`  | `--help`          | Affiche ce texte d'aide                                                                           | 										  |
|  `-i`     | `--inifile`       | Définit l'emplacement du fichier d'initialisation (remplace la valeur par défaut)                 | Client (toujours) and server (avec IGU) |
|  `-n`     | `--nogui`         | Désactive l'IGU                                                                                   | 										  |
|  `-p`     | `--port`          | Numéro du port UDP local. La valeur par défaut est 22124                                          | 										  |
|  `-Q`     | `--qos`           | Définit la valeur DSCP de la qualité de service. La valeur par défaut est 128. Désactiver avec 0. | QoS ignorée par Windows, consultez [Tips & Tricks](Tips-Tricks-More#quality-of-service). |
|  `-t`     | `--notranslation` | Désactive les traductions                                                                         |										  |
|  `-v`     | `--version`       | Affiche les informations sur la version et quitte                                                 | 										  |

### Serveur seulement

| Raccourci | Nom long      | `[...]` signifie paramètre facultatif 																| Notes									  |
|-------|-------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------|
| `-d`  | `--discononquit`  | Déconnecter tous les clients en quittant   														    | 										  | 
| `-e`  | `--centralserver` | Rend le serveur public et définit son genre. Voir aussi `-o`. 										| Voir [Type de serveur](Choosing-a-Server-Type#3-central) |
| `-f`  | `--listfilter`    | Liste blanche des serveurs s'enregistrant sur la liste des serveurs, format  `ip address 1[;ip address 2]` | Serveur seulement. [Voir note](Choosing-a-Server-Type#3-central) |
| `-F`  | `--fastupdate`    | Réduit la latence des clients connectés avec l'option "Activer les petits tampons réseau". Nécessite un processeur plus rapide pour éviter les pertes de données et plus de bande passante pour les clients activés. | |
| `-l`  | `--log`           | Active l'enregistrement, définir le chemin et le nom de fichier 										|										  |
| `-L`  | `--licence`       | Affiche une fenêtre d'accord avant que les utilisateurs puissent se connecter						    |										  |
| `-o`  | `--serverinfo`    | Détails de l'emplacement du serveur dans le format : `[nom];[ville];[locale value]` (voir [values](https://doc.qt.io/qt-5/qlocale.html#Country-enum)) | Serveurs publics seulement |
| `-P`  | `--delaypan`      | Commencez avec le panoramique à retardement activé 												| voir [réglages serveur](https://jamulus.io/wiki/Server-Win-Mac#other+options) |
| `-R`  | `--recording`     | Inclure un chemin accessible en écriture où les fichiers doivent être stockés (entre guillemets si nécessaire). | voir [réglages serveur](Server-Win-Mac#recording) |
|       | `--norecord`      | Désactive l'enregistrement lorsqu'il est activé par défaut par -R 									|  	   									  |

### Client seulement

| Raccourci | Nom long      | `[...]` signifie paramètre facultatif                                                              | Notes 									|
|-----------|---------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| `-M`  | `--mutestream`    | Démarre Jamulus silencé 																			 |											|
|       | `--mutemyown`     | Me silencer dans le mix personnel 																 | Headless seulement 						|
| `-c`  | `--connect`       | Se connecter à l'adresse du serveur donné au démarrage, format `address[:port]` 					 |								 			|
| `-j`  | `--nojackconnect` | Désactive les connections automatique de JACK 													 |											|
|       | `--ctrlmidich`    | Canal du contrôleur MIDI à écouter, décalage du numéro de contrôle et numéros CC consécutifs (canaux). Format: `channel[;f*][;p*][;s*][;m*]` 	| voir [Trucs & Astuces](Tips-Tricks-More#Using-ctrlmidich-for-MIDI-controllers) |
|       | `--clientname`    | Titre de la fenêtre et nom du client JACK 														 |											|
