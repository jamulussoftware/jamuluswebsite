---
layout: wiki
title: "Dépannage serveur"
lang: "fr"
permalink: "/wiki/Server-Troubleshooting"
---

# Troubleshooting

## Serveurs - public

### Pourquoi mon serveur n'apparaît pas dans la liste ? Pourquoi n'y est-il pas inscrit ?

Si votre serveur est bien inscrit (vous pouvez [vérifier ici](http://jamulus.softins.co.uk/) - en anglais) et que vous ou vos amis ne pouvez pas voir votre serveur, vous pourriez avoir besoin d'attendre, ou démarrer votre client avec l'option `--showallservers` et essayer de vous connecter à partir de là ([voir cette page](Command-Line-Options) à propos de la façon de démarrer votre client avec une option de configuration).

Si vous voyez un message indiquant que le serveur est complet, veuillez [voir cette note](Central-Servers) à propos des serveurs centraux.

Vous pouvez vous assurez que votre serveur est listé dans le genre pertinent en [le vérifiant ici](http://jamulus.softins.co.uk/) (en anglais).

## Serveurs - privés

### J'exécute mon client sur la même machine/réseau que mon serveur, mais je ne peux pas m'y connecter

Connectez votre client à l'adresse `127.0.0.1` (ou `localhost` si cela fonctionne pour vous). Si vous utilisez le client sur une machine différente du serveur mais sur le même réseau, alors connectez-vous à l'adresse du serveur sur le _réseau local_. Ne vous connectez pas via l'adresse publique (WAN) du serveur.

### Quelle adresse dois-je communiquer aux personnes pour qu'elles puissent se connecter à mon serveur ?

Il doit s'agir de votre adresse IP **publique** (à trouver auprès de [Google](https://www.google.com/search?q=whatsmyip)). Connectez votre **propre** client Jamulus à l'adresse IP **locale** de votre serveur (127.0.0.1 s'il est sur la même machine que votre client). Notez que votre adresse IP publique peut changer : voir la note sur le « DNS dynamique » dans [ce guide](Running-a-Private-Server).

### Quels sont les numéros de port que je peux utiliser ?

Conservez les ports UDP par défaut. Le port par défaut réel est documenté dans les [options en ligne de commande](Command-Line-Options). Au moment de la rédaction de cette documentation, le numéro de port est **22124**.

### Un serveur privé est-il un serveur direct sans contact avec le serveur central Jamulus ?

Oui. Veuillez consulter [types de serveur](Choosing-a-Server-Type).

### Puis-je convertir mon serveur privé en serveur public ?

Oui, il suffit de cocher la case « Rendre mon serveur public » dans la fenêtre du serveur et de remplir les détails. Souvenez-vous que vous n'avez pas non plus besoin de faire une redirection de port si vous avez un serveur public.

### **_Serveur sans IUG sou Linux_** : j'ai créé un serveur mais il est en train de rejoindre le serveur central et je ne veux pas qu'il le fasse.

Pour activer un serveur privé, n'utilisez pas l'option `--centralserver` (`-e`) lorsque vous lancez la ligne de commande de votre serveur.

### Personne ne peut se connecter à mon serveur, mais je peux m'y connecter localement

Certains FAI utilisent des techniques telles que « [Address plus Port (A+P)](https://en.wikipedia.org/wiki/Address_plus_Port) » (en anglais) ou [NAT de classe transporteur (CGN)](https://fr.wikipedia.org/wiki/Carrier-grade_NAT) pour conserver l'espace d'adressage. Cela rend impossible l'hébergement de services comme Jamulus à domicile (et peut provoquer le fait que vous ne puissiez pas non plus voir les listes de serveurs sur votre client, ou qu'il vous manque [certains serveurs spécifiques](https://sourceforge.net/p/llcon/discussion/server/thread/f72b293af0/) (en anglais)).

Pour détecter si le CGN est en cause, aller à l'écran de configuration de votre routeur (typiquement, 192.168.X.X) et regardez la page d'état du WAN. Si l'adresse IPv4 listée ne correspond pas à l'adresse que vous voyez [ici](https://ifconfig.me), alors cela signifie que le CGN pourrait être activé. Ou si vous rencontrez des problèmes tels que l'impossibilité de [se connecter à des serveurs ou une liste de serveurs vide](https://sourceforge.net/p/llcon/discussion/533517/thread/b3eea395c4/) (en anglais), cela pourrait également être un indicateur que votre FAI est également à l'origine du problème.

Pour résoudre le problème : si vous utilisez un serveur public, essayez [la redirection de port](Running-a-Private-Server#redirection-de-port). Si vous utilisez un serveur privé et que vous faites déjà de la redirection de port, contactez le support de votre FAI et demandez leur de vous retirer du CGN et de vous attribuer une véritable adresse IP WAN en expliquant que vous voulez héberger un serveur. Si le CGN n'est pas la cause du problème, vous devrez peut-être demander à votre FAI de vous donner une adresse IP WAN (ou une fixe pour éviter d'utiliser DDNS, si possible). Si tout le reste échoue, envisager l'hébergement sur une plate-forme dans le nuage (certains fournisseurs proposent des périodes d'essai gratuites).
