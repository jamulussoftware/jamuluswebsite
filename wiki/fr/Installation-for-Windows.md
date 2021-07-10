---
lang: fr
layout: wiki
permalink: /wiki/Installation-for-Windows
title: 'Installation sous Windows'
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation sous Windows

Assurez-vous d'avoir déjà lu la page [Getting Started](Getting-Started).
1. **Téléchargez et installez un pilote ASIO**. Il est recommandé d'utiliser une interface audio avec un pilote ASIO natif. Si vous n'avez pas d'interface audio externe, vous devrez probablement installer un pilote générique comme ASIO4ALL. Pour plus d'informations, consultez la section [ASIO](#asio).
1. [Téléchargez Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
 **Miroir 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Installez Jamulus** : Double-cliquez sur le programme d'installation pour le lancer. Si vous recevez un avertissement de SmartScreen, cliquez sur "Plus d'infos" et "Exécuter quand même" pour installer Jamulus. (Si vous avez récupéré une nouvelle version de Jamulus et que vous êtes l'une des premières personnes à l'avoir téléchargée, Jamulus ne sera pas encore sur la liste blanche de SmartScreen. Nous ne payons pas pour la signature du code).
1. **Exécutez Jamulus**. Vous devriez maintenant pouvoir utiliser Jamulus comme n'importe quelle autre application.
1. **Set up your sound card**. When you're done, you need to set up your audio hardware. Have a look at how to set up ASIO4ALL below, if you're using that.

***

## ASIO

Jamulus utilise [ASIO] (https://fr.wikipedia.org/wiki/Audio_Stream_Input/Output) pour offrir la latence la plus faible.
* Si vous possédez une interface audio, utilisez son pilote ASIO officiel (il fournit généralement la meilleure qualité).
* Si vous n'avez pas de carte son externe, vous n'aurez probablement pas de pilote ASIO. Vous devrez donc en installer un générique comme ASIO4ALL :

Vous pouvez essayer deux versions d'ASIO4ALL. ASIO4ALL v2.14 inclut une solution de contournement pour un bogue qui pourrait casser d'autres fonctionnalités.

[ASIO4ALL v2.15 Beta 2 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta2_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### Configuration de ASIO4All

*ASIO4All n'est pas recommandé si votre interface audio fournit son propre pilote ASIO, car celui-ci pourrait avoir une meilleure latence.*

For ASIO4ALL, you may or may not need to experiment a bit depending on your sound hardware. If everything works out of the box, you don't need to do anything.

**Tip:** Set up your sound card while you're [connected to a server](Getting-Started#connecting-to-a-server-and-testing-your-sound) to hear your instrument or voice and check if everything is correctly set up; but first read on.


Avant de démarrer avec Jamulus :
1. **Close all applications** (especially those which could access your sound card like your browser/media player). ASIO4ALL needs exclusive access to your sound card which means that other programs will not be able to use audio if ASIO4ALL and Jamulus are running.
1. Si l'audio ne fonctionne pas directement, assurez-vous que seules les **entrées/sorties correctes** dans ASIO4All **sont activées**. Tout le reste devrait être désactivé. Ça peut être fait comme suit :

### Comment configurer les entrées ASIO4All (guide)

1. Ouvrez les paramètres de Jamulus
1. Allez dans les _« Paramètres ASIO »_ (colonne de gauche ; directement sous la sélection du pilote)
1. Activez le panneau _advanced view_ dans ASIO4All (cliquez sur l'icône d'outil en bas à droite)
1. Activez uniquement la carte son que vous voulez utiliser en cliquant sur le bouton à coté de son nom
1. Ouvrez les entrées de votre carte son en cliquant sur l'_icône plus_ à côté de cette carte son
1. Activez alors les entrées/sorties correctes dans la liste sous votre carte son et désactivez tout le reste. Vous pouvez survoler les entrées/sorties pour voir de quelles entrées/sorties il s'agit et si elles supportent le taux d'échantillonnage requis pour Jamulus de 48kHz (qualité DVD).

**Remarque :**
1. De nombreuses cartes son internes sont appelées Realtek High Definition Audio, Conexant ou similaire.
1. Les casques et les haut-parleurs sont souvent identifiés comme des sorties et les micros comme des entrées ou capture.
1. Stereo Mix/Stereo Input is usually not the input/output you're looking for. Therefore, switch it off if you see it.

### Vous avez des problèmes avec la configuration d'ASIO4All ?

Si rien ne fonctionne, redémarrez d'abord Jamulus et/ou votre PC pour fermer les processus d'arrière-plan qui peuvent accéder à votre carte son.

Ensuite, *réglez les entrées/sorties*. Les entrées/sorties activées et accessibles sont représentées par des boutons d'alimentation et de lecture allumés. Si, au contraire, vous voyez une croix rouge ou un symbole jaune, fermez les autres applications qui peuvent accéder à votre carte son (par exemple, le navigateur, Zoom, etc.).

Regardez [cette vidéo] (https://youtu.be/_GzOsitVgLI) par [trombonepizza] (https://github.com/trombonepizza) qui donne des informations plus détaillées sur la configuration de ASIO4ALL.

Official and further information about how to configure ASIO4ALL is documented in the official [ASIO4ALL FAQs on the ASIO4ALL website](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"}.

## Tout est installé ?

Jamulus a été installé et peut être utilisé dès maintenant. Vous pouvez maintenant jeter un coup d'œil à la

[Jamulus setup page](Getting-Started){: .button}
