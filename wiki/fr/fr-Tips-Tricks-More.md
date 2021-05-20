---
layout: wiki
title: "Trucs, astuces et plus !"
lang: "fr"
permalink: "/wiki/Tips-Tricks-More"
---

# Trucs et astuces

##  Découvrir les répétitions de groupes à distance

L'utilisateur de Jamulus [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/) a rassemblé une grande quantité d'informations sur les [Répétitions à distance de groupes musicaux](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/). (Google doc), qui couvre des sujets tels que la configuration matérielle et logicielle, y compris des exemples et des conseils pour les nouveaux venus dans le domaine. Il inclut également une section sur Jamulus en comparaison avec d'autres solutions.

##  Utilisation de l'audio Jamulus dans les applications de réunion Zoom (ou autres)

Plusieurs utilisateurs ont rapporté avoir réussi à autoriser une "audience virtuelle" pour une session Jamulus en utilisant [JACK audio](https://jackaudio.org) pour acheminer le signal Jamulus à travers JackRouter vers l'application cible (dans ce cas, les réunions Zoom).

Vous pouvez également utiliser [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) pour Windows ou [BlackHole](https://github.com/ExistentialAudio/BlackHole) pour macOS afin d'acheminer la sortie de Jamulus vers plusieurs destinations, par exemple vers votre casque et l'application de réunion en même temps.

## Enregistrer Jamulus sous Windows avec Reaper

L'utilisateur Jamulus [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) a écrit un [guide pour enregistrer les sorties de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc) en utilisant ReaRoute de [Reaper](https://www.reaper.fm/).  

## Partage de paroles de chansons/accords

L'utilisateur Jamulus [BTDT](https://sourceforge.net/u/btdt/profile/) a écrit un système appelé [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), une application ouèbe qui permet a un "responsable du boeuf" de mettre à disposition les fiches des chansons (au format PDF) aux autres participants en temps réel en utilisant un navigateur ouèbe standard.

## Faire une page de status de serveur

Avec l'argument `-m` de la ligne de commande, des informations statistiques sur le serveur peuvent être générées pour être mises sur une page web.

Voici un exemple de script php utilisant le fichier d'état du serveur pour afficher l'état actuel du serveur sur une page html (en supposant que l'argument de ligne de commande suivant soit utilisé : `-m /var/www/stat1.dat`):

~~~
<?php
function loadserverstat ( $statfilename )
{
   $datei = fopen ( $statfilename, "r" );
   while ( !feof ( $datei ) )
   {
	  $buffer = fgets ( $datei, 4096 );
	  echo $buffer;
   }
   fclose($datei);
}
?>
<?php loadserverstat ( "stat1.dat" ); ?>
~~~

## Sauvegarde et chargement des états de mixage du client

Vous pouvez sauvegarder et restaurer le mixage que vous avez pour les répétitions de votre groupe (fader, mute, pan, solo etc...) et les charger à tout moment (même pendant que vous jouez). Faites-le avec "File > Save Mixer Channels Setup" dans votre client et chargez-les avec "Load Mixer Channels Setup" (ou glissez/déposez-les dans la fenêtre du mixeur).

## Conversion d'un serveur public en serveur privé à la volée

Vous pouvez faire tourner un serveur public suffisamment longtemps pour que votre groupe se connecte, puis le rendre privé en décochant simplement la case "Rendre mon serveur public" dans l'interface graphique du serveur. Les membres de votre groupe seront toujours connectés au serveur jusqu'à ce qu'ils se déconnectent. (Merci à [David Savinkoff](https://github.com/DavidSavinkoff) pour cette astuce !)

## Script de démarrage Linux pour le client Jamulus

Voici un script de démarrage Linux pour Jamulus utilisant une vieille carte son Audigy4, dont le grand nombre de faders audio disponibles rend difficile l'obtention des réglages corrects.

Ce script inclut donc les réglages les plus importants des faders audio. La deuxième partie du script concerne les connexions JACK. J'utilise Guitarix comme processeur d'effets pour guitare que je branche dans le chemin audio de JACK.

Enfin, je lance Jamulus en le connectant automatiquement au serveur de répertoire.

Voici le script :

~~~
amixer sset 'Mic' capture 30% cap
amixer sset 'Mic' playback 0%
amixer sset 'Line' playback 60% unmute
amixer sset 'Audigy Analog/Digital Output Jack' unmute
amixer sset 'Analog Mix' capture 100%
amixer sset 'Analog Mix' playback 0%
amixer sset 'Wave' 100%
amixer sset 'Master' capture 100% cap
amixer sset 'Master' playback 100%
amixer sset 'Master' playback 100%
amixer sset 'PCM' playback 100%
amixer sset 'PCM' capture 0%
guitarix &
/home/corrados/llcon/Jamulus -c myJamulusServer.domain.com &
sleep 3
jack_disconnect system:capture_1 Jamulus:'input left'
jack_disconnect system:capture_2 Jamulus:'input right'
jack_connect system:capture_1 gx_head_amp:in_0
jack_connect gx_head_amp:out_0 gx_head_fx:in_0
jack_connect gx_head_fx:out_0 Jamulus:'input left'
jack_connect gx_head_fx:out_1 Jamulus:'input right'
jack_connect Jamulus:'output left' system:playback_1
jack_connect Jamulus:'output right' system:playback_2
~~~

## Utilisation de ctrlmidich pour les contrôleurs MIDI

Le fader de volume, la commande de panoramique et les boutons de sourdine et de solo dans les bandes de fenêtre de mixage du client peuvent être contrôlés à l'aide d'un contrôleur MIDI en utilisant le paramètre `--ctrlmidich` (note : uniquement disponible pour une utilisation avec macOS et Linux utilisant Jamulus version 3.7.0 ou supérieure). Pour activer cette fonctionnalité, Jamulus doit être lancé avec `--ctrlmidich`. Il y a un paramètre global de canal MIDI (1-16) et deux paramètres que vous pouvez régler pour chaque élément contrôlé : `offset` et `consecutive CC numbers`. Réglez le premier paramètre sur le canal que vous voulez que Jamulus écoute (0 pour tous les canaux) et ensuite spécifiez les éléments que vous voulez contrôler (f = fader de volume ; p = pan ; m = mute ; s = solo) avec l'offset (numéro de CC pour commencer) et le nombre de numéros de CC consécutifs. Prenons l'exemple suivant :

`--ctrlmidich '1;f0*8;p16*8;s32*8;m48*8'`

Ici, Jamulus écoute sur le canal MIDI 1. Les numéros de CC des faders de volume commencent à 0 et sont au nombre de 8 (ils se terminent donc au numéro 7). Les contrôles de panoramique commencent au CC numéro 16 et se terminent au 23 ; Solo 32 à 39 et Mute 48 à 55.

Les bandes de faders dans la fenêtre de mixage sont contrôlées dans l'ordre croissant de gauche à droite. En continuant avec l'exemple ci-dessus, dans la bande numéro 1 (la plus à gauche), le fader de volume serait contrôlé par le CC numéro 0 ; le pan par 16 ; le solo par 32 et le mute par 48. Comme nous avons spécifié 8 contrôleurs consécutifs pour chaque paramètre, cela nous donnerait un contrôle MIDI sur 8 bandes (volume, panoramique, solo et mute dans chacune d'elles) dans la fenêtre du mixeur. La bande suivante serait contrôlée par 1, 17, 33 et 49, et ainsi de suite.

*Note*: Jamulus ne fournit pas de retour sur l'état des boutons Solo et Mute, ce qui signifie que votre contrôleur doit garder la trace et basculer les LED (le cas échéant) sur "on" ou "off" lui-même.

Assurez-vous de connecter le port de sortie de votre appareil MIDI au port d'entrée MIDI de Jamulus (QjackCtl (Linux), MIDI Studio (macOS) ou tout autre outil que vous utilisez pour gérer les connexions). Sous Linux, vous devrez installer et lancer a2jmidid pour que votre périphérique apparaisse dans l'onglet MIDI de Qjackctl.

## Contrôle des enregistrements sur les serveurs headless Linux

Lorsque vous utilisez la [fonction d'enregistrement](Server-Win-Mac#recording) avec l'[option de ligne de commande] `-R`(Command-Line-Options), si le serveur reçoit un signal SIGUSR1 pendant un enregistrement, il démarre un nouvel enregistrement dans un nouveau répertoire. SIGUSR2 permet d'activer ou de désactiver l'enregistrement.

Pour envoyer ces signaux en utilisant systemd, créez les deux fichiers `.service` suivants dans `/etc/systemd/system`, en les appelant de manière appropriée (par exemple `newRecording-Jamulus-server.service`).

**Note:** Vous devrez sauvegarder les enregistrements dans un chemin _extérieur_ au répertoire personnel de jamulus, ou enlever `ProtectHome=true` de votre fichier d'unité systemd (soyez conscient que faire cela est cependant un risque potentiel de sécurité).

Pour activer ou désactiver l'enregistrement (selon l'état actuel) :

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

Pour demarrer un nouvel enregistrement :

~~~
[Unit]
Description=Start a new recording on Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note : Le nom du service Jamulus dans la ligne `ExecStart` doit être le même que le nom du fichier `.service` que vous avez créé lors de la configuration de systemd pour contrôler votre serveur Jamulus. Donc dans cet exemple, ce serait `Jamulus-Server.service`_.

Lancez `sudo systemctl daemon-reload` pour les enregistrer pour la première utilisation.

Maintenant vous pouvez les lancer avec la commande `service start`, par exemple :

`sudo service jamulusTogglerec start` (en supposant que vous avez nommé votre fichier unité `jamulusTogglerec.service`)

Vous pouvez voir le résultat de ces commandes si vous exécutez `service jamulus status`, ou en consultant les logs.

## Qualité de service

Jamulus utilise DSCP/CS4 de manière opportuniste pour gérer le gonflement de la mémoire tampon, et utilise une valeur DSCP/CS4 par défaut de 128 (ou 0x80). Cette valeur est compatible avec IPv4 et IPv6. D'autres valeurs peuvent être définies en utilisant l'option `-Q`, par exemple `-Q [0..255]` (où 0 désactive la QoS). Si vous souhaitez explorer l'effet des paramètres par défaut, consultez [RFC4594](https://tools.ietf.org/html/rfc4594). Cependant, la plupart des gens n'auront pas besoin de le faire.

### Utilisation de la qualité de service sous Windows

Les paramètres de qualité de service de Jamulus (y compris la valeur par défaut) n'ont aucun effet sur Windows car le système d'exploitation les ignore. Pour activer la qualité de service pour Jamulus, vous devez suivre ces instructions. Notez également que vous devrez peut-être répéter cette procédure à chaque mise à jour de Jamulus.

Dans la boîte de recherche à côté du menu Démarrer, tapez : Local Group Policy Editor (entrer)<br>
Dans la nouvelle fenêtre, (cliquer) sur l'icône du menu pour afficher le troisième panneau Actions.<br>
Regardez le premier panneau de l'éditeur de stratégie du groupe local.<br>
&nbsp;Stratégie de l'ordinateur local<br>
&nbsp;&nbsp;Configuration<br>
&nbsp;&nbsp;&nbsp;fenêtres paramètres<br>
&nbsp;&nbsp;&nbsp;&nbsp;QoS basée sur la stratégie (cliquer)<br>
Regarder le troisieme panneau (Actions) de l'éditeur de stratégie de groupe local<br>
&nbsp;QoS basée sur la stratégie<br>
&nbsp;&nbsp;Plus d'actions<br>
&nbsp;&nbsp;&nbsp;créer une nouvelle stratégie (cliquer)<br>
&nbsp;&nbsp;&nbsp;&nbsp;nom : Jamulus<br>
&nbsp;&nbsp;&nbsp;&nbsp;Specifier la valeur DSCP : 32<br>
&nbsp;&nbsp;&nbsp;&nbsp;suivant<br>
&nbsp;&nbsp;&nbsp;&nbsp;Cette stratégie QoS s'applique seulement au programme Jamulus.exe<br>
&nbsp;&nbsp;&nbsp;&nbsp;Suivant<br>
&nbsp;&nbsp;&nbsp;&nbsp;Suivant<br>
&nbsp;&nbsp;&nbsp;&nbsp;UDP<br>
&nbsp;&nbsp;&nbsp;&nbsp;Fin<br>
(Avis : La stratégie de Jamulus dans le panneau central peut être modifiée)
