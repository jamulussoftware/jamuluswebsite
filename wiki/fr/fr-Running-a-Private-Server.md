---
layout: wiki
title: "Administrer un serveur privé"
lang: "fr"
permalink: "/wiki/Running-a-Private-Server"
---

# Administrer un serveur privé

**_Assurez-vous d'avoir lu [Administration d’un serveur](Running-a-Server)_** 

Ce guide suppose que vous utiliserez un serveur privé sur votre réseau domestique, mais certains des points évoqués ici pourraient également s'appliquer à ceux qui fonctionnent sur des hôtes dans le nuage (par exemple Amazon EC2). 

Il est fortement recommandé de tester votre serveur en **mode public d'abord** afin de limiter les éventuels problèmes ultérieurs en mode privé.

## Administration d'un serveur privé derrière un routeur de réseau domestique

### Redirection de port

Pour faire fonctionner un serveur privé, vous devez configurer la redirection de port sur votre routeur. _(Si vous êtes curieux de savoir pourquoi vous devez faire cela pour les serveurs privés mais pas pour les serveurs publics, voir [cette note de base de page](#notes-pour-les-geeks))_.

Normalement, les personnes extérieures à votre réseau domestique ne peuvent pas voir les choses à l'intérieur de celui-ci. Donc si vous voulez faire fonctionner un serveur Jamulus chez vous, vous devez ouvrir un trou dans votre routeur pour permettre aux clients Jamulus de s'y connecter.

**Le port par défaut de la version actuelle de Jamulus est le port UDP (et non TCP) 22124.**

La configuration exacte de la redirection de port diffère pour chaque routeur. Voici un exemple de paramètres de redirection de port dans un routeur Linksys :

![Linksysportforwarding](https://user-images.githubusercontent.com/4561747/97542495-bc62bc00-19be-11eb-8e54-b6e906e676f6.jpg)

Pour obtenir de l'aide, voir : [portforward.com](https://portforward.com) (en anglais).

Une fois votre routeur configuré, vous pouvez obtenir votre adresse IP externe (WAN), par exemple en [utilisant Google](https://www.google.com/search?q=what+is+my+ip). Donnez cette adresse à vos amis pour qu'ils puissent se connecter à votre serveur (_mais voir aussi la note sur le DNS dynamique ci-dessous_). Quant à vous, vous devez vous connecter à votre propre ordinateur à la place, puisque c'est votre ordinateur qui fait tourner le serveur. Par conséquent, **seulement vous** devez vous connecter à `127.0.0.1`.

### Points à noter

* Vous n'avez pas besoin d'ouvrir une plage de ports comme montré dans l'exemple ci-dessus tant que vous ne souhaitez démarrer qu'une seule instance du serveur Jamulus sur la même machine.

* Si vous utilisez un port différent du port par défaut (22124), vous devez entrer le numéro de port après le nom du serveur ou l'adresse IP, séparés par un double-point dans le client Jamulus (par exemple jamulus.dyndns.org:22120).

* Voir aussi cet excellent [guide pour la gestion d'un serveur privé](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) (en anglais) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook.  

## Le DNS dynamique et pourquoi vous en aurez probablement besoin

La plupart des connexions internet domestiques changent d'adresse IP après un certain temps (heures, jours ou semaines). Pour faciliter la connexion, vous pouvez donc également mettre en place une adresse DNS dynamique. Vous pouvez le faire sur [la machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) (en anglais) sur laquelle vous faites tourner le serveur Jamulus ou, de préférence, sur votre routeur [s'il le prend en charge](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/) (en anglais).

Notez aussi que votre routeur domestique peut également modifier l'adresse IP de la machine sur laquelle vous administrez votre serveur. Dans ce cas, vous pourriez devoir donner à cette machine une adresse IP statique dans la configuration DHCP du routeur, ou simplement faire un transfert de port vers toutes les adresses de votre réseau local (LAN).


## Notes de bas de page pour les geeks

L'une des nombreuses fonctionnalités de Jamulus qui le rendent orgasmiquement merveilleux est le fait que vous puissiez installer un serveur en quelques secondes. Mais pourquoi les serveurs publics n'ont-ils pas besoin d'une redirection de port pour cela ?

Normalement, les pare-feu de traduction d'adresse réseau (NAT) empêchent les requêtes entrantes initiées depuis l'extérieur du réseau local. Le trafic entrant n'est possible que pour les paquets _reliés à une demande sortante_ (à proprement parler, les paquets « liés » et « établis » à une connexion sortante initiale). En mode public, lorsque votre serveur Jamulus se connecte à un serveur central, il initie bien sûr une connexion sortante. À partir de ce moment, le serveur central envoie des « pings » de connexion (établis/liés) (pas des pings ICMP) à votre serveur à intervalles réguliers pour maintenir le(s) port(s) NAT pertinent(s) ouvert(s) sur votre routeur/pare-feu.

Toutefois, en mode privé, les clients doivent _initier_ des connexions dans le réseau du serveur. Les pare-feu NAT empêchent cela, et vous devez donc leur dire d'autoriser les requêtes de connexion entrantes sur le port Jamulus en utilisant la redirection de port. 
