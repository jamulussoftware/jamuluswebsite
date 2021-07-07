---
lang: fr
layout: wiki
permalink: /wiki/Tips-Tricks-More
title: 'Trucs et astuces'
---

# Tips & Tricks
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

## Découvrir les répétitions de groupes à distance

L'utilisateur de Jamulus [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/) a rassemblé une grande quantité d'informations sur les [Répétitions à distance de groupes musicaux](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/). (Google doc), qui couvre des sujets tels que la configuration matérielle et logicielle, y compris des exemples et des conseils pour les nouveaux venus dans le domaine. Il inclut également une section sur Jamulus en comparaison avec d'autres solutions.

## Utilisation de l'audio Jamulus dans les applications de réunion Zoom (ou autres)

Plusieurs utilisateurs ont rapporté avoir réussi à autoriser une "audience virtuelle" pour une session Jamulus en utilisant [JACK audio](https://jackaudio.org) pour acheminer le signal Jamulus à travers JackRouter vers l'application cible (dans ce cas, les réunions Zoom).

Vous pouvez également utiliser [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) pour Windows ou [BlackHole](https://github.com/ExistentialAudio/BlackHole) pour macOS afin d'acheminer la sortie de Jamulus vers plusieurs destinations, par exemple vers votre casque et l'application de réunion en même temps.


## Enregistrer Jamulus sous Windows avec Reaper

L'utilisateur Jamulus [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) a écrit un [guide pour enregistrer les sorties de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc) en utilisant ReaRoute de [Reaper](https://www.reaper.fm/).


## Partage de paroles de chansons/accords

L'utilisateur Jamulus [BTDT](https://sourceforge.net/u/btdt/profile/) a écrit un système appelé [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), une application ouèbe qui permet a un "responsable du boeuf" de mettre à disposition les fiches des chansons (au format PDF) aux autres participants en temps réel en utilisant un navigateur ouèbe standard.

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

