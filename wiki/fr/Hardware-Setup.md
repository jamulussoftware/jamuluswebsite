---
lang: fr
layout: wiki
permalink: /wiki/Hardware-Setup
title: 'Configuration du matériel'
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Configuration du matériel

## Informations générales

**Pour que Jamulus fonctionne de manière stable, il est recommandé d'utiliser un PC avec une fréquence CPU d'au moins 1,5 GHz.**

**Utilisateurs de Windows** : Vous devez installer un pilote ASIO. Une carte son avec un pilote ASIO natif est recommandée. Consultez la [page d'installation Windows](Installation-for-Windows) pour plus d'informations.

## Exemples de configuration

La configuration du matériel se résume généralement à 4 points, bien que chaque configuration soit différente.

1. Branchez l'interface sur un port USB de votre ordinateur.
2. Fermez tous les programmes et démarrez Jamulus (n'oubliez pas de choisir les bonnes entrées dans les paramètres de Jamulus).
3. Branchez votre instrument/microphone et vos écouteurs.
4. Connectez-vous à un serveur Jamulus et amusez-vous !


## Windows : Connexion d'une interface audio - ASIO4ALL

Voici un exemple d'installation client Windows avec le périphérique audio [Behringer U-CONTROL UCA202](https://www.amazon.com/Behringer-U-Phono-UFO202-Audiophile-Interface/dp/B002GHBYZ0). Les instructions suivantes peuvent être similaires avec d'autres périphériques audio.

_**La méthode exacte de connexion de votre instrument variera bien sûr en fonction de votre matériel.**_

#### 1. Branchez l'interface sur un port USB de votre ordinateur.

A l'avenir, utilisez toujours le même port USB pour le périphérique audio.

**Utilisateurs de Windows** : Si ce n'est pas déjà fait, téléchargez et installez le [pilote audio ASIO gratuit (ASIO4ALL)] (https://www.asio4all.org) { : target="_blank" rel="noopener noreferrer"}. Certaines personnes ont également déclaré avoir réussi à utiliser [ce pilote natif ASIO](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip){ : target="_blank" rel="noopener noreferrer"}. __actuellement non disponible__, bien qu'il ne figure pas sur les pages produits de Behringer en avril 2020.


#### 2. Démarrez Jamulus

Configurez Jamulus pour utiliser la bonne configuration sonore (voir [cet excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook).

Assurez-vous que vous avez désactivé le bouton de contrôle de votre Behringer U-CONTROL UCA202 (sinon vous entendrez à la fois le son original que vous envoyez au serveur Jamulus et le son renvoyé, et vous risquez d'avoir un retour).

#### 3. Branchez votre instrument et vos écouteurs

Connectez votre instrument à la prise d'entrée du Behringer U-CONTROL UCA202. Branchez votre casque dans le Behringer U-CONTROL UCA202.

#### 4. Connectez-vous à un serveur Jamulus.

Vous avez terminé ! Amusez-vous bien !

## Linux : Connexion d'une interface audio avec QjackCtl

Consultez le [guide d'installation du client] Linux (Installation-for-Linux#configure-jack-with-qjackctl).

## Linux : Noyaux à faible latence pour Jamulus

Vous voudrez peut-être installer [Ubuntu Studio] (https://ubuntustudio.org/). Il ajoute une deuxième option dans votre menu de démarrage pour un noyau à faible latence. La clé d'un boeuf réussi est une "faible latence" entre les serveurs et les clients Jamulus connectés. Si le système Linux sous-jacent est démarré avec un noyau à faible latence, cela a un impact positif sur la latence de vos sessions Jamulus.


## Points à noter concernant les entrées

- Si vous souhaitez connecter 2 sources ou plus (par exemple, voix + synthétiseur + guitare), il est important de noter que Jamulus ne gère actuellement que 2 canaux d'entrée (G/D). Le matériel utilisé doit donc fournir une sortie stéréo mixée à Jamulus. Vous pouvez également exécuter deux instances de Jamulus, si votre matériel le permet, ou utiliser des entrées audio virtuelles vers Jamulus pour chaque entrée matérielle.
- Les interfaces audio produisent généralement un signal mixte sur leur sortie analogique, mais des signaux séparés (1 par source) sur leur sortie numérique (USB/FireWire/Thunderbolt).
- Les mixeurs ne produisent généralement que des signaux mixés sur leur sortie analogique.
- Les mixeurs avec USB/FireWire/Thunderbolt émettent généralement un signal mixé vers le bas sur leur sortie **analogique** ET des signaux séparés uniquement (pas de signal mixé vers le bas) sur leur sortie **numérique**.
- Quelques mixeurs avec USB/FireWire/Thunderbolt enverront **seulement** un signal mixé vers le bas sur la sortie **numérique** (mixeurs à petit budget), ou bien ajouteront également un signal stéréo mixé vers le bas aux signaux séparés sur la sortie numérique.

(Merci à [pcar75](https://github.com/pcar75) pour cette information).

## Autres exemples

**Cette vidéo documente une [live jam session](https://youtu.be/c8838jS2g3U).** J'utilise une carte audio USB Lexicon Omega sur un Mac Mini 2009. Mes collègues utilisent tous Windows 10 et ont des cartes audio Behringer, par exemple la Behringer Xenyx 1204USB. Ma connexion Internet est de 10 Mbit/s en aval / 1 Mbit/s en amont via DSL.

**Utilisateur de Jamulus [Andrew Evans] (https://sourceforge.net/u/belvario/profile/)** : Avec des membres du groupe tous situés dans la même ville (mais couvrant 2 FAI) et obtenant un temps de ping constant de 20 ms, en faisant tourner le serveur sur une machine Windows dédiée séparée et un client sur un MacBook Pro. Les joueurs distants sur MacBook Air. Tout le monde sur des connexions Ethernet filaires à leur routeur/ passerelle domestique. Nous avons utilisé la vidéo WhatsApp pour nous voir (avec le son coupé - c'est amusant de voir à quel point l'audio de WhatsApp est en retard sur Jamulus !)

## Vous avez des problèmes ?

Veuillez consulter la [FAQ sur le dépannage du client] (Client-Troubleshooting).
