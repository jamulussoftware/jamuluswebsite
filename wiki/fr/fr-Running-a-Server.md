---
layout: wiki
title: "Administration d'un serveur"
lang: "fr"
permalink: "/wiki/Running-a-Server"
---

# Administration d'un serveur

## Ai-je besoin de mon propre serveur pour utiliser Jamulus ?

NON.
{: .doubletextsize .red }


Il suffit juste de choisir le serveur de quelqu'un d'autre dans votre liste et d'y aller.

**Vous ne voulez pas être dérangé par des inconnus ?** Une fois que vous et vos amis êtes connectés à un serveur public, appuyez sur les boutons « solo » des musiciens avec lesquels chacun de vous veut jouer. Chacun de ceux que vous ne mettez pas en solo, verra une icône « muet » sur votre canal. Et vous ne les entendrez pas.

## Ça semble trop facile.

Si vous voulez vraiment administrer votre propre serveur, il est **très important** que vous lisiez et compreniez quel type de serveur vous voulez faire fonctionner :

<div class="fx-row fx-row-start-xs button-container">
  <a href="Choosing-a-Server-Type" class="button fx-col-100-xs" target="_blank" rel="noopener noreferrer">En savoir plus sur les types de serveurs</a>
</div>

… puis, revenez ici.

### Vitesse et latence

**_La capacité du serveur lui-même (et du réseau sur lequel il se trouve) n'est PAS le principal facteur déterminant de la qualité d'une session Jamulus !_**

Beaucoup de gens attribuent au serveur des problèmes qui sont en fait des problèmes avec le _client_. Cela dépend beaucoup du [matériel](Hardware-Setup) des clients, des réseaux sur lesquels _ils_ se trouvent, et de leur respect de la [règle numéro un](Getting-Started#vous-avez-des-problèmes--vous-narrivez-pas-à-être-en-rythme-). Il n'y a donc aucune garantie que vous obtiendrez une latence plus faible ou de meilleures performances globales en ayant votre propre serveur.

Si vous prévoyez de jouer régulièrement avec les mêmes personnes, **il vous est fortement conseillé** de vous assurer d'abord que chaque membre du groupe est configuré pour utiliser Jamulus correctement. Pour ce faire, trouvez un serveur public avec un temps de ping raisonnable pour chacun d'entre vous (20ms ou moins peut-être), connectez-vous tous à ce serveur et essayez de résoudre les problèmes individuels (en vérifiant qu'ils peuvent [suivre la règle numéro un](Getting-Started#vous-avez-des-problèmes--vous-narrivez-pas-à-être-en-rythme-) en particulier). Utilisez la technique solo ci-dessus pour éviter d'être interrompu si nécessaire.

Une fois les problèmes avec les musiciens résolus de cette manière, vous pouvez alors envisager d'héberger votre propre serveur soit chez vous, soit sur un hôte dans le « Cloud » comme Amazon, ce qui pourrait entraîner une meilleure latence qu'un serveur fonctionnant à domicile. Par exemple, [voir ce guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/howto-idiots-guide-to-installing-jamulus-server-on-amazon-aws-lightsail-ubuntu-i/507719749802976/) (en anglais) d'utilisation de AWS Lightsail par l'utilisateur de Jamulus [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) (_Facebook_).

### Bande passante - en avez-vous suffisamment ?

Un bœuf typique peut compter 4 personnes, pour lesquelles il faut 200Kbps x 4 = 800Kbs (0,8Mbps) en débit montant et descendant. Donc, si vous avez une connexion haut débit de 10Mbits descendant et de 1Mbits montant, **vous risquez de commencer à manquer de bande passante si un cinquième joueur vous rejoint**, surtout si d'autres musiciens choisissent des paramètres qui augmentent leur utilisation. Vous devriez peut-être [vérifier que vous avez un débit suffisant](https://fast.com) pour cela. [En savoir plus sur l'utilisation de la bande passante](Network-Requirements) selon différents paramètres de qualité.

### En général

- Envisagez d'utiliser un hébergeur dans le nuage pour obtenir de meilleurs temps de réponse si vous avez des problèmes

- Tout serveur devrait avoir au minimum une fréquence de processeur d'1,6 GHz et 1 Go de RAM

- Administrer un serveur pourrait nécessiter que vous ajustiez tout pare-feu fonctionnant sur ou en dehors de votre machine ou de l'hôte dans le nuage.

- Administrer un **serveur privé à domicile** (mais pas un serveur public) nécessitera que vous [redirigiez un port](Running-a-Private-Server) sur votre routeur.

- Jamulus ne prend pas actuellement en charge IPv6

## Tout va bien ? Alors, c'est parti !
<div class="fx-row fx-row-start-xs button-container">
    <a href="Server-Win-Mac" class="button fx-col-100-xs">Pour les utilisateurs Windows ou macOS</a>
    <a href="Server-Linux" class="button fx-col-100-xs">Pour les utilisateurs Linux</a>
    <a href="Server-Rpi" class="button fx-col-100-xs">Raspberry Pi</a>
</div>

Les administrateurs de serveur pourraient également être intéressés par le téléchargement de [cet ensemble d'outils utiles](https://github.com/corrados/jamulus/tree/master/tools) depuis le dépôt Jamulus (cloner le dépôt Git avec la commande `git submodule update --init`).

## Vous avez des problèmes ? Des difficultés ?

Voir la [FAQ sur le dépannage des serveurs](Server-Troubleshooting).
