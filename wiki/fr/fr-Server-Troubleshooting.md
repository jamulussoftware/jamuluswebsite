---
layout: wiki
title: "Dépannage d'un serveur"
lang: "fr"
permalink: "/wiki/Server-Troubleshooting"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Running a Server" branch1-url="Running-a-Server" %}

## Dépannage

## Serveurs - Public

### Pourquoi mon serveur n'apparaît-il pas dans la liste ? Pourquoi ne s'enregistre-t-il pas ?

Si vous êtes enregistré correctement (vous pouvez le voir [ici](https://explorer.jamulus.io/)) et que vous ou vos amis ne voyez pas votre serveur, vous pouvez attendre, ou démarrer votre client avec l'option `--showallservers` et essayer de vous connecter à partir de là ([voir cette page](Command-Line-Options) sur la façon de démarrer votre client avec une option de configuration).

Si vous voyez un message indiquant que le serveur est plein, veuillez [voir cette note](Directory-Servers) sur les serveurs annuaire.

Vous pouvez vérifier que votre serveur est répertorié dans le genre approprié en [vérifiant ici](https://explorer.jamulus.io/).

## Serveurs - Privé

### Je fais tourner mon client sur la même machine/le même réseau que mon serveur, mais je n'arrive pas à m'y connecter.

Connectez votre client à `127.0.0.1` (ou `localhost` si cela fonctionne pour vous). Si vous exécutez le client sur une machine différente de celle du serveur, mais sur le même réseau, connectez-vous à l'adresse _local network_ du serveur. Ne vous connectez pas via l'adresse publique (WAN) du serveur.

### Quelle adresse dois-je donner aux gens pour qu'ils puissent se connecter à mon serveur ?

Il doit s'agir de votre adresse IP **publique** (vous pouvez la trouver avec [Google](https://www.google.com/search?q=whatsmyip)). Connectez votre **propre** client Jamulus à l'adresse IP **locale** de votre serveur (127.0.0.1 s'il se trouve sur la même machine que votre client). Notez que votre adresse IP publique peut changer - voir la note sur le "DNS dynamique" dans [ce guide](Running-a-Private-Server).

### Quels numéros de port puis-je utiliser ?

Conservez les ports UDP par défaut. Le port par défaut est documenté par la [ligne de commande](Command-Line-Options). Au moment de la rédaction de cette documentation, le numéro de port est **22124**.

### Un serveur privé est-il un serveur direct sans contact avec le Jamulus Directory Server ?

Oui. Veuillez consulter la section [Types de serveur](Choosing-a-Server-Type).

### Puis-je convertir mon serveur privé en serveur public ?

Oui. Il suffit de cocher la case "Rendre mon serveur public" dans la fenêtre du serveur et de remplir les détails. Si vous enregistrez votre serveur, n'utilisez pas la redirection de port car cela pourrait empêcher d'autres personnes d'utiliser votre serveur.

### **_Headless Linux_** : J'ai créé un serveur mais il rejoint le serveur annuaire et je ne le souhaite pas.

Pour activer un serveur privé, n'utilisez pas l'option `--centralserver` (`-e`) lors du lancement de la ligne de commande de votre serveur.

### Personne ne peut se connecter à mon serveur - mais je peux me connecter localement

Certains fournisseurs d'accès utilisent des techniques comme [Address plus Port (A+P)] (https://en.wikipedia.org/wiki/Address_plus_Port) ou [Carrier-grade NAT (CGN)] (https://en.wikipedia.org/wiki/Carrier-grade_NAT) pour conserver l'espace d'adressage. Il est donc impossible d'héberger des services tels que Jamulus chez soi (ce qui peut également signifier que vous ne pouvez pas voir les listes de serveurs dans votre client, ou qu'il vous manque [certains serveurs spécifiques] (https://sourceforge.net/p/llcon/discussion/server/thread/f72b293af0/)).

Pour détecter si le CGN est le problème, allez à l'écran de configuration de votre routeur (généralement, 192.168.X.X) et regardez la page WAN Status. Si votre adresse IPv4 répertoriée ne correspond pas à l'adresse que vous voyez [ici] (https://ifconfig.me), cela signifie que le CGN est peut-être activé. Ou si vous rencontrez des problèmes tels que l'impossibilité de [se connecter à des serveurs ou une liste de serveurs vide] (https://sourceforge.net/p/llcon/discussion/533517/thread/b3eea395c4/), cela peut également indiquer que votre fournisseur d'accès Internet est également à l'origine du problème.

Pour résoudre le problème : si vous utilisez un serveur public, essayez la [redirection de port](Running-a-Private-Server#port-forwarding). Si vous utilisez un serveur privé et que vous faites déjà une redirection de port, contactez le support de votre FAI et demandez-lui de vous retirer du CGN et de vous attribuer une véritable adresse IP WAN parce que vous voulez héberger un serveur. Si le CGN n'est pas le problème, vous devrez peut-être demander à votre FAI de vous donner une adresse IP WAN (ou une adresse fixe pour éviter d'utiliser le DDNS, si possible). Si tout le reste échoue, envisagez l'hébergement sur une plateforme en nuage (certains fournisseurs proposent des périodes d'essai gratuites).
