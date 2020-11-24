---
layout: wiki
title: "Installation sous Windows"
lang: "fr"
permalink: "/wiki/Installation-for-Windows"
---

# Installation sous Windows
Assurez-vous de lire le [guide de démarrage et installation](Getting-Started) avant de commencer.
1. **Téléchargez et installez un pilote ASIO**. Il est recommandé d'utiliser une carte/interface son avec un pilote ASIO natif. Si vous n'en avez pas (en particulier pour les cartes son internes), installez ce [pilote ASIO gratuit (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} avant d'installer Jamulus.
1. **Téléchargez et installez Jamulus** depuis [la page du projet Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Si vous avez un avertissement, cliquez sur "Plus d'infos" et "Exécuter quand même" pour installer Jamulus.
1. **Configurez votre interface audio**. Lorsque vous en avez terminé, vous devez configurer votre matériel audio. Regardez comment configurer ASIO4All si vous l'utilisez (défilez vers le bas), et ensuite consulter la section [Configuration du matériel](Hardware-Setup).

Vous pouvez également [compiler vous même le logiciel](Compiling) si vous en avez envie.

***

## Configuration de ASIO4All
*ASIO4All n'est pas recommandé si votre interface audio fournit son propre pilote ASIO, car celui-ci pourrait avoir une meilleure latence.*

Tout d'abord, **fermez toutes les applications** (en particulier celles qui pourraient accéder à votre carte son comme votre navigateur) pour minimiser les conflits. Si l'audio ne fonctionne pas, assurez-vous que seules les **entrées/sorties correctes** de son panneau de contrôle **sont activées**. Vous devrez peut-être faire quelques expériences pour trouver les bonnes, car chaque ordinateur est un peu différent. Faites-le pendant que vous êtes connecté à un serveur pour entendre votre instrument ou votre voix et vérifiez si tout est correctement configuré.

### Comment configurer les entrées ASIO4All (Guide)

1. Ouvrez les paramètres de Jamulus
1. Allez à _"ASIO Settings"_ (Configuration ASIO)
1. Activer le panneau _advanced view_ dans ASIO4All (cliquez sur l'icône en bas à droite)
1. Ouvrez vos entrées de carte son en cliquant sur l'icône _plus_ à côté du nom de la carte son.
1. Activez/désactivez maintenant les entrées/sorties correctes

De nombreuses cartes son internes sont appelées Realtek High Definition Audio, Conexant ou similaire.
Les casques et les haut-parleurs sont souvent étiquetés comme sorties et les microphones comme entrées.

### Vous avez des problèmes avec la configuration d'ASIO4All ?

Bien qu'ASIO4All fonctionne normalement en toute simplicité, vous pourriez rencontrer des problèmes de configuration.

Si rien ne fonctionne, essayez tout d'abord de **redémarrer Jamulus et/ou votre PC**.
Ensuite, essayez de **régler les entrées/sorties à nouveau**. Les entrées/sorties activées et accessibles affichent un bouton marche/arrêt allumé et un bouton de lecture. Si vous voyez une croix rouge ou un symbole jaune, vous devrez peut-être fermer d'autres applications comme votre navigateur, Zoom, Skype...

Regardez cette [vidéo](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} sur Youtube (en anglais) de Andrew Williams
 qui donne des informations plus détaillées sur la configuration d'ASIO4All.

Des informations plus détaillées sur la façon de configurer ASIO4All sont documentées dans les [FAQ officielles d'ASIO4All](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} sur le site web d'ASIO4All ainsi que dans le manuel d'ASIO4All. Vous trouverez très probablement ces informations sur votre bureau ou dans le dossier où le binaire d'ASIO4All est installé (généralement `C:\Program Files (x86)\ASIO4ALL v2\`).

## Tout est installé ?
Jamulus a été installé et peut être utilisé maintenant. Si vous n'avez pas encore installé votre matériel audio, consultez la section [configuration du matériel](Hardware-Setup).

Pour des informations plus détaillées sur l'utilisation de Jamulus, vous pouvez consulter l'[aide de Jamulus (Manuel du logiciel)](Software-Manual).
