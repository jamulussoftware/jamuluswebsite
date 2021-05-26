---
lang: fr
layout: wiki
permalink: /wiki/Server-Win-Mac
title: "Installation d'un serveur - Windows et macOS"
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Installation pour Windows et macOS


**_Veuillez vous assurer que vous avez lu la page [Exécuter un serveur](Running-a-Server)_**

* **Utilisateurs de Windows** - Démarrez le serveur en utilisant l'entrée "Serveur Jamulus" dans le menu de démarrage de Windows.

* **Utilisateurs de macOS** - Double-cliquez sur l'icône "Serveur Jamulus" dans Applications (en supposant que vous y avez placé les fichiers de l'installation conformément à [ces instructions](Installation-for-Macintosh)).

* **Linux users** - Please refer to the [GUI server instructions](Server-Linux#running-a-server-with-the-gui).

<figure><img src="{{site.url}}/assets/img/fr-screenshots/server-window-setup.png" loading="lazy" alt="Image de la fenêtre de configuration du serveur Jamulus"></figure>

### Configuration du serveur public

1. En cochant "Rendre mon serveur public", vous devriez voir un message de confirmation indiquant si votre serveur a été enregistré avec succès.

1. Saisissez le nom, la ville et le pays afin que les autres utilisateurs puissent facilement vous identifier.

1. Spécifiez un genre musical. Cela fera apparaître votre serveur dans la liste des serveurs pertinents pour les clients (voir plus de [détails sur les serveurs annuaires](Directory-Servers)).

_Le message de bienvenue du chat apparaît à tous les utilisateurs lorsqu'ils rejoignent le serveur (la fenêtre de tchate s'ouvre automatiquement pour eux)._

### Configuration d'un serveur privé

Si vous ne cochez pas la case "Rendre mon serveur public", vous allez exécuter un serveur privé et vous devez [lire ces instructions](Running-a-Private-Server).

_Si vous voulez **exécuter un client sur la même machine**, vous devez **connecter le client à `127.0.0.1`** pour de meilleures performances. De même, si vous voulez connecter un client sur une autre machine de votre réseau local, utilisez l'adresse IP du réseau local du serveur)._


### Autres options

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/114275476-79e7e580-9a1a-11eb-8e6b-09d9f956c689.png">

### Enregistrement

Activez l'enregistrement du serveur en définissant d'abord le répertoire d'enregistrement dans l'onglet Options. L'enregistrement commence dès que la première personne se connecte au serveur et s'arrête lorsque la dernière personne quitte le serveur. Utilisez le bouton "New Recording" pour créer un nouveau sous-répertoire dans lequel les enregistrements seront stockés. Notez que les enregistrements sont par piste au format [Audacity](https://www.audacityteam.org/) `.lof` et [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Ouvrez les fichiers respectifs pour les écouter dans ces applications.

_Remarque : Lorsque votre serveur enregistre, les clients affichent un message indiquant que l'enregistrement est en cours._

Pour les serveurs sans tête : vous pouvez contrôler la fonction d'enregistrement [en utilisant ces instructions](Server-Linux#controlling-recordings).

### Retardement du panoramique

Cette option utilise les petites différences de temps d'arrivée du son entre les deux oreilles. Elle produit un effet stéréo similaire à l'audition humaine naturelle par rapport à un panoramique normal de "volume". Notez que pour obtenir cet effet, tous les clients doivent être réglés sur 'mono in / stereo out' (ou sur 'stereo', mais seulement s'ils transmettent un signal stéréo).

### Adresse du serveur central personnalisé


<figure><img src="{{site.url}}/assets/img/fr-screenshots/server-window-options.png" loading="lazy" alt="Image of Jamulus server window options"></figure>

Laissez ce champ vide à moins que vous n'ayez besoin d'inscrire votre serveur sur un [serveur annuaire privé](Choosing-a-Server-Type#3-central)).


**Utilisateurs de Windows** - Si vous voulez que le serveur démarre automatiquement au démarrage du système, activez la case à cocher correspondante.

(Laissez le champ "Custom Directory Server Address" vide, sauf si vous devez inscrire votre serveur sur un [serveur annuaire privé](Choosing-a-Server-Type#3-directory)).


***

Voir également [Options de la ligne de commande](Command-Line-Options) pour les autres paramètres que vous pouvez définir.
