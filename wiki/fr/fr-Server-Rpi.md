---
layout: wiki
title: "Installation du serveur sur un Raspberry Pi"
lang: "fr"
permalink: "/wiki/Server-Rpi"
---

# Installation du serveur sur un [Raspberry Pi](https://www.raspberrypi.org/)

**_Assurez vous de lire les documents [Gestion d'un serveur](Running-a-Server) ainsi que [Installation du serveur sous Linux](Server-Linux) avant de poursuivre._**

_Jamulus à été testé sur un Raspberry Pi 4 2Gb par l'utilisateur de Jamulus, [SIVA Frédéric](https://sourceforge.net/u/fredsiva/profile/)  
Il est aussi utilisé sur un Rasperry Pi 4 8Gb par le traducteur de cette documentation, [Gérald Niel (aka. @gegeweb)](https://stoneartprod.xyz/@gegeweb), pour son [serveur public](http://jamulus.gegeweb.org) avec d'excellents résultats concernant la latence pour plusieurs musiciens et musiciennes en Europe._

1. Installez la dernière version de Raspbian (Raspberry OS) Buster (activez les services [VNC](https://www.raspberrypi.org/documentation/remote-access/vnc/) et [SSH](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md) pour le confort, cependant ne pas utiliser VNC consommera moins de ressource et augmentera les performances.

1. Editez le fichier [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/) pour activer le démarrage sans l'HDMI `hdmi_force_hotplug=0`

1. [Téléchargez les sources](Installation-for-Linux#obtenir-les-sources-de-jamulus), installez les [dépendances](Installation-for-Linux#installation-des-dépendances) en suivant le guide d'installation sous Linux mais **SANS INSTALLER** les package(s) Jack. Il n'y en a pas besoin pour un [serveur sans _GUI_](Server-Linux#serveur-sans-interface-graphique). Pour installer et utiliser le client, installez toutes les dépendances.

1. Compilez le code source code pour un serveur en suivant [ces instructions](Server-Linux#compiler-le-code-source. Pour compiler le client suivez [ces instructions](Installation-for-Linux#compiler-jamulus).

Ça va compiler le programme et placer le binaire ici : `/usr/local/bin/Jamulus`.

Connectez Raspberry Pi en filaire avec un câble Ethernet à votre routeur.

Si vous lancez Jamulus en mode serveur, vous pouvez tester en démarrant avec l'option `--server`, et accéder à l'interface graphique via VNC (or HDMI). Si vous n'avez pas d'écran, ou de serveur graphique, connectez vous à la machine en SSH et utilisez les options `--server --nogui` (`CTRL+C` pour stopper le serveur).  
Si vous démarrez en mode client, vous devriez voir la fenêtre du client s'afficher.

`Jamulus -s`

Si tout s'est bien passé, définissez le [type de serveur](Choosing-a-Server-Type) que vous souhaitez administrer et lancez la commande ci-dessous (_ou utilisez le script de démarrage `systemd` fournit dans le guide [Installation du serveur sous Linux](Server-Linux#création-du-script-de-démarrage)_), par exemple, pour un serveur public :

`sudo chrt 99 ionice -c1 nice -n -20 Jamulus -s -n -e [yourCentralServer] -o "yourServerName;yourCity;[country ID]" &`

**Lisez cette [note importante à propos des serveurs centraux](Central-Servers) !**

Voir aussi les [options de la ligne de commande](Command-Line-Options) pour les paramètres aui peuvent être ajustés.

***

### Pour mettre à jour le serveur

Stoppez le serveur et répétez simplement l'étape n°3 pour obtenir les sources et installer le binaire comme indiqué ci-dessus.

Si vous voulez installer une version spécifique, vous pouvez utilisez la commande `git` pour obtenir les sources où `[RELEASE]` est le n° de version (_Voir [les versions officielles](https://github.com/corrados/jamulus/releases)_), par exemple `r3_6_0`.

Tout d'abord placez vous dans le répertoire où les sources ont été préalablement téléchargées et décompressées avec `git`en utilisant la commande `cd` et executez les commandes suivantes :

~~~
git pull
git checkout [RELEASE]
~~~

Ensuite, compilez les sources comme pour une nouvelle installation et lancez Jamulus de nouveau.
