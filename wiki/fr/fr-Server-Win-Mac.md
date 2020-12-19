---
layout: wiki
title: "Installation du serveur – Windows et macOS"
lang: "fr"
permalink: "/wiki/Server-Win-Mac"
---

# Installation sous Windows et macOS
_(Note: les copies d'écran ont été faite avec l'interface en anglais, les termes utilisés par la suite dans ce document correspondent aux termes employés dans l'interface graphique du logiciel en français.)_

**_Assurez-vous d'avoir lu la page d'[aperçu d'un serveur](Running-a-Server)_**

* **Utilisateurs de Windows** : démarrez le serveur en utilisant l'entrée « Jamulus Server » du menu démarrer de Windows.

* **Utilisateurs de macOS** : double-cliquez sur l'icône « Jamulus server » dans Applications (en supposant que vous y avez placé les fichiers de l'installation conformément conformément à [ces instructions](Installation-for-macOS)).

* **Utilisateurs de Linux** : veuillez vous référer aux [instructions serveur avec IUG](Server-Linux#running-a-server-with-the-gui).

<img width="627" alt="configuration du serveur" src="https://user-images.githubusercontent.com/4561747/87871031-19ed7280-c9a5-11ea-9104-6234a227ed62.png">

### Configuration d'un serveur public

1. En cochant l'option « Rendre mon serveur public », vous devriez voir un message de confirmation indiquant si votre serveur s'est inscrit avec succès.

1. Renseignez le nom, la ville et le pays, pour que les autres utilisateurs puissent vous identifier facilement.

1. Spécifiez un genre musical si vous le souhaitez. Votre serveur apparaitra alors dans la liste des serveurs pertinents pour les clients (voir davantage de [détails à propos des serveurs centraux](Central-Servers))
 
_Le message de bienvenue du tchate apparaît pour tous les utilisateurs lorsqu'ils rejoignent le serveur (la fenêtre de tchate s'ouvrira automatiquement pour eux)._

### Configuration d'un serveur privé

Si vous ne cochez pas « Rendre mon serveur public », vous obtiendrez un serveur privé et vous devrez [lire ces instructions](Running-a-Private-Server).

_Si vous souhaitez **exécuter un client sur la même machine**, vous devriez **connecter le client à l'adresse `127.0.0.1`** pour une meilleure performance. (De même, si vous souhaitez connecter un client sur une autre machine de votre réseau local, utilisez l'adresse IP du réseau local du serveur)._

### Enregistrement

Activez l'enregistrement du serveur en paramétrant d'abord le répertoire d'enregistrement dans l'onglet Options. L'enregistrement commence dès que la première personne se connecte au serveur et s'arrête lorsque la dernière personne le quitte. Utilisez le bouton « Nouvel enregistrement » pour créer un nouveau sous-répertoire dans lequel les enregistrements seront stockés. Notez que les enregistrements sont sauvegardés par piste au format `.lof` d'[Audacity](https://www.audacityteam.org/) (en anglais) et `.rpp` de [REAPER](https://fr.wikipedia.org/wiki/Reaper_(logiciel)). Ouvrez les fichiers respectifs pour les écouter dans ces applications.

_Note : lorsque votre serveur enregistre, les clients afficheront un message indiquant que l'enregistrement est en cours._

Pour les serveurs sans <abbr title="Interface utilisateur graphique">IUG</abbr> : vous pouvez contrôler la fonction d'enregistrement en [suivant ces instructions](Server-Linux#gestion-des-enregistrements).

### Autres options

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/95724775-accd3e80-0c6e-11eb-90ba-7131e9c15316.png">

**Utilisateurs Windows** : si vous souhaitez que le serveur se lance automatiquement au démarrage du système, cochez l'option correspondante.

(Laissez le champ « Adresse personnalisée du serveur central » vide, sauf si vous devez inscrire votre serveur sur un [serveur central privé](Choosing-a-Server-Type#3-serveur-central))

***

Consulter également les [options en ligne de commande](Command-Line-Options) pour d'autres paramètres que vous pouvez configurer.
