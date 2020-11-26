---
layout: wiki
title: "Serveur sous Windows and MacOS"
lang: "fr"
permalink: "/wiki/Server-Win-Mac"
---

# Serveur sous Windows and MacOS
_(Note: les copies d'écran ont été faite avec l'interface en anglais, les termes utilisés par la suite dans ce document correspondent aux termes employés dans l'interface graphique du logiciel en français.)_

**_Veuillez lire la documentation [Administration d'un serveur](Running-a-Server) au préalable_**

* **Utilisateurs de Windows** : démarrez le serveur en utilisant le raccourcis `Jamulus Server` du menu démarrer Windows. Il faut bien entendu avoir d'abord installé le logiciel en suivant [ces instructions](Installation-for-Windows).  

* **Utilisateurs de MacOS** : double-cliquez sur l'icône `Jamulus server` dans le répertoire `Applications` (nous partons du principe que vous avez installé Jamulus en suivant [ces instructions](Installation-for-Macintosh)).

* **Utilisateurs de Linux** : Suivez ces [instructions](Server-Linux#serveur-avec-iug).

<img width="627" alt="configuration du serveur" src="https://user-images.githubusercontent.com/4561747/87871031-19ed7280-c9a5-11ea-9104-6234a227ed62.png">

### Configuration d'un serveur public

1. Cochez l'option « Rendre mon serveur public »

1. Séléctionnez le serveur en fonction du genre musical soouhaitez dans la liste déroulante. Le serveur par défaut est plein. Vous devriez voir un message confirmant que votre serveur à été référencé avec succès.

1. Renseignez le nom du serveur, la ville, le pays ainsi les gens pourront vous identifier facilement. 

1. Choisissez un genre musical si vous le désirez. Ceci fera apparaitre votre serveur dans la liste associée pour les clients. (voir ces [informations à propos des serveurs centraux](Central-Servers))  
  
_Le message de bienvenue est visible par tous les utilisateurs lorsqu'ils rejoignent le serveur. (La fenêtre de Tchate s'ouvrira alors automatiquement pour eux)._

### Configuration d'un serveur privé

Si vous ne cochez pas l'option « Rendre mon serveur public », le serveur fonctionnera alors en mode privé et vous devrez lire [ces instructions](Running-a-Private-Server).

_Si vous **exécutez le client sur la même machine** vous devez **connecter le client à l'adresse `127.0.0.1`** pour de meilleures performances. (De même que si le client est sur une autre machine de votre réseau local, utilisez alors l'adresse IP de la machine du serveur sur votre réseau)._

### Enregistrement

Activez l'enregistrement du serveur en définissant d'abord le répertoire d'enregistrement dans l'onglet Options. L'enregistrement commence dès que la première personne se connecte au serveur et s'arrête lorsque la dernière personne le quitte. Utilisez le bouton « Nouvel enregistrement » pour créer un nouveau sous-répertoire dans lequel les enregistrements seront enregistrés. Notez que les enregistrements sont sauvegardés par pistes au format [Audacity](https://www.audacityteam.org/) `.lof` et [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Ouvrez ces fichiers dans ces applications respectives pour les écouter.

_Remarque : lorsque votre serveur enregistre, les utilisateurs connectés voient un message indiquant que l'enregistrement est en cours dans leur client._

Pour les serveur sans <abbr title="Interface utilisateur graphique">IUG</abbr> : vous pouvez contrôler les enregistrements en [suivant ces instructions](Server-Linux#gestion-des-enregistrements).


### Autres options

<img width="549" alt="serveur Jamulus" src="https://user-images.githubusercontent.com/4561747/95724775-accd3e80-0c6e-11eb-90ba-7131e9c15316.png">

**Utilisateurs Windows** : Si vous voulez que le serveur démarre automatiquement au démarrage du système, cochez l'option correspondante.

(Laissez le champs « Serveur central personnalisé » vide sauf si vous souhaitez vous connecter à un [serveur central privé](Choosing-a-Server-Type#3-serveur-central))

***

Voyez aussi les [options de la ligne de commande](Command-Line-Options) pour les autres paramètres qui peuvent être configurées.
