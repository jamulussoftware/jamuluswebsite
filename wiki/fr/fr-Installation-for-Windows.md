---
layout: wiki
title: "Installation sous Windows"
lang: "fr"
permalink: "/wiki/Installation-for-Windows"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation sous Windows
Assurez-vous d'avoir déjà lu la page [Premier pas](Getting-Started).
1. **Téléchargez et installez un pilote ASIO**. Il est recommandé d'utiliser une interface audio avec un pilote ASIO natif. Si vous n'avez pas d'interface audio externe, vous devrez probablement installer un pilote générique comme ASIO4ALL. Pour plus d'informations, consultez la section [ASIO](#asio).
1. [Téléchargez Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
**Miroir 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Installez Jamulus** : Double-cliquez sur le programme d'installation pour le lancer. Si vous recevez un avertissement de SmartScreen, cliquez sur "Plus d'infos" et "Exécuter quand même" pour installer Jamulus. (Si vous avez récupéré une nouvelle version de Jamulus et que vous êtes l'une des premières personnes à l'avoir téléchargée, Jamulus ne sera pas encore sur la liste blanche de SmartScreen. Nous ne payons pas pour la signature du code).
1. **Lancez Jamulus**. Vous devriez maintenant pouvoir utiliser Jamulus comme n'importe quelle autre application.
1. **Configurez votre carte son**. Une fois que vous avez terminé, vous devez configurer votre matériel audio. Regardez comment configurer ASIO4ALL si vous l'utilisez et/ou [Configurer le matériel](Hardware-Setup).

***

## ASIO
Jamulus utilise [ASIO] (https://fr.wikipedia.org/wiki/Audio_Stream_Input/Output) pour offrir la latence la plus faible.
* Si vous possédez une interface audio, utilisez son pilote ASIO officiel (il fournit généralement la meilleure qualité).
* Si vous n'avez pas de carte son externe, vous n'aurez probablement pas de pilote ASIO. Vous devrez donc en installer un générique comme ASIO4ALL :

Vous pouvez essayer deux versions d'ASIO4ALL. ASIO4ALL v2.14 inclut une solution de contournement pour un bogue qui pourrait casser d'autres fonctionnalités.

[ASIO4ALL v2.15 Beta 1 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta1_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


## Configuration de ASIO4All
*ASIO4All n'est pas recommandé si votre interface audio fournit son propre pilote ASIO, car celui-ci pourrait avoir une meilleure latence.*

Pour ASIO4All, vous aurez peut-être besoin d'expérimenter un peu pour trouver la bonne configuration car chaque ordinateur est un peu différent.

**Astuce :** Configurez votre carte son lorsque vous êtes [connecté à un serveur] (Onboarding#2-connecting-to-a-server) pour entendre votre instrument ou votre voix et vérifier si tout est correctement configuré ; mais lisez d'abord ce qui suit.

Avant de démarrer avec Jamulus :
1. **Fermez toutes les applications** (en particulier celles qui pourraient accéder à votre carte son comme votre navigateur/lecteur de média) car Jamulus a besoin d'un accès exclusif à votre carte son. Les autres programmes ne pourront pas utiliser l'audio si ASIO4ALL et Jamulus sont en cours d'exécution.
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
1. Le mixage stéréo n'est généralement pas l'entrée/sortie que vous recherchez, vous pouvez donc le désactiver si vous le voyez.

### Vous avez des problèmes avec la configuration d'ASIO4All ?

Si rien ne fonctionne, redémarrez d'abord Jamulus et/ou votre PC pour fermer les processus d'arrière-plan qui peuvent accéder à votre carte son.

Ensuite, *réglez les entrées/sorties*. Les entrées/sorties activées et accessibles sont représentées par des boutons d'alimentation et de lecture allumés. Si, au contraire, vous voyez une croix rouge ou un symbole jaune, fermez les autres applications qui peuvent accéder à votre carte son (par exemple, le navigateur, Zoom, etc.).

Regardez [cette vidéo] (https://youtu.be/_GzOsitVgLI) par [trombonepizza] (https://github.com/trombonepizza) qui donne des informations plus détaillées sur la configuration de ASIO4ALL.

Des informations officielles et supplémentaires sur la façon de configurer ASIO4ALL sont documentées dans la [FAQ officielle d'ASIO4ALL sur le site web d'ASIO4ALL](https://www.asio4all.org/index.php/help/faq/){ : target="_blank" rel="noopener noreferrer"} et dans le manuel d'ASIO4ALL qui se trouve sur votre bureau ou dans le dossier où le binaire d'ASIO4ALL est installé (généralement `C:\Program Files (x86)\ASIO4ALL v2\`)).

## Tout est installé ?

Jamulus a été installé et peut désormais être utilisé. Vous pouvez maintenant jeter un coup d'œil à la 

[page d'embarquement Jamulus](Onboarding){: .button}
