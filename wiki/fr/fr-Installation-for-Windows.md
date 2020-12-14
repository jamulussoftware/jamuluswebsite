---
layout: wiki
title: "Installation sous Windows"
lang: "fr"
permalink: "/wiki/Installation-for-Windows"
---

# Installation sous Windows

Assurez-vous d'avoir déjà lu la page [Premier pas](Getting-Started).

1. **Téléchargez et installez un pilote ASIO**. Il est recommandé d'utiliser une interface audio ou une carte son avec un pilote ASIO natif. Si vous n'en avez pas (en particulier pour les cartes son internes), installez ce [pilote ASIO gratuit (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} avant d'installer Jamulus.
1. [Téléchargez et installez Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Si vous avez un avertissement de SmartScreen, cliquez sur « Plus d'infos » et « Exécuter quand même » pour installer Jamulus. C'est nécessaire car nous ne payons pas encore pour signer le code.
1. **Lancez Jamulus**. Vous devriez maintenant pouvoir utiliser Jamulus comme n'importe quelle autre application.
1. **Configurez votre carte son**. Lorsque vous aurez fini, vous devrez configurer votre matériel audio. Regardez comment configurer ASIO4All si vous l'utilisez ([défilez vers le bas](#configuration-de-asio4all)), et consultez ensuite la [Configuration du matériel](Hardware-Setup).

Vous pouvez également [compiler vous même le logiciel](Compiling) si vous le souhaitez.

***

## Configuration de ASIO4All
*La plupart des cartes son internes ont besoin de ce pilote. ASIO4All n'est pas recommandé si votre interface audio fournit son propre pilote ASIO, car celui-ci pourrait avoir une meilleure latence.*

Pour ASIO4All, vous aurez peut-être besoin d'expérimenter un peu pour trouver la bonne configuration car chaque ordinateur est un peu différent. Configurez votre carte son quand vous serez connecté à un serveur pour entendre votre instrument ou votre voix et vérifier que tout soit correctement configuré.

Avant de démarrer avec Jamulus :
1. **Fermez toutes les applications** (en particulier celles qui pourraient accéder à votre carte son comme votre navigateur/lecteur de média) car Jamulus a besoin d'un accès exclusif à votre carte son.
1. Si l'audio ne fonctionne pas directement, assurez-vous que seules les **entrées/sorties correctes** dans ASIO4All **sont activées**. Tout le reste devrait être désactivé. Ça peut être fait comme suit :

### Comment configurer les entrées ASIO4All (guide)

1. Ouvrez les paramètres de Jamulus
1. Allez dans les _« Paramètres ASIO »_
1. Activez le panneau _advanced view_ dans ASIO4All (cliquez sur l'icône d'outil en bas à droite)
1. Activez uniquement la carte son que vous voulez utiliser en cliquant sur le bouton à coté de son nom
1. Ouvrez les entrées de votre carte son en cliquant sur l'_icône plus_ à côté de cette carte son
1. Activez alors les entrées/sorties correctes dans la liste sous votre carte son et désactivez tout le reste

**Remarque :** de nombreuses cartes son internes sont appelées Realtek High Definition Audio, Conexant ou similaire. Concernant les entrées/sorties : les casques et les haut-parleurs sont souvent identifiés comme des sorties et les micros comme des entrées ou capture. Le mixage stéréo n'est généralement pas l'entrée/sortie que vous recherchez, vous pouvez donc le désactiver si vous le voyez.

### Vous avez des problèmes avec la configuration d'ASIO4All ?

Si rien ne fonctionne, essayez tout d'abord de **redémarrer Jamulus et/ou votre ordinateur**.
Ensuite, essayez de **configurer les entrées/sorties à nouveau**. Les entrées/sorties actives et accessibles affichent un bouton marche/arrêt allumé et un bouton de lecture. Si vous voyez une croix rouge ou un symbole jaune, vous devrez peut-être fermer d'autres applications comme votre navigateur, Zoom…

Regardez cette [vidéo](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} (en anglais) de @trombonepizza qui donne des informations plus détaillées sur la configuration d'ASIO4All.

Des informations officielles plus détaillées sur la façon de configurer ASIO4All sont aussi documentées dans les [FAQ officielles d'ASIO4All sur le site web d'ASIO4All](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} ainsi que dans le manuel d'ASIO4All. Vous trouverez très probablement ceci sur votre bureau ou dans le dossier où le binaire d'ASIO4All est installé (généralement `C:\Program Files (x86)\ASIO4ALL v2\`).

## Tout est installé ?

Jamulus a été installé et peut désormais être utilisé. Vous pouvez maintenant jeter un coup d'œil à la 

[page d'embarquement Jamulus](Onboarding){: .button}
