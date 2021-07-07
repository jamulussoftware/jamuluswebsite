---
lang: fr
layout: wiki
permalink: /wiki/Getting-Started
title: Configuration
---

# Configuration - démarrer avec Jamulus

Pour tirer le meilleur parti de Jamulus, vous aurez besoin au minimum de :

1. **Une connexion Internet filaire** (pas de wi-fi - voir la [FAQ](/wiki/FAQ#Pourquoi-ne-devrais-je-pas-utiliser-un-équipement-sans-fil))
1. **Un casque filaire** (pas de Bluetooth ni d'enceintes - voir la [FAQ](/wiki/FAQ#Pourquoi-ne-devrais-je-pas-utiliser-un-équipement-sans-fil))
1. **Un périphérique audio raisonnable, une carte son et/ou un micro** ([voir cette liste](/kb/2021/01/05/Jamulus-Sound-Devices.html) pour des exemples)

Si vous avez des questions, veuillez consulter la rubrique [Discussions](https://github.com/jamulussoftware/jamulus/discussions)

## Installation

To get Jamulus working with your operating system, please follow the installation guide for your platform:

<div class="fx-row fx-row-start-xs button-container">
    <a href="Installation-for-Windows" class="button fx-col-100-xs">Windows</a>
    <a href="Installation-for-Macintosh" class="button fx-col-100-xs">macOS</a>
    <a href= "Installation-for-Linux" class="button fx-col-100-xs">Linux</a>
</div>

Et pour l'instant, fermez toutes les autres applications. Il est préférable de commencer de manière simple.

## Hardware Setup

If you use external audio hardware, plug that in before you start Jamulus. If you haven't configured your hardware, please see the installation guides mentioned above.

## Fenêtre principale de Jamulus

Lorsque vous ouvrez Jamulus, vous verrez une fenêtre qui ressemble à ceci :

<figure>
  <img src="{{site.url}}/assets/img/fr-screenshots/main-screen-default.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>La fenêtre principale avant de se connecter à un serveur</figcaption>
</figure>


## Configuration d'un profil

Tout d'abord, faites savoir aux autres qui vous êtes. Cliquez sur "Affichage" (barre en haut) > "Mon profil..." Vous verrez alors ceci :

<figure>
  <img src="{{site.url}}/assets/img/fr-screenshots/settings-profile.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Laissez les gens savoir qui vous êtes</figcaption>
</figure>


Remplissez au moins "Alias/Nom" et fermez la fenêtre.

## Se connecter à un serveur et tester son son.

Avant de vous connecter à un serveur, vous ne devez **pas** être capable de vous entendre. Écouter le son provenant de Jamulus (et non de vous-même) est appelé "la règle d'or" et vous permet de jouer en rythme avec les autres ([voir la FAQ](/wiki/FAQ#Pourquoi-ne-devrais-je-pas-écouter-mon-propre-signal)).

**Avant de jouer avec d'autres personnes, nous vous recommandons de vous connecter à un serveur vide pour tester votre configuration**, et de vous assurer que vous écoutez le signal qui revient du serveur (si possible) et pas vous-même.

Utilisez maintenant le bouton "Connecter" dans la fenêtre principale de Jamulus pour rejoindre un serveur. Une fenêtre s'ouvre alors :

<figure>
  <img src="{{site.url}}/assets/img/fr-screenshots/connection-setup-window.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Connexion à un serveur</figcaption>
</figure>

The most important thing about servers is their “ping time”. The bigger the number, the harder it will be to play in time with others. Usually, you would select a server with a ping of less than 50ms if you can.

Once connected to a server, make sure you can hear yourself OK and fix any input volume or other problems. You can have a look at the [troubleshooting page](/wiki/Client-Troubleshooting) for common problems. And of course, check that you are also able to obey [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

## Jouer pour la première fois

Une fois votre son configuré, vous êtes prêt à jouer. Lorsque vous vous connectez à un serveur (vous pouvez sélectionner un genre dans la liste), les faders que vous voyez sur la droite sont votre mixage personnel. Tout ce que vous modifiez ici changera ce que vous entendez, mais n'affectera pas les autres. Si vous déplacez un fader vers le bas, ce canal sera plus silencieux, si vous le déplacez vers le haut, le canal sera plus fort pour vous.

<figure>
  <img src="{{site.url}}/assets/img/fr-screenshots/main-screen-medium.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>La fenêtre principale lorsque vous êtes connecté à un serveur</figcaption>
</figure>

Si vous ne voulez pas que les autres entendent votre audio, cliquez sur le bouton "Me silencer" qui empêchera votre audio d'être envoyé aux autres personnes. Ils ne seront pas en mesure de dire que vous avez fait cela cependant. Mais si vous voyez une icône "sourdine" au-dessus d'un chariot, cela signifie qu'ils ne peuvent pas vous entendre car ils ont coupé votre canal dans leur mélange audio.

Notez que vous pouvez utiliser la fonction de tchate à tout moment pour envoyer des messages à d'autres personnes lorsque vous êtes connecté. Le message de bienvenue dans le tchate peut également indiquer certaines directives d'utilisation.

Vous trouverez de plus amples informations sur l'utilisation de Jamulus dans le [Manuel du logiciel](/wiki/Software-Manual).

## Dépannage

Vous avez des problèmes audio ? Vous ne pouvez pas voir les serveurs, ou un autre problème ? Consultez la page [Dépannage](/wiki/Client-Troubleshooting), ou posez vos questions dans la section [Discussions](https://github.com/jamulussoftware/jamulus/discussions).
