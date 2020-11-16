---
layout: wiki
title: "Administrer un serveur privé"
lang: "fr"
permalink: "/wiki/Running-a-Private-Server"
---

# Administrer un serveur privé

**_Veuillez vous assurer que vous avez bien lu le document [Gestion d'un serveur](Running-a-Server)_** 

Ce guide suppose que vous utiliserez un serveur privé sur votre réseau domestique, mais certaines des questions soulevées ici peuvent également s'appliquer à ceux qui fonctionnent sur des _serveurs cloud_ (par exemple Amazon EC2). 

Il est fortement recommandé de tester votre serveur en **mode public d'abord** afin de limiter les problèmes ultérieurs en mode privé.

## Administration d'un serveur privé derrière un routeur de réseau domestique
### Redirection de port
Pour faire fonctionner un serveur privé, vous devez configurer la redirection de port sur votre routeur.  
_(Si vous êtes curieux de savoir pourquoi vous devez faire cela pour les serveurs privés mais pas pour les serveurs publics, voir cette [note de bas de page](#noted-pour-les-geeks))_.

Normalement, les personnes extérieures à votre réseau domestique ne peuvent pas voir les choses à l'intérieur de celui-ci. Donc si vous voulez faire fonctionner un serveur Jamulus chez vous, vous devez ouvrir un port et rediriger les requêtes vers l'ip de la machine executant le serveur dans les options de configuration de votre routeur pour permettre aux clients Jamulus de s'y connecter. 

**Le port par défaut de la version actuelle de Jamulus est le port UDP (_pas TCP !_) 22124.**

La configuration exacte de la redirection de port diffère pour chaque routeur. Voici un exemple de paramètres de redirection de port dans un routeur Linksys :

![Linksysportforwarding](https://user-images.githubusercontent.com/4561747/97542495-bc62bc00-19be-11eb-8e54-b6e906e676f6.jpg)

_Pour plus d'informations : [portforward.com](https://portforward.com) (en anglais)._

_Pour les abonnés Free avec une Freebox Révolution, vous pouvez consulter ce [blog](https://www.cartelectronic.fr/blog/?p=2167).  
Pour les abonnés Orange, la procédure pour la Livebox 4 est [ici](https://assistance.orange.fr/livebox-modem/toutes-les-livebox-et-modems/installer-et-utiliser/piloter-et-parametrer-votre-materiel/le-parametrage-avance-reseau-nat-pat-ip/configurer-des-regles-nat-pat/livebox-4-configurer-pour-utiliser-un-jeu-ou-une-application-serveur_189538-735102)._

Une fois votre routeur configuré, vous pouvez obtenir votre adresse IP externe (WAN), par exemple en utilisant [Google](https://www.google.com/search?q=what+is+my+ip). Donnez cette adresse à vos amis pour qu'ils puissent se connecter à votre serveur (_mais voir aussi la note sur le DNS dynamique ci-dessous_. Vous devez plutôt vous connecter à **votre propre ordinateur**, puisque c'est votre ordinateur qui fait tourner le serveur. Il vous suffit donc de vous connecter à l'adresse `127.0.0.1` si le client est sur la même machine ou à l'ip de la machine sur le réseau local si le client est sur une autre machine du réseau.

### Points importants

* Vous n'avez pas besoin d'ouvrir une plage de ports comme dans l'image ci-dessus tant que vous ne souhaitez démarrer qu'une seule instance du serveur Jamulus sur la même machine.

* Si vous utilisez un port différent du port par défaut (22124), vous devez entrer le numéro de port après le nom du serveur ou l'adresse IP séparés par deux points dans le client Jamulus (par exemple jamulus.dyndns.org:22120).

* Vous pouvez aussi voir cet excellent [guide de gestion d'un serveur privé](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) sur Facebook (en anglais).  

## Le DNS dynamique et pourquoi vous en aurez probablement besoin

La plupart des connexions Internet domestiques peuvent changer d'adresse IP après un certain temps (heures, jours ou semaines). Pour faciliter la connexion, vous pouvez donc également mettre en place un nom de domaine DNS dynamique. Vous pouvez le faire sur [la machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) sur laquelle vous faites tourner le serveur Jamulus, ou de préférence sur votre routeur [qui peut le prendre en charge](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Notez aussi que votre routeur domestique peut également changer l'adresse IP de la machine sur laquelle vous faites tourner votre serveur. Dans ce cas, vous devrez soit donner à cette machine une adresse IP statique dans la configuration DHCP du routeur, soit simplement faire un transfert de port vers toutes les adresses de votre réseau local, ou encore configurer la machine avec un IP statique sans utiliser le DHCP du routeur.

## IP fixe et nom de domaine
Si vous êtes assuré par votre fournisseur d'accès d'avoir une IPv4 Fixe qui ne change pas, et que par ailleurs vous avez un nom de domaine, vous pouvez associer un nom à votre domaine dans la configuration DNS de votre fournisseur ou votre propre serveur DNS faisant autorité pour la zone concernant ce domaine.

## Notes pour les geeks

L'une des nombreuses caractéristiques de Jamulus qui le rendent orgasmique est le fait que vous pouvez installer un serveur en quelques secondes. Mais pourquoi les serveurs publics n'ont-ils pas besoin d'une redirection de port pour ça ?

Normalement, les pare-feu de traduction d'adresse réseau (NAT) bloquent les requêtes entrantes initiées depuis l'extérieur du réseau local. Le trafic entrant n'est possible que pour les paquets _reliés à une demande sortante_ (à proprement parler, les paquets "liés" et "établis" à une connexion sortante initiale). En mode public, lorsque votre serveur Jamulus se connecte à un serveur central, il initie bien sûr une connexion sortante. À partir de ce moment, le serveur central envoie des "pings" de connexion (établis/liés) (pas des pings ICMP) à votre serveur à intervalles réguliers pour maintenir le(s) port(s) NAT pertinent(s) ouvert(s) sur votre routeur/pare-feu.

Cependant, en mode privé, les clients doivent _initier_ des connexions au réseau du serveur. Les pare-feu NAT les bloquent, il faut donc les configurer pour autoriser les requêtes de connexion entrantes sur le port Jamulus en utilisant la redirection de port. 



