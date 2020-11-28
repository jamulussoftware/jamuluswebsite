---
layout: wiki
title: "Configuration du matériel"
lang: "fr"
permalink: "/wiki/Hardware-Setup"
---


# Configuration du matériel

## Infos générales

**Pour que Jamulus soit stable il est recommandé d'utiliser un PC avec un processeur ayant une fréquence de 1,5GHz minimum**

**Utilisateurs de Windows :** vous devez installer un pilote ASIO. Une interface audio avec un pilote ASIO natif est recommandée. Consultez la page [installation sous Windows](Installation-for-Windows) pour plus d'informations.

## Exemple de configuration

L'installation du matériel se résume généralement en quatre points, bien que chaques configurations soient différentes.

1. Brancher l'interface audio à un port USB de votre ordinateur
2. Fermer tous les programmes et démarrer Jamulus (n'oubliez pas de séléctionner les bonnes entrée dans les paramètres de Jamulus)
3. Brancher votre instrument ou micro et votre casque
4. Se connecter à un serveur Jamulus et prendre du plaisir !


## Windows: Connexion de l'interface audio, ASIO4All
 
Voici un exemple d'installation du client Windows avec une interface audio [Behringer U-CONTROL UCA202](https://www.amazon.com/Behringer-U-Phono-UFO202-Audiophile-Interface/dp/B002GHBYZ0){: target="_blank" rel="noopener noreferrer"} (en anglais).
Ces instructions devraient être similaires à celles pour d'autres équipements audio.

_**La méthode exacte pour connecter vos instruments va évidement différer en fonction de votre matériel**_

#### 1. Brancher l'interface audio à un port USB de votre ordinateur

Par la suite, utilisez toujours le même port pour brancher le périphérique audio.

**Utilisateurs Windows** : Si ce n'est pas encore fait, téléchargez et installez le [driver ASIO gratuit (ASIO4ALL)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"}. Certaines personnes ont également indiqué avoir utilisé avec succès [ce driver ASIO natif](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip){: target="_blank" rel="noopener noreferrer"} 
__actuellement non disponible__, bien qu'il ne figure plus sur les pages produits Berhinger à partir d'avril 2020. 

#### 2. Démarrez Jamulus

Configurez Jamulus pour qu'il utilise la bonne configuration sonore (voir [cet excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a), en anglais, sur Facebook). 

Assurez vous d'avoir bien éteint le bouton de monitoring sur votre Behringer U-CONTROL UCA202 (autrement vous allez entendre les deux signaux : le son original que vous envoyez au serveur Jamulus et le son renvoyé en retour, ce qui risque de provoquer un larsen).

#### 3. Branchez votre instrument et votre casque

Branchez votre instrument au connecteur « input » de la Behringer U-CONTROL UCA202. Branchez votre casque à la Behringer U-CONTROL UCA202.

#### 4. Connectez vous a un serveur Jamulus.

Vous y êtes ! Amusez vous !


## Linux : connexion de l'interface audio avec QJackCtrl

Référez vous à la page d'[installation du client sous Linux](Installation-for-Linux#configure-jack-with-qjackctl).

## Linux : Noyaux à faible latence pour Jamulus

Vous voudrez peut-être installer [Ubuntu Studio](https://ubuntustudio.org/){: target="_blank" rel="noopener noreferrer"}, elle propose une seconde option au menu de démarrage avec un noyau à faible latence. La clef d'une « Jam » résussie est la « faible latence » entre les serveurs et les clients Jamulus connectés. Si le sous système Linux est démarré avec une faible latence, ça a un impact positif sur vos sessions Jamulus.

## Points à noter à propos des entrées

- Si vous voulez connecter deux sources ou plus (par ex. voix + synthé + guitare), il est important de noter que Jamulus ne supporte pour le moment que deux canaux d'entrée (G/D). Donc le matériel utilisé doit produire un mixage stéréo en sortie vers Jamulus.
- Les interfaces audio procurent généralement un signal stéréo mixé sur leur sorties analogiques, mais des signaux séparés (un par source) sur leurs sorties numériques (USB/Firewire/Thunderbolt).
- Les consoles de mixages ne procurent qu'un signal stéréo mixé sur leur sorties analogiques.
- Les console de mixage avec USB/Firewire/Thunderbolt procurent généralement un signal stéréo mixé sur leurs sorties **analogiques** ET uniquement des signaux séparés (pas de signal mixé) sur leurs sorties **numériques**.
- Un grand nombre de console de mixage avec USB/Firewire/Thunderbolt procureront soit **seulement** un signal stéréo mixé sur la sortie **numérique** (consoles d'entrée de gamme), soit AJOUTERONT aussi un signal stéréo mixé aux signaux séparés sur leurs sorties numériques.

_(Merci à [pcar75](https://github.com/pcar75) pour cette information)_

## Autres exemples

**Cette vidéo documente une [jam session live](https://youtu.be/c8838jS2g3U).** J'utilise une interface audio Lexicon Omega USB sur un Mac Mini de 2009. Les membres de mon groupes sont tous sous Windows 10 et ont des interfaces audio Behringer, par ex. la Behringer Xenyx 1204USB. Ma connexion Internet a 10 Mb/s en descendant et 1 Mb/s en montant via DSL. 

**Un utilisateur de Jamulus [Andrew Evans](https://sourceforge.net/u/belvario/profile/)**: Les membres du groupes sont tous dans la même ville (mais connectés avec deux FAI) avec un temps de réponse ateignant 20ms, le serveur fonctionnant sur une machine Windows dédiée séparée et le client sur un Macnook Pro. Les joueurs distants avec un Macbook Air. Tous en connexion filaire ethernet sur leurs routeurs personnels. Nous avons utilisés la vidéo WhatsApp pour nous voir (avec l'audio désactivée, il est amusant de voir à quel point l'audio Whatsapp est en retard par rapport à Jamulus !)

## Des problèmes ?

Veuillez consulter la [FAQ résolution des problèmes](Client-Troubleshooting)
