---
lang: fr
layout: wiki
permalink: /wiki/Server-Linux
title: "Installation d'un serveur - Linux"
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Installation d'un serveur - Linux

**_Veuillez vous assurer que vous avez lu la page [Exécuter un serveur](Running-a-Server)_**


## Exécution d'un serveur avec une interface graphique sur une machine de bureau

Si vous avez installé le client Jamulus, vous pouvez l'exécuter dans le [mode serveur](Choosing-a-Server-Type) de votre choix en exécutant Jamulus avec l'option `-s` comme suit :

1. Ouvrez une fenêtre de terminal (`CTRL+ALT+t` sur Ubuntu et les distros apparentées).
1. En supposant que Jamulus se trouve dans `/usr/local/bin`, tapez `Jamulus -s`.

Appuyez sur return et vous devriez voir la fenêtre de contrôle du serveur. Vous pouvez arrêter le serveur en fermant la fenêtre du serveur, ou en utilisant `CTRL+C` dans le terminal.

**Pour configurer le serveur**, veuillez vous référer aux [instructions pour Windows et macOS] (Server-Win-Mac), et aux [options de la ligne de commande] (Command-Line-Options) pour les autres paramètres que vous pouvez définir.

## Exécution d'un serveur "headless"

Ce qui suit concerne l'exécution de Jamulus en tant que serveur "pur" sur du **matériel sans audio** (par exemple, sur un hôte tiers/cloud) et suppose des distributions Ubuntu/Debian utilisant systemd. Nous avons également des instructions pour [Raspberry Pi] (Server-Rpi).

1. Téléchargez le [dernier fichier .deb sans tête]({{ site.download_root_link }}{ site.download_file_names.deb-headless }})
1. Mettez à jour apt pour vous assurer que vous avez une liste actuelle de paquets standard : `sudo apt update`
1. Installez le paquet Jamulus : `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Activez le processus de serveur sans tête via systemd : `sudo systemctl enable jamulus-headless`.
1. Ajoutez vos [options de ligne de commande] (Command-Line-Options) à la ligne `ExecStart` dans le fichier de service systemd dans `/lib/systemd/system/jamulus-headless.service` (Par défaut, vous allez exécuter un serveur privé).
1. Rechargez les fichiers systemd `sudo systemctl daemon-reload` et redémarrez le serveur headless : `sudo systemctl restart jamulus-headless`
1. Vérifiez que tout va bien avec `service jamulus-headless status` (tapez `q` pour revenir à l'invite de commande).

## Notes

Vous pouvez contrôler Jamulus avec la commande `service`. Par exemple, pour arrêter le serveur proprement :

`sudo service jamulus-headless stop`

### Visualisation des journaux

Jamulus se connectera au fichier système si vous avez laissé le paramètre `StandardOutput=journal` dans le fichier d'unité. Il est recommandé de se connecter au journal système, car le système gérera le fichier journal pour vous - pas besoin de revenir et de le purger plus tard ou de s'inquiéter de remplir votre espace disque.

Pour visualiser le journal, utilisez `journalctl` (pour quitter, appuyez sur Ctrl-C). Par exemple, pour lire le fichier journal du système, filtré pour le service Jamulus :

`journalctl -u jamulus`

Pour les entrées d'aujourd'hui :

`journalctl -u jamulus --since today`

Pour la dernière heure :

`journalctl -u jamulus --since "1 hour ago"`

Filtrez le journal pour voir les messages de connexion de votre serveur Jamulus :

`journalctl -u jamulus | grep connected`

Suivez (affichez à l'écran) les messages du journal de Jamulus au fur et à mesure qu'ils se produisent :

`journalctl -f -u jamulus`

### Mise à niveau

Pour mettre à niveau votre serveur vers une version plus récente, téléchargez simplement un nouveau fichier .deb et réinstallez comme à l'étape 3.

### Enregistrement

Voir [cette information](/wiki/Tips-Tricks-More#contrôle-des-enregistrements-sur-les-serveurs-headless-linux) sur le contrôle des enregistrements sur les serveurs headless.
