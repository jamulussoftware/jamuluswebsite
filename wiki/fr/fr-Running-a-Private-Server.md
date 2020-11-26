---
layout: wiki
title: "Administrer un serveur privé"
lang: "fr"
permalink: "/wiki/Running-a-Private-Server"
---

# Administrer un serveur privé

**_Assurez vous d'avoir lu [Gestion d'un serveur](Running-a-Server)_** 

Ce guide suppose que vous utiliserez un serveur privé sur votre réseau domestique, mais certains des points évoqués ici peuvent également s'appliquer aux serveurs « cloud » (par exemple Amazon EC2). 

Il est fortement recommandé de tester votre serveur en **mode public d'abord** afin de limiter les problèmes ultérieurs en mode privé.

## Administration d'un serveur privé derrière un routeur domestique

### Redirection de port

Pour faire fonctionner un serveur privé, vous devez configurer la redirection de port sur votre routeur.  
_(Si vous êtes curieux de savoir pourquoi c'est nécéssaire pour les serveurs privés mais pas pour les serveurs publics, voir cette [note de bas de page](#notes-pour-les-geeks-et-les-curieux))_.

Normalement, les personnes extérieures à votre réseau domestique ne peuvent pas y accéder. Donc si vous voulez faire fonctionner un serveur Jamulus à domicile, vous devez ouvrir un port et le rediriger pour permettre aux clients Jamulus de s'y connecter. 

**Le port par défaut de la version actuelle de Jamulus est le port UDP (_pas TCP !_) 22124.**

La configuration exacte de la redirection de port diffère pour chaque routeur. Voici un exemple de paramètres de redirection de port dans un routeur Linksys :

![Linksysportforwarding](https://user-images.githubusercontent.com/4561747/97542495-bc62bc00-19be-11eb-8e54-b6e906e676f6.jpg)

_Pour plus d'informations : [portforward.com](https://portforward.com) (en anglais)._

Une fois votre routeur configuré, vous pouvez obtenir votre adresse IP publique, par exemple, en utilisant [Google](https://www.google.com/search?q=what+is+my+ip). Donnez cette adresse à vos amis pour qu'ils puissent se connecter à votre serveur (_voir aussi la note sur le DNS dynamique ci-dessous_). Vous devez plutôt vous connecter à votre propre ordinateur, puisque c'est votre ordinateur qui fait tourner le serveur. Il vous **suffit simplement** de vous connecter à l'adresse `127.0.0.1`.

### Points à noter

* Vous n'avez pas besoin d'ouvrir une plage de ports comme dans l'image ci-dessus tant que vous ne souhaitez démarrer qu'un seul serveur Jamulus sur la même machine.

* Si vous utilisez un port différent du port par défaut (22124), vous devez entrer le numéro de port après le nom du serveur ou l'adresse IP séparés par deux points dans le client Jamulus (par exemple jamulus.dyndns.org:22120).

* Vous pouvez aussi voir cet excellent [guide de gestion d'un serveur privé](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) (en anglais) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook.  

## Le DNS dynamique et pourquoi vous en aurez probablement besoin

La plupart des connexions Internet domestiques peuvent changer d'adresse IP après un certain temps (heures, jours ou semaines). Pour faciliter la connexion, vous pouvez donc également mettre en place un nom de domaine DNS dynamique. Vous pouvez le faire sur [la machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) sur laquelle vous faites tourner le serveur Jamulus ou, de préférence, sur votre routeur [si il le prend en charge](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Notez aussi que votre routeur domestique peut également modifier l'adresse IP de la machine sur laquelle vous faites tourner votre serveur. Dans ce cas, vous devrez soit donner à cette machine une adresse IP statique dans la configuration DHCP du routeur, soit simplement faire un transfert de port vers toutes les adresses de votre réseau local.

## Notes pour les geeks et les curieux

L'une des nombreuses caractéristiques de Jamulus qui le rendent orgasmique est le fait que vous pouvez installer un serveur en quelques secondes. Mais pourquoi les serveurs publics n'ont-ils pas besoin d'une redirection de port pour ça ?

Normalement, les pare-feu de traduction d'adresse réseau (NAT) bloquent les requêtes entrantes initiées depuis l'extérieur du réseau local. Le trafic entrant n'est possible que pour les paquets _reliés à une demande sortante_ (à proprement parler, les paquets « liés » et « établis » à une connexion sortante initiale). En mode public, lorsque votre serveur Jamulus se connecte à un serveur central, il initie bien sûr une connexion sortante. À partir de ce moment, le serveur central envoie des « pings » de connexion (établis/liés) (pas des pings ICMP) à votre serveur à intervalles réguliers pour maintenir le(s) port(s) NAT pertinent(s) ouvert(s) sur votre routeur/pare-feu.

En revanche, en mode privé, les clients doivent _initier_ des connexions au réseau du serveur. Les pare-feu NAT les bloquent, il faut donc les configurer pour autoriser les requêtes de connexion entrantes sur le port Jamulus en utilisant la redirection de port. 



