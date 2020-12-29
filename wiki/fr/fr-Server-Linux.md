---
layout: wiki
title: "Installation d'un serveur sous Linux"
lang: "fr"
permalink: "/wiki/Server-Linux"
---

# Installation d'un serveur sous Linux

**_Veuillez d'abord vous assurez d'avoir lu la [vue générale d'un serveur](Running-a-Server)_**

<!-- pas de <abbr> ici à cause du lien interne -->
## Exécuter un serveur avec IUG

Si vous prévoyez d'exécuter le serveur sur votre poste de travail (et que vous avez déjà installé le client Jamulus), vous pouvez exécuter le serveur dans le [mode serveur](Choosing-a-Server-Type) choisi en exécutant Jamulus avec l'option `-s` comme suit :

1. Ouvrir une fenêtre de terminal (`CTRL+ALT+t` sur Ubuntu et distributions associées).
1. Partant du principe que Jamulus est dans `/usr/local/bin`, taper `Jamulus -s`

Appuyez sur entrée et vous devriez voir la fenêtre de contrôle du serveur. Vous pouvez arrêter le serveur en fermant la fenêtre du serveur, ou en tapant CTRL+C dans le terminal.

**Pour configurer le serveur**, veuillez vous référer aux [instructions pour Windows et Macintosh](Server-Win-Mac).

Voir aussi les [options en ligne de commande](Command-Line-Options) pour les autres paramètres que vous pouvez configurer.

## Exécuter un serveur sans IUG

Le guide suivant permet d'utiliser Jamulus comme un serveur "pur" sur du **matériel sans audio** (par exemple sur un hôte tiers ou dans le nuage) et suppose des distributions Ubuntu/Debian utilisant systemd. Nous avons également des instructions pour [Raspberry Pi](Server-Rpi), qui est aussi très bien.

* _L'utilisateur de Jamulus [Grigory](https://sourceforge.net/u/cidnurg/profile/), maintient une **[image Docker pour Jamulus](https://hub.docker.com/r/grundic/jamulus)** que vous pouvez utiliser._

### Compilation des sources, création d'un utilisateur


1. [Téléchargez les sources](Installation-for-Linux#obtenir-les-sources-de-jamulus), installez les [paquets dépendants](Installation-for-Linux#installation-des-dépendances) comme indiqué dans le guide d'installation du client Linux. À noter que **vous n'avez pas besoin d'installer le(s) paquet(s) JACK** pour un serveur sans <abbr title="Interface utilisateur graphique">IUG</abbr>. _Si vous prévoyez d'éxecuter un serveur sans IUG sous Gentoo, ou que vous compilez sous Ubuntu pour une utilisation sur une autre machine Ubuntu, [voir les notes de bas de page](#que-fait-le-drapeau-de-compilation--headless--)._
1. Compilez les sources en ignorant la bibliothèque audio JACK :

~~~
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
~~~

3. Déplacez le fichier binaire `Jamulus` résultant vers un emplacement permanent, ou utilisez la commande `sudo make install`. Vous pouvez désormais retirer le répertoire des sources si vous le désirez.  
    
**Le reste de ce guide suppose que vous utilisez `/usr/local/bin/Jamulus`**.  

4. Créez un utilisateur système sans privilège pour le fonctionnement du serveur (il s'exécutera en tant qu'utilisateur _jamulus_, groupe _nogroup_.) :

`sudo adduser --system --no-create-home jamulus`

### Création d'un script de démarrage

Après avoir décidé dans quel mode vous souhaitez faire fonctionner votre serveur, utilisez systemd pour le démarrer.

Créez un fichier d'unité systemd qui lancera le serveur au moment du démarrage (merci à [David Harrold](https://sourceforge.net/u/dkxl/profile/) pour cela).

Le fichier d'unité applique une priorité élevée au processeur et à l'ordonnancement des E/S au traitement du serveur. Ceci est optionnel (et peut être ignoré sur certains hôtes).

Notez aussi que les entrées de journalisation du serveur iront dans journalctl (utilisez [journald](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs) pour les consulter).

**Note** : le reste de ce guide suppose que vous êtes en mode "public" en utilisant l'option `-e` (`--centralserver`). Ceci précise dans quelle liste de genres musicaux votre serveur apparaîtra. Voir [la liste des genres disponibles ici](Central-Servers)).

~~~
[Unit]
Description=Jamulus-Server
After=network.target

[Service]
Type=simple
User=jamulus
Group=nogroup
NoNewPrivileges=true
ProtectSystem=true
ProtectHome=true
Nice=-20
IOSchedulingClass=realtime
IOSchedulingPriority=0

#### Change this to set genre, location and other parameters.
#### See [Command-Line-Options](Command-Line-Options) ####
ExecStart=/usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o "yourServerName;yourCity;[country ID]"

Restart=on-failure
RestartSec=30
StandardOutput=journal
StandardError=inherit
SyslogIdentifier=jamulus

[Install]
WantedBy=multi-user.target
~~~

Copier le fichier d'unité dans `/etc/systemd/system` et donnez lui les permissions :

`sudo cp jamulus.service /etc/systemd/system/jamulus.service`

`sudo chmod 644 /etc/systemd/system/jamulus.service`


Testez que ça démarre bien :

`sudo systemctl start jamulus`

`sudo systemctl status jamulus`

Vous devriez voir quelque chose comme ceci :

~~~
● jamulus.service
   Loaded: loaded (/lib/systemd/system/jamulus.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2020-03-26 11:52:34 GMT; 4s ago
 Main PID: 1308 (Jamulus)
    Tasks: 2 (limit: 4915)
   CGroup: /system.slice/jamulus.service
           └─1308 /usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o yourServerName;yourCity;[country ID]

Mar 26 11:52:34 oddjob systemd[1]: Started jamulus.service.
Mar 26 11:52:35 oddjob jamulus[1308]: - server mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - no GUI mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - central server: jamulus.fischvolk.de
Mar 26 11:52:35 oddjob jamulus[1308]: - server info: yourServerName;yourCity;[country ID]
Mar 26 11:52:35 oddjob jamulus[1308]: - welcome message: Thanks for connecting!
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Jamulus, Version [version]
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Internet Jam Session Software
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Under the GNU General Public License (GPL)
~~~

Si tout va bien, activez le service de lancement au démarrage avec :

`sudo systemctl enable jamulus`

Vous pouvez aussi contrôler Jamulus avec la commande `service`. Par exemple :

`sudo service jamulus status`

qui indique si Jamulus fonctionne bien, et affiche les quelques dernières lignes du journal (où vous verrez les connexions actives).
Note : pressez `q` pour quitter le statut de service.

### Mettre à jour votre installation vers une nouvelle version

Téléchargez les nouvelles sources comme indiqué dans les [instructions ci-dessus](#compilation-des-sources--creation-d-un-utilisateur) et répétez la compilation à l'étape 2 comme pour une nouvelle installation. Arrêtez le serveur, copiez le fichier binaire Jamulus en écrasant l'ancien, et redémarrez le serveur.

***

Voir aussi les [options en ligne de commandee](Command-Line-Options) pour les autres paramètres que vous pouvez configurer.

## Notes de bas de page

### Contrôler les enregistrements

Lorsque vous utilisez la [fonction d'enregistrement](Server-Win-Mac#enregistrement) avec [l'option en ligne de commande](Command-Line-Options) `-R`, si le serveur reçoit un signal SIGUSR1 pendant un enregistrement, il commencera un nouvel enregistrement dans un nouveau répertoire. SIGUSR2 activera/désactivera l'enregistrement.

Pour envoyer ces signaux en utilisant systemd, créez les deux fichiers `.service` suivants dans `/etc/systemd/system`, en les appelant par un nom approprié (par exemple `nouvelEnregistrement-Jamulus-server.service`).

Pour activer ou désactiver l'enregistrement (en fonction de l'état courant) :

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

Pour démarrer un nouvel enregistrement :

~~~
[Unit]
Description=Start a new recording on Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note : le nom du service Jamulus dans la ligne `ExecStart` doit être le même que le nom du fichier `.service` que vous avez créé lors de la configuration de systemd pour contrôler votre serveur Jamulus. Ainsi dans cet exemple, ça serait `Jamulus-Server.service`._

Exécutez `sudo systemctl daemon-reload` pour les sauvegarder pour la première utilisation.

Vous pouvez maintenant les exécuter avec la commande `service start`, par exemple :

`sudo service jamulusTogglerec start` (en supposant que vous ayez nommé votre fichier d'unité `jamulusTogglerec.service`)

Vous pouvez voir le résultat de ces commandes di vous lancez `service jamulus status`, ou en consultant les journaux.

### Consulter les journaux

Jamulus journalisera dans le fichier du système si vous avez laissé le paramètre `StandardOutput=journal` dans le fichier d'unité. Il est recommandé de se connecter au journal du système, car le système gère le fichier journal pour vous, sans avoir à revenir pour le purger plus tard ou à vous soucier du remplissement de votre disque.

Pour lire le journal, utilisez `journalctl` (pressez Ctrl-C pour quitter). Par exemple, pour lire le fichier de journalisation du système, filtré sur le service Jamulus :  

`journalctl -u jamulus`

Pour les entrées du jour :

`journalctl -u jamulus`

Pour la dernière heure :  

`journalctl -u jamulus --since "1 hour ago"`

Filtrez le journal pour voir les messages de connexion de votre serveur Jamulus :

`journalctl -u jamulus | grep connected`

Suivre (affichez à l'écran) les messages du journal Jamulus en temps réel :

`journalctl -f -u jamulus`

### Que fait le drapeau de compilation « headless » ?

Bien que cela ne soit pas strictement nécessaire, nous recommandons d'utiliser le drapeau `headless` pour accélérer le processus de construction. Les utilisateurs de Gentoo devraient également éviter d'installer certaines dépendances en conséquence. [Plus d'informations ici](Compiling#le-fanion-de-compilation-headless).
