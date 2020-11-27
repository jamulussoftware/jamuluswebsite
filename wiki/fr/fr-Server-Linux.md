---
layout: wiki
title: "Installation d'un serveur sous Linux"
lang: "fr"
permalink: "/wiki/Server-Linux"
---

# Installation d'un serveur sous Linux

**_Assurez-vous d'abord de lire : [Gestion d'un serveur](Running-a-Server)_**

## Serveur avec IUG

Si vous prévoyez d'exécuter le serveur sur votre poste de travail (et que vous avez déjà [installé le client Jamulus](Installation-for-Linux)), vous pouvez exécuter le serveur dans le [mode de votre choix](Choosing-a-Server-Type) en exécutant Jamulus avec l'option `-s` comme suit :

1. Ouvrez un terminal de commande (`CTRL+ALT+t` sur Ubuntu et distributions dérivées).
1. Partons du principe que Jamulus est dans `/usr/local/bin`, et tapons `Jamulus -s`

Validez avec `[Entrée]` et vous devriez voir la fenêtre de contrôle du serveur. Vous pouvez arrêter le serveur en fermant la fenêtre, ou en tapant `CTRL+C` dans le terminal.

**Pour configurer le serveur**, référez vous aux [instructions pour les utilisateurs de Windows et Mac OS X ou macOS](Server-Win-Mac).

Voir aussi les [options de la ligne de commande](Command-Line-Options) pour les paramètres que vous pouvez passer.

## Serveur sans IUG
<!-- note for reviewers: not sure how-to translate "which rock too"-->
Le guide suivant est destiné à l'administration d'un « pur » serveur Jamulus sur du matériel dédié sans audio ni <abbr title="Interface graphique utilisateur">IUG</abbr> (par exemple un serveur distant ou dans le « cloud ») et suppose des distributions Ubuntu/Debian utilisant systemd. Nous avons également des instructions utiles pour les [Raspberry Pi](Server-Rpi).

* _Un utilisateur de Jamulus, [Grigory](https://sourceforge.net/u/cidnurg/profile/), maintient une **[image Docker pour Jamulus](https://hub.docker.com/r/grundic/jamulus)** que vous pouvez utiliser._

### Compilation des sources, création d'un utilisateur

1. [Téléchargez le code source](Installation-for-Linux#obtenir-les-sources-de-jamulus), installez les [dépendances](Installation-for-Linux#installation-des-dependances) comme indiqué dans le guide d'installation sous Linux. À noter, **il n'y a pas besoin d'installer le(s) package(s) Jack** pour un serveur sans <abbr title="Interface utilisateur graphique">IUG</abbr>. _Si vous prévoyez d'éxecuter un serveur sans <abbr title="Interface utilisateur graphique">IUG</abbr> sous Gentoo, ou compilez sous Ubuntu pour une utilisation sur une autre machine Ubuntu, [voir les notes de bas de page](#que-fait-le-drapeau-de-compilation--headless--)._
2. Compilez les sources en ignorant la librairie audio Jack :
~~~
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
~~~
3. Déplacez le fichier binaire `Jamulus` dans un emplacement permanent, ou utilisez la commande `sudo make install`.  
Vous pouvez désormais supprimer le répertoire contenant les sources si vous le désirez.  
    
**Le reste de ce guide part du principe que vous avez installé le binaire à l'emplacement par défaut : `/usr/local/bin/Jamulus`**.  
4. Créez un utilisateur système sans privilèges pour le serveur (il s'exécutera en tant qu'utilisateur _jamulus_, groupe _nogroup_.) :  
`sudo adduser --system --no-create-home jamulus`

### Création d'un script de démarrage

Après avoir décidé dans quel mode faire fonctionner le serveur, utilisez systemd pour le démarrer.

Créez un fichier d'unité systemd qui lancera le serveur au démarrage (merci à [David Harrold](https://sourceforge.net/u/dkxl/profile/)).
<!-- note for reviewers: not sure about wording below -->
Le fichier d'unité applique une priorité élevée à la programmation du processeur et aux E/S pour les processus du serveur (et peut être ignoré sur certains hôtes).

Notez aussi que la journalisation du seveur sera redirigé vers `journalctl` (utilisez [journald](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs) pour la consulter).

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

Copier ce fichier dans `/etc/systemd/system` et donnez lui les bonnes permissions :

`sudo cp jamulus.service /etc/systemd/system/jamulus.service`  
`sudo chmod 644 /etc/systemd/system/jamulus.service`

Testez si le démarrage se passe bien :

`sudo systemctl start jamulus`  
`sudo systemctl status jamulus`

Vous devriez voir quelque chose comme ça :

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

Si tout s'est bien passé, activez le lancement au démarrage avec :

`sudo systemctl enable jamulus`

Vous pouvez aussi utiliser la commande `service`, par exemple :

`sudo service jamulus status`

qui indique si Jamulus fonctionne bien, et affiche les dernières lignes du journal (où vous verrez les connexions actives).
Note : Appuyez sur `q` pour quitter.

### Mise à jour vers une nouvelle version

Téléchargez le code source de la nouvelle version comme indiqué dans les [instructions ci-dessus](#compiler-le-code-source) et suivez l'étape 2 pour compiler les sources comme pour une nouvelle installation.  
Arrêtez le serveur, copiez le fichier binaire Jamulus en écrasant le précédent, redémarrez le serveur.

***

Voir aussi [les options de ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être configurés.

## Notes de bas de page

### Gestion des enregistrements
Lorsque vous utilisez la [fonction d'enregistrement](Server-Win-Mac#recording) avec [l'option de ligne de commande](Command-Line-Options) `-R`, si le serveur reçoit un signal `SIGUSR1` pendant un enregistrement, il commencera un nouvel enregistrement dans un nouveau répertoire. `SIGUSR2` activera ou désactivera l'enregistrement actif.

Pour envoyer ces signaux en utilisant `systemd`, créez les deux fichiers `.service` suivants dans `/etc/systemd/system`, en les appelant par un nom approprié (par exemple `newRecording-Jamulus-server.service`).

Pour activer ou désactiver l'enregistrement (en fonction de l'état actif) :

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

_Note importante : Le nom du service Jamulus dans la ligne `ExecStart` doit être le même que le nom du fichier `.service` que vous avez créé lors de la configuration de `systemd` pour contrôler votre serveur Jamulus. Dans cet exemple, il s'agirait donc de `Jamulus-Server.service`._

Exécutez `sudo systemctl daemon-reload` pour les enregistrer avant la première utilisation.

Vous pouvez maintenant les exécuter avec la commande `service start`, par exemple :

`sudo service jamulusTogglerec start` (en supposant que vous avez nommé le fichier `jamulusTogglerec.service`)

Vous pouvez voir le résultat de ces commandes en éxécutant `service jamulus status`, ou en consultant les journaux.

### Lire les journaux

Jamulus journalisera dans le journal système si vous avez laissé le paramètre `StandardOutput=journal` dans le fichier d'unité. Il est recommandé d'utiliser le journal du système, car le système gère le fichier journal pour vous, sans avoir à revenir dessus pour le purger plus tard ou à vous soucier de l'espace disque.

Pour lire les journaux, utilisez `journalctl` (pressez Ctrl-C pour quitter). Par exemple, pour lire le journal système filtré sur le service Jamulus :  
`journalctl -u jamulus`

Pour les entrées du jour :  
`journalctl -u jamulus --since today`

Pour la dernière heure :  
`journalctl -u jamulus --since "1 hour ago"`

Pour n'afficher que les messages de connexion à votre serveur Jamulus :  
`journalctl -u jamulus | grep connected`

Suivre les journaux Jamulus (à l'écran) en temps réel :  
`journalctl -f -u jamulus`

Pour plus d'information sur l'utilisation de `journalctl`, consultez la page de manuel :  
`man journalctl`

### Que fait le drapeau de compilation « headless » ?
Bien que ça ne soit pas strictement nécessaire, nous recommandons d'utiliser l'option `headless` pour accélérer la compilation. Les utilisateurs de Gentoo peuvent également éviter d'installer certaines dépendances en conséquence. [Plus d'informations ici](Compiling#option-de-compilation-headless).
