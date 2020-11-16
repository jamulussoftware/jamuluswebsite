---
layout: wiki
title: "Serveur sous Windows and MacOS"
lang: "fr"
permalink: "/wiki/Server-Win-Mac"
---

# Serveur sous Windows and MacOS

**_Veuillez lire la documentation [Gestion d'un serveur](Running-a-Server) au préalable_**

* **Utilisateurs de Windows** - Démarrez le serveur en utilisant le raccourcis `Jamulus Server` du menu démarrer Windows. Il faut bien entendu avoir d'abord installé le logiciel en suivant [ces instructions](Installation-for-Windows).  
Si un message vous demande d'autoriser les communications entrantes pour l'application, validez. Il vous faudra probablement avoir les droits administrateur sur la machine pour pouvoir le faire.

* **Utilisateurs de MacOS** - Double-cliquez sur l'icône `Jamulus server` dans le répertoire `Applications` (nous partons du principe que vous avez installé Jamulus en suivant [ces instructions](Installation-for-Macintosh)).
Si un message vous demande d'autoriser les communications entrantes pour Jamulus, acceptez la demande.

* **Utilisateurs de Linux** - Suivez ces [instructions](Server-Linux#running-a-server-with-the-gui).

<img width="627" alt="server-setup" src="https://user-images.githubusercontent.com/4561747/87871031-19ed7280-c9a5-11ea-9104-6234a227ed62.png">

_Veuillez vous référer à [Choix du type de serveur](Choosing-a-Server-Type) avant de poursuivre._

### Configuration en mode serveur public

1. Cochez l'option "_Rendre mon serveur public_"

1. Séléctionnez le serveur en fonction du genre musical soouhaitez dans la liste déroulante. Le serveur par défaut est plein. Vous devriez voir le message "_Inscrit_" en vert confirmant que votre serveur à été référencé avec succès. Dans le cas contraire le message est affiché en rouge. 
_(voir cette note importante à propos des [serveurs centraux](Central-Servers)_)

1. Renseignez le nom du serveur, sa localisation géographique (ville et pays) ainsi les gens pourront l'identifier facilement. Renseignez aussi le message de bienvenue à afficher lors de la connexion si vous souhaitez compléter les informations.  
_Le message est affiché dans la fenêtre du Chat qui s'ouvre alors automatiquement lors de la connexion d'un nouvel utilisateur._

### Configuration en mode serveur privé

Si vous ne cochez pas l'option "_Rendre mon serveur public_", le serveur fonctionne alors en mode privé.
Vous devriez probablement lire [ces instructions](Running-a-Private-Server), en particulier concernant la redirection de port sur votre routeur.

_Si vous **exécutez le client sur la même machine** vous devez **connecter le client à l'adresse `127.0.0.1`** pour de meilleures performances. (De même que si le client est sur une autre machine de votre réseau local, utilisez alors l'adresse IP de la machine executant le serveur sur votre réseau)._

### Enregistrement

Activez l'enregistrement du serveur en définissant d'abord le répertoire d'enregistrement dans l'onglet Options. L'enregistrement commence dès que la première personne se connecte au serveur et s'arrête lorsque la dernière personne le quitte. Utilisez le bouton "_Nouvel enregistrement_" pour créer un nouveau sous-répertoire dans lequel les enregistrements seront stockés. Notez que les enregistrements sont par piste au format [Audacity](https://www.audacityteam.org/) `.lof` et [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Ouvrez les fichiers respectifs pour les écouter dans ces applications.

_Remarque : lorsque votre serveur enregistre, les utilisateurs connectés voient un message indiquant que l'enregistrement est en cours dans leur client._

Pour les serveur sans GUI : vous pouvez contrôler les enregistrements en [suivant ces instructions](Server-Linux#contrôler-l-enregistrement).


### Autres options

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/95724775-accd3e80-0c6e-11eb-90ba-7131e9c15316.png">

**Utilisateurs Windows** - Si vous voulez que le serveur démarre automatiquement au démarrage du système, cochez l'option correspondante.

**Laissez le champs "Serveur central personnalisé" vide sauf si vous souhaitez vous connecter à un [serveur central privé](Choosing-a-Server-Type#3-serveur-central)**

***

Voyez aussi les [options de la ligne de commande](Command-Line-Options) pour les autres paramètres qui peuvent être ajustés.
