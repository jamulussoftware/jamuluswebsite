---
lang: fr
layout: wiki
permalink: /wiki/Running-a-Server
title: 'Exécuter un serveur'
---

# Exécuter un serveur

## Dois-je faire tourner un serveur pour utiliser Jamulus ?

NON. { : .doubletextsize .red }


Vous pouvez simplement choisir le serveur de quelqu'un d'autre dans votre liste et vous lancer.

**Vous ne voulez pas être interrompu par des inconnus ?** Une fois que vous et vos amis êtes connectés à un serveur public, appuyez sur les boutons "solo" des musiciens avec lesquels chacun d'entre vous veut jouer. Tous ceux que vous ne mettez pas en solo verront une icône "muted" sur votre fader. Et vous ne les entendrez pas.

## Cela semble trop facile.

Si vous voulez vraiment gérer un serveur, il est **très important** que vous lisiez et compreniez quel type de serveur vous voulez gérer.

<div class="fx-row fx-row-start-xs button-container">
  <a href="Choosing-a-Server-Type" class="button fx-col-100-xs" target="_blank" rel="noopener noreferrer">Lecture sur les types de serveurs</a>
</div>

... puis revenez ici.

### Vitesse et latence

**_La capacité du serveur lui-même (et du réseau sur lequel il se trouve) n'est PAS le principal déterminant de la qualité d'une session Jamulus!_**

De nombreuses personnes attribuent au serveur des problèmes qui sont en fait des problèmes du _client_. Cela dépend en grande partie du [matériel](Hardware-Setup) des clients, des réseaux sur lesquels ils se trouvent et de leur respect de la [règle numéro un](Getting-Started#having-trouble-cant-keep-in-time). Il n'y a donc aucune garantie que vous obtiendrez une latence plus faible ou de meilleures performances générales en ayant votre propre serveur.

Si vous prévoyez de jouer régulièrement avec les mêmes personnes, **il vous est fortement conseillé** de vous assurer d'abord que chaque membre du groupe est configuré pour utiliser Jamulus correctement. Pour ce faire, trouvez un serveur public avec un temps de ping raisonnable pour vous tous (20 ms ou moins, par exemple), connectez-vous tous à ce serveur et essayez de résoudre les problèmes individuels (en vérifiant qu'ils peuvent [suivre la règle numéro un](Getting-Started#having-trouble-cant-keep-in-time) en particulier). Utilisez la technique du solo ci-dessus pour éviter d'être interrompu si nécessaire.

Une fois que tous les problèmes avec les musiciens ont été résolus de cette manière, vous pouvez alors envisager d'héberger votre propre serveur, soit à la maison, soit sur un hôte en nuage tel qu'Amazon, ce qui peut donner lieu à une meilleure latence que les serveurs gérés à la maison. Par exemple, [voir ce guide](https://www.facebook.com/notes/jamulus-worldjam/howto-idiots-guide-to-installing-or-upgrading-a-jamulus-server-on-amazon-aws-lig/818091045662521/) pour utiliser AWS Lightsail, par l'utilisateur de Jamulus [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) (_Facebook_).

### Bande passante - en avez-vous assez ?

Une jam typique peut compter 4 personnes, pour lesquelles vous avez besoin de 200 Kbit/s * 4 = 800 Kbit/s (0,8 Mbit/s) en amont et en aval. Donc, si vous disposez d'une connexion à large bande de 10 Mbit/s en aval et de 1 Mbit/s en amont, **vous risquez de manquer de bande passante si un cinquième joueur vous rejoint**, en particulier si d'autres musiciens choisissent des paramètres qui augmentent leur utilisation. Vous pouvez [vérifier que votre vitesse est suffisante](https://fast.com) pour cela. En savoir plus sur [l'utilisation de la bande passante](Network-Requirements) à différents niveaux de qualité.

### En général

- Envisagez d'utiliser un hôte en nuage pour obtenir de meilleurs temps de ping si vous avez des problèmes.

- Tout serveur doit avoir une fréquence de CPU d'au moins 1,6 GHz et 1 Go de RAM.

- L'exécution d'un serveur peut nécessiter l'ajustement de tout pare-feu fonctionnant sur ou en dehors de votre machine ou de votre hôte cloud.

- L'exécution d'un **serveur privé à domicile** (mais pas d'un serveur public) nécessitera que vous fassiez un [port forward](Running-a-Private-Server) sur votre routeur.

- Jamulus ne prend pas actuellement en charge l'IPv6.


## Tout va bien ? Installez-vous !

<div class="fx-row fx-row-start-xs button-container">
    <a href="Server-Win-Mac" class="button fx-col-100-xs">Pour les utilisateurs de Windows ou macOS</a>
    <a href="Server-Linux" class="button fx-col-100-xs">Pour les utilisateurs de Linux</a>
</div>

Si vous souhaitez faire fonctionner un serveur sur un Raspberry Pi, jetez un œil au [guide pour Raspberry Pi](/kb/2020/03/28/Server-Rpi.html) de fredsiva.

Les opérateurs de serveur peuvent également être intéressés par le téléchargement de [cet ensemble d'outils utiles](https://github.com/jamulussoftware/jamulus/tree/master/tools) depuis le dépôt Jamulus (clonez le dépôt Git et appelez également `git submodule update --init`).

## Vous avez des problèmes ? Vous avez des problèmes ?

Consultez la [FAQ sur le dépannage du serveur](Server-Troubleshooting)
