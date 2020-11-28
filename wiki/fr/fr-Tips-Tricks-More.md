---
layout: wiki
title: "Trucs, Astuces et Infos"
lang: "fr"
permalink: "/wiki/Tips-Tricks-More"
---

# Trucs et Astuces

## En apprendre plus sur les séances de répétitions d'un groupe à distance

Un utilisateur de Jamulus, [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/), a compilé un grand nombre d'information en rapport avec [les répétions d'un groupe](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/) (Google doc, en anglais) qui couvre plusieurs sujets comme la configuration matérielle et logicielle incluant des exemples et conseils destinés aux nouveaux arrivant sur ce terrain. Il inclut aussi une section avec la comparaison de Jamulus par rapport à d'autres solutions.

## Utiliser l'audio de Jamulus dans Zoom (ou une autre) application de visio-conférences

Plusieurs utilisateurs ont signalé avoir permit à un « public virtuel » de suivre une session Jamulus en utilisant [Jack audio](https://jackaudio.org) pour router le signal de Jamulus à travers de JackRouter vers l'application cible (dans ce cas, Zoom meetings) 

Vous pouvez également utiliser [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) pour Windows ou [BlackHole](https://github.com/ExistentialAudio/BlackHole) pour Mac afin de router la sortie de Jamulus vers de multiples destinations, par exemle vers votre casque et l'application de visio-conférences en même temps.

## Enregistrer Jamulus sous Windows avec Reaper

Un utilisateur de Jamulus, [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/), a écrit un [guide pour enregistrer la sortie de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc, en anglais) en utilisant ReaRoute, un composant additionnel pour [Reaper](https://www.reaper.fm/).  

## Partager les partitions de voix et instruments

Un utilisateur de Jamulus, [BTDT](https://sourceforge.net/u/btdt/profile/), a écrit un système appelé [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), c'est une application « web » qui permet au « patron de la Jam » d'envoyer les partitions (au format PDF) aux « Jammers » en temps réel, en utilisant un navigateur standard.

## Faire une page de status pour le serveur

Avec l'option `-m` de la ligne de commande une information statistique à propos du serveur peut être générée pour être incluse dans une page « web ».  

Voici un exemple de script php qui utilise le fichier de statut du serveur pour afficher le statut actuel du serveur dans une page html (en partant du principe que l'option suivante est passée en argument de la commande : `-m /var/www/stat1.dat`)

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

## Sauvegarde et chargement des mixages du client

Vous pouvez sauvegarder et restaurer le mixage que vous utilisez pour les répétitions avec votre groupe (niveau des potentiomètres, muet, panoramiques, solo, etc.) et le recharger n'importe quand (même si vous êtes en train de jouer). Faites ça en utilisant « Fichier > Sauvegarder la configuration des canaux du mixeur… » dans votre client et rechargez les en utilisant « Charger la configuration des canaux du mixeur… » (ou en les glissant/déposant dans la fenêtre de la console de mixage).

## Convertir un serveur public en serveur privé à la volée

Vous pouver faire tourner le serveur en mode public le temps nécéssaire à la connexion de votre groupe, ensuite passez tout simplement en mode privé en décochant la case « Rendre mon serveur public » dans l'<abbr title="Interface utilisateur graphique">IUG</abbr> du serveur.  
(Merci à [https://github.com/DavidSavinkoff](David Savinkoff) pour le tuyau !) 

## Scrit de démarrage du client pour Linux

Voici un script de démarrage Linux pour Jamulus utilisant une vieille carte son Audigy4, dont le grand nombre de canaux audio disponible rend compliqué l'obtention d'une cofiguration correcte.

Ce script inclut donc les principaux réglages pour les canaux audio. La seconde partie du script utilise JACK pour les connexions. J'utilise Guitarix comme processeur d'effets pour ma guitare que je branche dans le patch audio de JACK. 

Pour terminer je démarre Jamulus automatiquement en le connectant au serveur central.

Voici le script :

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


## Utilisation de l'option  --ctrlmidich, Canal de contrôle MIDI à écouter

Un utilisateur de Jamulus, [Ignotus](https://sourceforge.net/u/jammerman/profile/), à écrit : si vous voulez utiliser un contrôleur MIDI générique vous allez devoir faire quelques ajustements et re-compiler les sources :

Note: disponible uniquement pour une utilisation sous macOS ou Linux

Les messages CC MIDI se composent d'un numéro de contrôle, d'une valeur de contrôleur et d'un canal. Jamulus écoute le numéro de contrôle du canal que vous spécifiez en le lançant avec `--ctrlmidich` pour connaitre quel potentiomètre déplacer.

Le client Jamulus est configuré par défaut pour être utilisé avec le Behringer X-Touch, qui apparemment envoie des numéros de contrôle commençant à partir de 70 alors que les canaux de Jamulus sont indexés en commençant à zéro, ce qui signifie qu'il y a un décalage de -70 codé en dur dans le code source qui transforme ce numéro de contrôle 70 en un 0 pour le premier canal, 71 en 1 pour le second, et ainsi de suite.

Si vous pouvez modifier le numéro de contrôle de votre contrôleur MIDI, il suffit de le configurer sur 70 (71, 72, etc. pour les canaux suivants). Lancez Jamulus avec `--ctrlmidich x` où 'x' est le canal MIDI que vous utilisez, ou lancez-le avec `--ctrlmidich 0` pour écouter tous les canaux, et vous avez terminé. Assurez-vous de connecter le port de sortie de votre appareil MIDI au port d'entrée MIDI de Jamulus (Qjackctl (Linux), MIDI Studio (MacOS) ou tout autre logiciel que vous utilisez pour gérer les connexions). Sous Linux, vous devrez installer et lancer a2jmidid pour que votre périphérique apparaisse dans l'onglet MIDI de Qjackctl.

Si vous ne pouvez pas modifier le numéro de contrôle dans votre contrôleur, vous allez devoir modifier et re-compiler les soureces :  
dans le fichier `src/soundbase.cpp`, placez vous à la ligne 209, supprimez le `-70`à la fin (pas le point-virgule) pour utiliser le numéro de contrôle 0 pour le premier canal, ou remplacez ce numéro par le numéro de contrôle initial que votre périphérique MIDI envoit. Sauvegardez, [compilez](Compiling) et installez.

