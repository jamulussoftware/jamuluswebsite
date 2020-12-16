---
layout: wiki
title: "Trucs, astuces et autres"
lang: "fr"
permalink: "/wiki/Tips-Tricks-More"
---

# Trucs et astuces

## S'informer sur les répétitions de groupe à distance

L'utilisateur de Jamulus [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/), a compilé un grand nombre d'informations relatives [aux répétitions de groupe à distance](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/) (Google doc, en anglais) qui couvre des sujets comme la configuration matérielle et logicielle incluant des exemples et conseils pour les nouveaux arrivants sur ce terrain. Il inclut aussi une section comparant de Jamulus à d'autres solutions.

## Utilisation de l'audio de Jamulus dans des applications de visio-conférences Zoom (ou autres)

Plusieurs utilisateurs ont rapporté avoir permis à un « public virtuel » de suivre une session Jamulus en utilisant [JACK audio](https://jackaudio.org) pour router le signal de Jamulus à travers de JackRouter vers l'application cible (dans ce cas, Zoom meetings).

Vous pouvez également utiliser [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) pour Windows ou [BlackHole](https://github.com/ExistentialAudio/BlackHole) pour macOS afin de router la sortie de Jamulus vers de multiples destinations, par exemple vers votre casque et l'application de visio-conférence en même temps.

## Enregistrer Jamulus sous Windows avec Reaper

L'utilisateur de Jamulus [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/), a écrit un [guide pour enregistrer la sortie de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc, en anglais) en utilisant composant additionnel ReaRoute pour [Reaper](https://www.reaper.fm/).  

## Partager les partitions de voix et d'accords

L'utilisateur de Jamulus [BTDT](https://sourceforge.net/u/btdt/profile/), a écrit un système appelé [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), une application web qui permet à un « chef de bœuf » d'envoyer des partitions (au format PDF) aux « bœuffeurs » en temps réel en utilisant des navigateurs web standard.

## Faire une page de statut du serveur

Avec l'argument en ligne de commande `-m`, une information statistique à propos du serveur peut être générée pour être incluse dans une page web.  

Voici un exemple de script php utilisant le fichier de statut du serveur pour afficher le statut actuel du serveur dans une page html (en supposant que l'argument de ligne de commande suivant soit utilisé : `-m /var/www/stat1.dat`)

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

## Sauvegarde et chargement des états du mix client

Vous pouvez sauvegarder et restaurer le mix que vous utilisez pour les répétitions avec votre groupe (chariots, muet, panoramique, solo, etc.) et les recharger à tout moment (même si vous êtes en train de jouer). Faites ça en utilisant « Fichier > Sauvegarder la configuration des canaux du mixeur… » dans votre client et rechargez-les en utilisant « Charger la configuration des canaux du mixeur… » (ou en les glissant/déposant dans la fenêtre de la console de mixage).

## Convertir un serveur public en un serveur privé à la volée

Vous pouver faire fonctionner un serveur public le temps nécessaire pour que votre groupe s'y connecte,puis devenir privé en décochant simplement la case « Rendre mon serveur public » dans l'<abbr title="Interface utilisateur graphique">IUG</abbr> du serveur. Les membres de votre groupe resteront connectés au serveur jusqu'à ce qu'ils se déconnectent. (Merci à [David Savinkoff](https://github.com/DavidSavinkoff) pour le tuyau !) 

## Script de démarrage du client pour Linux

Voici un script de démarrage Linux pour Jamulus utilisant une vieille carte son Audigy4, dont le grand nombre de chariots audio disponibles rend compliqué l'obtention de réglages corrects.

Ce script inclut donc les principaux réglages des chariots audio. La deuxième partie du script traite des connexions JACK. J'utilise Guitarix comme processeur d'effets pour ma guitare que je branche dans le cheminement audio jack.

Finalement, je lance Jamulus en le connectant automatiquement au serveur central.

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


## Utilisation de ctrlmidich pour les contrôleurs MIDI

Les chariots de volume dans la fenêtre de mixage du client peuvent être contrôlés par un contrôleur MIDI en utilisant le paramètre `--ctrlmidich` (note : uniquement disponible pour une utilisation avec macOS et Linux). Pour activer cette fonctionnalité, Jamulus doit être lancé avec `--ctrlmidich`. Il y a deux paramètres que vous pouvez définir : `Canal` et `Décalage`. Réglez le premier paramètre sur le canal que vous voulez que Jamulus écoute (0 pour tous les canaux) et le second paramètre sur le numéro de contrôle auquel vous voulez que le premier chariot réagisse. Par défaut, le décalage est de 70 (pour le Behringer X-Touch), ce qui signifie que le premier chariot réagit au numéro de contrôle 70, le second au 71, et ainsi de suite.

Ainsi, par exemple, si vous utilisez un Behringer X-Touch, que vous envoyez du MIDI sur le canal 1 et que vous laissez le décalage par défaut, la commande ressemblera à ceci : `--ctrlmidich 1`. Si vous avez un contrôleur différent, par exemple envoyant du MIDI sur le canal 2 et commençant par le numéro de contrôle 30, la commande sera la suivante `--ctrlmidich "2;30"`

Assurez-vous de connecter le port de sortie de votre périphérique MIDI au port d'entrée MIDI de Jamulus (Qjackctl (Linux), MIDI Studio (macOS) ou tout autre port que vous utilisez pour gérer les connexions). Sous Linux, vous devrez installer et lancer a2jmidid pour que votre péripérique apparaisse dans l'onglet MIDI de Qjackctl.
