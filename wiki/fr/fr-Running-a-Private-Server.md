---
lang: fr
layout: wiki
permalink: /wiki/Running-a-Private-Server
title: "Exécuter d'un serveur privé"
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Exécuter d'un serveur privé

**_Veuillez vous assurer que vous avez lu la page [Exécuter un serveur](Running-a-Server)_**

Ce guide part du principe que vous allez exécuter un serveur privé sur votre réseau domestique, mais certains des problèmes abordés ici peuvent également s'appliquer à ceux qui fonctionnent sur des hôtes en nuage (par exemple Amazon EC2).

Il est fortement recommandé de tester d'abord votre serveur en **mode public** afin de limiter les problèmes ultérieurs en mode privé.

## Exploitation d'un serveur privé derrière un routeur de réseau domestique

### Redirection de port

Pour faire fonctionner un serveur privé, vous devez configurer la redirection de port sur votre routeur. _(Si vous êtes curieux de savoir pourquoi vous devez faire cela pour les serveurs privés mais pas pour les serveurs publics, consultez [cette note de bas de page](#Note-de-bas-de-page-pour-les-geeks).)_

Normalement, les personnes extérieures à votre réseau domestique ne peuvent pas voir ce qui s'y trouve. Ainsi, si vous souhaitez faire fonctionner un serveur Jamulus chez vous, vous devez ouvrir une brèche dans votre routeur pour permettre aux clients Jamulus de s'y connecter.

**Le port par défaut de la version actuelle de Jamulus est le port UDP (et non TCP) 22124.**

La configuration exacte de la redirection de port diffère pour chaque routeur. Voici un exemple des paramètres de la redirection de port dans un routeur Linksys :

<figure><img src="{{site.url}}/assets/img/en-screenshots/linksys-port-forward.png" loading="lazy" alt="Image des paramètres de redirection de port d'un routeur Linksys"></figure>

Pour obtenir de l'aide, consultez [portforward.com](https://portforward.com).

Une fois que votre routeur est configuré, vous pouvez obtenir votre adresse IP externe (WAN), par exemple en [utilisant Google](https://www.google.com/search?q=what+is+my+ip). Donnez cette adresse à vos amis pour qu'ils puissent se connecter à votre serveur (_mais voir aussi la note sur le DNS dynamique ci-dessous_). Vous devez vous-même vous connecter à votre propre ordinateur à la place, puisque c'est votre ordinateur qui fait tourner le serveur. Donc **seulement vous** devez vous connecter à `127.0.0.1`.

### Points à noter

* Vous n'avez pas besoin d'ouvrir une plage de ports comme indiqué dans l'exemple ci-dessus tant que vous ne souhaitez démarrer qu'une seule instance du serveur Jamulus sur la même machine.

* Si vous utilisez un port différent du port par défaut (22124), vous devez entrer le numéro de port après le nom du serveur ou l'adresse IP, séparé par deux points dans le client Jamulus (par exemple, jamulus.example.org:22120).

* Voir également l'excellent [guide sur la gestion d'un serveur privé](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) de [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook.

## DNS dynamique et pourquoi vous en aurez probablement besoin

La plupart des connexions Internet domestiques changent d'adresse IP après un certain temps (heures, jours ou semaines). Pour que les gens puissent plus facilement se connecter à votre serveur, vous voudrez peut-être aussi configurer une adresse DNS dynamique. Vous pouvez le faire sur [la machine] (https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) sur laquelle vous exécutez le serveur Jamulus, ou de préférence sur votre routeur [qui peut le prendre en charge] (https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Notez également que votre routeur domestique peut également modifier l'adresse IP de la machine sur laquelle vous exécutez votre serveur. Dans ce cas, vous devrez soit donner à cette machine une adresse IP statique dans la configuration DHCP du routeur, soit simplement faire un transfert de port vers toutes les adresses de votre réseau local.

## Note de bas de page pour les geeks

L'une des nombreuses caractéristiques de Jamulus qui le rendent merveilleusement bien est le fait que vous pouvez configurer un serveur en quelques secondes. Mais pourquoi les serveurs publics n'ont-ils pas besoin de la redirection de port pour ce faire ?

Normalement, les pare-feu NAT (Network Address Translation) empêchent les requêtes entrantes provenant de l'extérieur du réseau local. Le trafic entrant n'est possible que pour les paquets _relatifs à une demande sortante_ (à proprement parler, les paquets "relatifs" et "établis" à une connexion sortante initiale). En mode public, lorsque votre serveur Jamulus se connecte à un serveur d'annuaire, il initie bien sûr une connexion sortante. À partir de ce moment-là, le serveur d'annuaire envoie des "pings" (pas des pings ICMP) de connexion (établie/liée) à votre serveur à intervalles réguliers pour maintenir le ou les ports NAT pertinents ouverts sur votre routeur/pare-feu.

Cependant, en mode privé, les clients doivent _initier_ les connexions au réseau du serveur. Les pare-feu NAT empêchent cela, vous devez donc leur dire d'autoriser les demandes de connexion entrantes sur le port Jamulus en utilisant la redirection de port.
