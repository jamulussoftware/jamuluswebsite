---
layout: wiki
title: "Installation du serveur sur un Raspberry Pi"
lang: "fr"
permalink: "/wiki/Server-Rpi"
---

# Installation du serveur sur un [Raspberry Pi](https://www.raspberrypi.org/)

**_Assurez vous d'avoir lu la page [Administration d'un serveur](Running-a-Server)_**

_Jamulus à été testé sur un Raspberry Pi 4 2Gb par l'utilisateur de Jamulus, [SIVA Frédéric](https://sourceforge.net/u/fredsiva/profile/)_ 

1. Installez la dernière version de Raspbian Buster (activez les services [VNC](https://www.raspberrypi.org/documentation/remote-access/vnc/) et [SSH](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md)  pour le confort, mais il fonctionnera finalement sans VNC pour de meilleures performances).

1. Editez le fichier [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/) pour activer le démarrage sans l'HDMI en ajoutant `hdmi_force_hotplug=0`

1. [Téléchargez les sources](Installation-for-Linux#obtenir-les-sources-de-jamulus), installez les [dépendances](Installation-for-Linux#installation-des-dépendances) en suivant le guide d'installation sous Linux mais **SANS INSTALLER le(s) package(s) Jack**. Il n'y en a pas besoin pour un [serveur sans <abbr title="Interface graphique utilisateur">IUG</abbr>](Server-Linux#serveur-sans-iug). Pour utiliser le client, installez toutes les dépendances.

1. Compilez le code source pour un serveur en suivant [ces instructions](Server-Linux#compiler-le-code-source). Pour compiler le client suivez [les instructions par défaut](Installation-for-Linux#compiler-jamulus).

Ça va compiler le programme et placer le binaire dans `/usr/local/bin/Jamulus`.

Connectez le Raspberry Pi à votre routeur en Ethernet.

Si vous lancez Jamulus en mode serveur, testez en démarrant avec l'option `--server`, et accédez à l'interface graphique via VNC (ou HDMI). Si vous démarrez en mode client, vous devriez voir la fenêtre du client s'afficher.

`Jamulus -s`

Si tout va bien, démarrez dans le [mode serveur](Choosing-a-Server-Type) de votre choix comme suit (_ou utilisez le script de démarrage `systemd` fournit dans le guide [Installation du serveur sous Linux](Server-Linux#création-du-script-de-démarrage)_), par exemple, pour un serveur public :

`sudo chrt 99 ionice -c1 nice -n -20 Jamulus -s -n -e [yourCentralServer] -o "yourServerName;yourCity;[country ID]" &`

**Lisez aussi cette [note importante à propos des serveurs centraux](Central-Servers).**

Voir aussi les [options de la ligne de commande](Command-Line-Options) pour les paramètres que vous pouvez configurer.

***

### Pour mettre à jour le serveur

Stoppez le serveur et répétez simplement l'étape n°3 pour obtenir les sources et installer le binaire comme indiqué ci-dessus.

Si vous voulez installer une version spécifique, vous pouvez suivre la suite avec git (où `[RELEASE]` est le n° de la version tel que r3_6_1). Voir [les versions officielles](https://github.com/corrados/jamulus/releases), 

Pour commencer, `cd` dans le répertoire où les sources ont été décompressées/téléchargées, et utilisez les commandes suivantes :

~~~
git pull
git checkout [RELEASE]
~~~

Ensuite, compilez les sources comme pour une nouvelle installation. Lancez Jamulus de nouveau.
