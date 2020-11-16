---
layout: wiki
title: "Installation du serveur sous Linux"
lang: "fr"
permalink: "/wiki/Server-Linux"
---

# Installation du serveur sous Linux


**_Veuillez vous assurer que vous avez bien lu&nbsp;: [Gestion d'un serveur](Running-a-Server)_**


## Executer le serveur avec l'interface graphique (_GUI_)

Si vous prévoyez d'exécuter le serveur sur votre machine de bureau (et que vous avez déjà [installé le client Jamulus](Installation-for-Linux)), vous pouvez l'exécuter dans le [mode serveur de votre choix](Choosing-a-Server-Type) en exécutant Jamulus avec l'option `-s` comme suit&nbsp;:

1. Ouvrez un terminal de commande (`CTRL+ALT+t` sur Ubuntu et distributions dérivées).
1. Partons du principe que Jamulus est dans `/usr/local/bin`, et tapons `Jamulus -s`

Validez avec `[Entrée]` et vous devriez voir la fenêtre de contrôle du serveur. Vous pouvez arrêter le serveur en fermant la fenêtre, ou en tapant `CTRL+C` dans le terminal.

**Pour configurer le serveur**, référez vous aux [instructions pour les utilisateurs de Windows ou Macintosh](Server-Win-Mac).

Voir aussi les [options de la ligne de commande](Command-Line-Options) pour les paramètres que vous pouvez passer.

<a id="running-a-headless-server"></a>
## Serveur sans interface graphique (_"headless" server_)

Le guide suivant permet de faire fonctionner Jamulus comme un "pur" serveur sur du matériel dédié sans audio ni interface graphique (par exemple un serveur dédié en datacenter ou dans le _cloud_ ou encore une machine dédiée) et suppose des distributions Ubuntu/Debian utilisant systemd. Nous avons également des instructions pour les [Raspberry Pi](Server-Rpi) qui sont bien faites.

* _Un utilisateur de Jamulus, [Grigory](https://sourceforge.net/u/cidnurg/profile/), maintient une **[image Docker pour Jamulus](https://hub.docker.com/r/grundic/jamulus)** que vous pouvez utiliser._

* _Un autre utilisateur de Jamulus, [skrul](https://sourceforge.net/u/skrulx/profile/), à égualement déployé un certain nombre de **public Amazon EC2 AMIs** sous Ubuntu 18.04 pour faire fonctionner Jamulus. [Voir cette page](Jamulus-Cloud) (en anglais) pour plus de détails._

<a id="compiling-source"></a>
### Compiler le code source, création de l'utilisateur `jamulus`


1. [Téléchargez le code source](Installation-for-Linux#obtenir-les-sources-de-jamulus), installez les [dépendances](Installation-for-Linux#installation-des-dependances) comme indiqué dans le guide d'installation sous Linux. À noter, **il n'y a pas besoin d'installer le(s) package(s) Jack** pour un serveur dédié sans interface graphique. _Si vous prévoyez de compilier le serveur sous Gentoo, ou prévoyez de compiler sous Ubuntu pour l'utiliser sur une autre machine sous Ubuntu, [voir les notes de bas de page](#headless-flag)._
2. Compilez les sources en ignorant la librairie audio Jack&nbsp;:
~~~
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
~~~
3. Déplacez le fichier binaire `Jamulus` dans un répertoire permanent, ou utilisez la commande `sudo make install` qui installe le binaire dans `/usr/local/bin`.  
Vous pouvez supprimer le répertoire contenant les sources si vous le désirez.  
**Le reste de ce guide part du principe que vous avez installé le binaire à l'emplacement par défaut&nbsp;: `/usr/local/bin/Jamulus`**.
4. Créez un utilisateur système sans privilèges pour le serveur (il s'exécutera en tant qu'utilisateur _jamulus_, groupe _nogroup_.)&nbsp;:  
`sudo adduser --system --no-create-home jamulus`

### Création du script de démarrage

Une fois que vous avez décidé [dans quel mode](Choosing-a-Server-Type) vous voudrez certainement que le serveur se lance au démarrage. Utilisez systemd pour le démarrer. Le reste de ce guide suppose que le serveur sera en mode _[public](Choosing-a-Server-Type#1-serveur-public)_.  
_Veuillez également consulter cette **[note importante sur les serveurs centraux](Central-Servers)**._

Créez un fichier systemd qui lancera le serveur au démarrage (merci à [David Harrold](https://sourceforge.net/u/dkxl/profile/)).

Le fichier systemd applique une planification CPU et E/S de haute priorité au processus du serveur. Ceci est facultatif (et peut être ignoré sur certains hôtes).

Notez aussi que la journalisation du seveur se trouvera dans `journalctl` (utilisez [journald](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs) pour les lire).

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

Copier ce fichier dans `/etc/systemd/system` et donnez lui les permissions&nbsp;:

`sudo cp jamulus.service /etc/systemd/system/jamulus.service`  
`sudo chmod 644 /etc/systemd/system/jamulus.service`

Testez que le lancement se passe bien et que tout est OK&nbsp;:

`sudo systemctl start jamulus`  
`sudo systemctl status jamulus`

Vous devriez voir quelque chose comme ça&nbsp;:

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

Si tout s'est bien passé, activez le lancement au démarrage avec&nbsp;:

`sudo systemctl enable jamulus`

Vous pouvez aussi utiliser la commande `service`, par exemple&nbsp;:

`sudo service jamulus status`

qui indique si Jamulus fonctionne bien, et affiche les dernières lignes du journal (où vous verrez les connexions enregistrées).
Note : Appuyez sur `q` pour quitter.

Si vous modifiez ce fichier pour modifier les options passées au démarrage, vous devrez recharger ce fichier avec la commande :

`sudo systemctl daemon-reload`

Puis, redémarrez le service :

`sudo service jamulus restart`

### Mise à jour vers une nouvelle version

Téléchargez le code source de la nouvelle version comme indiqué dans les [instructions ci-dessus](Server-Linux#compiling-source) et suivez l'étape 2 pour compiler les sources comme pour une nouvelle installation.  
Puis,
1. arrêtez le serveur :  
`sudo service jamulus stop`
2. copiez le fichier binaire 'Jamulus' à l'endroit où vous l'avez initiallement installé en écrasant l'ancien fichier, utilisez `sudo make install`si c'est ce que vous aviez fait.
3. redémarrez le service :  
`sudo service jamulus start`

Voilà, c'est à jour&nbsp;!

***

Voir [les options de ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être configuré.

## Notes de bas de page

### Contrôler l'enregistrement

When using the [recording function](Server-Win-Mac#recording) with the `-R` [command line option](Command-Line-Options), if the server receives a SIGUSR1 signal during a recording, it will start a new recording in a new directory. SIGUSR2 will toggle recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (eg `newRecording-Jamulus-server.service`).

For turning recording on or off (depending on the current state):

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

For starting a new recording:

~~~
[Unit]
Description=Start a new recording on Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note: The Jamulus service name in the `ExecStart` line needs to be the same as the `.service` file name you created when setting systemd to control your Jamulus server. So in this example it would be `Jamulus-Server.service`_

Run `sudo systemctl daemon-reload` to register them for first use.

Now you can run these with the `service start` command, for example:

`sudo service jamulusTogglerec start` (assuming you named your unit file `jamulusTogglerec.service`)

You can see the result of these commands if you run `service jamulus status`, or by viewing the logs.

### Lire les journaux

Jamulus journalisera dans le journal système si vous avez laissé le paramètre `StandardOutput=journal` dans le fichier `systemd`. Il est recommandé d'utiliser le journal du système, car le système gère le fichier journal pour vous, sans avoir à revenir le purger plus tard ou à vous soucier de l'espace disque.

Pour lire les journaux, utilisez `journalctl` (pressez `Ctrl-C`pour quitter). Par exemple, pour lire le journal système filtré pour le service Jamulus :  
`journalctl -u jamulus`

Pour les entrées du jour :  
`journalctl -u jamulus --since today`

Pour la dernière heure :  
`journalctl -u jamulus --since "1 hour ago"`

Pour n'afficher que les journaux de connexion :  
`journalctl -u jamulus | grep connected`

Suivre à l'écran les journaux Jamulus à mesure qu'ils apparaissent :  
`journalctl -f -u jamulus`

Pour plus d'information sur l'utilisation de `journalctl`, consultez la page de manuel&nbsp;:  
`man journalctl`

<a id="headless-flag"></a>
### Que signifie l'option de compilation "_headless_" ?

Bien que cela ne soit pas strictement nécessaire, nous recommandons d'utiliser l'option `headless` pour accélérer la compilation. Les utilisateurs de Gentoo peuvent également éviter d'installer certaines dépendances en conséquence. [Plus d'informations ici](Compiling#the-headless-build-flag).
