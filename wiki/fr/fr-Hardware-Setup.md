---
layout: wiki
title: "Configuration du matériel"
lang: "fr"
permalink: "/wiki/Hardware-Setup"
---


# Configuration du matériel

## Infos générales

**Pour que Jamulus soit stable, il est recommandé d'utiliser un PC avec une fréquence processeur d'au moins 1,5 GHz**

**Utilisateurs de Windows :** vous devez installer un pilote ASIO. Une carte son avec un pilote ASIO natif est recommandée. Consultez la page [Installation sous Windows](Installation-for-Windows) pour plus d'informations.

## Exemples de configurations

L'installation du matériel se résume généralement en quatre points, bien que chaque configuration soit différente.

1. Brancher l'interface audio à un port USB de votre ordinateur
2. Fermer tous les programmes et démarrer Jamulus (n'oubliez pas de choisir les bonnes entrées dans les paramètres de Jamulus)
3. Brancher votre instrument/microphone et votre casque
4. Se connecter à un serveur Jamulus et s'amuser !


## Windows : connexion de l'interface audio - ASIO4All
 
Voici un exemple d'installation de client Windows avec un périphérique audio [Behringer U-CONTROL UCA202]https://www.amazon.com/Behringer-U-Phono-UFO202-Audiophile-Interface/dp/B002GHBYZ0){: target="_blank" rel="noopener noreferrer"} (en anglais).
Les instructions suivantes devraient être similaires à celles pour d'autres périphériques audio.

_**La méthode exacte pour connecter vos instruments différera évidement en fonction de votre matériel**_

#### 1. Brancher l'interface audio à un port USB de votre ordinateur

Par la suite, utilisez toujours le même port USB pour le périphérique audio.

**Utilisateurs de Windows** : si ce n'est pas encore fait, téléchargez et installez le [pilote audio ASIO (ASIO4ALL) gratuit](https://www.asio4all.org){: target="_blank" rel="noopener noreferrer"}. Certaines personnes ont également indiqué avoir utilisé avec succès [ce pilote ASIO natif](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip){: target="_blank" rel="noopener noreferrer"} 
__actuellement non disponible__, bien qu'il ne figure plus sur les pages produits Berhinger en avril 2020. 

#### 2. Démarrez Jamulus

Configurez Jamulus pour qu'il utilise la configuration sonore correcte (voir [cet excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) (en anglais) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook). 

Assurez vous d'avoir bien éteint le bouton de monitoring de votre Behringer U-CONTROL UCA202 (sinon vous entendrez à la fois le son original que vous envoyez au serveur Jamulus ainsi que le son revenant, et vous risquez d'avoir un retour).

#### 3. Branchez votre instrument et votre casque

Branchez votre instrument sur les fiches d'entrée du Behringer U-CONTROL UCA202. Branchez votre casque sur le Behringer U-CONTROL UCA202.

#### 4. Connectez vous a un serveur Jamulus.

Vous y êtes ! Amusez-vous !

## Linux : connexion de l'interface audio avec QjackCtl

Consultez la page du [guide d'installation du client](Installation-for-Linux#configurer-jack-avec-qjackctl).

## Linux : noyaux à faible latence pour Jamulus
Vous voudrez peut-être installer [Ubuntu Studio](https://ubuntustudio.org/){: target="_blank" rel="noopener noreferrer"}, elle propose une seconde option à votre menu de démarrage avec un noyau à faible latence. La clef d'un bœuf résussi est la « faible latence » entre les serveurs et les clients Jamulus connectés. Si le système Linux sous-jacent est démarré avec une faible latence, cela a un impact positif sur vos sessions Jamulus.

## Points à noter à propos des entrées

- Si vous voulez connecter deux sources ou plus (par exemple, voix + synthé + guitare), il est important de noter que Jamulus ne supporte pour le moment que deux canaux d'entrée (G/D). Donc le matériel utilisé doit produire un mixage stéréo en sortie vers Jamulus.
- Les interfaces audio ressortent généralement un signal mixé sur leurs sorties analogiques, mais des signaux séparés (un par source) sur leurs sorties numériques (USB/Firewire/Thunderbolt).
- Les consoles de mixage ne ressortent généralement qu'un signal mixé sur leur sorties analogiques.
- Les consoles de mixage avec USB/Firewire/Thunderbolt ne ressortent généralement qu'un signal mixé sur leurs sorties **analogiques** ET uniquement des signaux séparés (pas de signal mixé) sur leurs sorties **numériques**.
- Quelques consoles de mixage avec USB/Firewire/Thunderbolt ressortiront soit **seulement** un signal mixé sur la sortie **numérique** (consoles d'entrée de bas de gamme), soit AJOUTERONT aussi un signal mixé aux signaux séparés sur la sorties numériques.

_(Merci à [pcar75](https://github.com/pcar75) pour cette information)_

## Autres exemples

**Cette vidéo documente une [session de bœuf live](https://youtu.be/c8838jS2g3U).** J'utilise une carte audio Lexicon Omega USB sur un Mac Mini de 2009. Les membres de mon groupe utilisent tous sous Windows 10 et ont des cartes audio Behringer, par exemple la Behringer Xenyx 1204USB. Ma connexion internet a 10 Mb/s en descendant et 1 Mb/s en montant via DSL. 

**Un utilisateur de Jamulus [Andrew Evans](https://sourceforge.net/u/belvario/profile/)**: les membres du groupe sont tous dans la même ville (mais connectés avec deux FAI) et atteignent un temps de ping de 20 ms, le serveur fonctionnant sur une machine Windows dédiée séparée et un client sur un Macbook Pro. Les joueurs distants avec un Macbook Air. Tous en connexions filaires ethernet sur leurs routeurs/passerelles personnels. Nous avons utilisé la vidéo WhatsApp pour nous voir (avec l'audio en sourdine - c'est drôle de constater à quel point l'audio de Whatsapp est en retard par rapport à Jamulus !)

## Des problèmes ?

Veuillez consulter la [FAQ sur le dépannage client](Client-Troubleshooting)
