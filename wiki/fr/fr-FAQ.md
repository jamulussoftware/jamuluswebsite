---
lang: fr
layout: wiki
permalink: /wiki/FAQ
title: FAQ
---

# FAQ Jamulus

Il s'agit d'un aperçu des questions les plus courantes. Pour les problèmes courants et leurs solutions, voir la page [Dépannage](/wiki/Client-Troubleshooting).


### Y a-t-il un métronome, une synchronisation ou un autre moyen de rester dans le temps ?

Non. Les musiciens sur un serveur Jamulus jouent simplement en temps réel ensemble comme ils le feraient en personne. Si vous souhaitez disposer d'un signal temporel, il existe des solutions de métronome partagé sur Internet que vous pouvez essayer, mais il est probablement préférable de minimiser la latence afin que personne n'ait un retard global supérieur à environ 30-50 ms.

### Comment puis-je savoir si je peux rejoindre un serveur ? Existe-t-il des règles ?

En général, si quelqu'un met en place un serveur public, alors [par définition](/wiki/Choosing-a-Server-Type) il accepte que tout le monde puisse y jouer. Jamulus n'a pas de protection par mot de passe ni d'autres mécanismes d'authentification. Cependant, certains serveurs peuvent indiquer leur politique dans le message de bienvenue que vous verrez dans la fenêtre de discussion.

Vous pouvez également créer un serveur privé sur Jamulus et donner aux autres votre adresse pour qu'ils s'y connectent. Consultez [cette page pour plus d'informations](/wiki/Running-a-Server).

### Pourquoi ne devrais-je pas utiliser un équipement sans fil ?

Votre capacité à jouer en rythme avec les autres musiciens dépend principalement de la latence (retard) de votre signal sonore. Si le retard global est supérieur à 50 ms, il est généralement trop difficile de jouer en rythme, sauf si vous vous entraînez à le faire. Certains musiciens affirment qu'ils peuvent jouer en rythme avec des retards allant jusqu'à 70 ms en jouant en avance sur le rythme. Mais au-delà, cela devient trop difficile, à moins que le synchronisme ne soit pas un facteur important dans la musique.

Il est donc logique de minimiser les sources de retard ou autres problèmes liés au signal. Même le wi-fi rapide est généralement trop variable pour être utilisé pendant de longues périodes avec Jamulus, et les casques et micros Bluetooth introduisent généralement des latences d'environ 50 ms ou plus.

### Pourquoi ne devrais-je pas écouter mon propre signal ?

Pour la même raison que vous devez minimiser le retard de votre signal afin de jouer en temps voulu, vous devez vous assurer que vous jouez sur votre propre son que les autres musiciens entendent. More information on this, and a way of testing your setup to make sure you are obeying this “Golden Rule” [can be found here](/wiki/Client-Troubleshooting#vous-avez-tous-un-son-correct-mais-il-est-difficile-de-jouer-ensemble).

Bien sûr, si vous jouez d'un instrument acoustique ou si vous êtes chanteur, il sera difficile d'exclure votre son "local". Mais vous devriez au moins essayer de le faire, par exemple en utilisant un casque fermé, réglé aussi fort que possible pour masquer votre propre son. Vous pourrez ainsi vous concentrer sur le mixage qui vous parvient du serveur.

### Ai-je besoin d'une connexion Internet rapide ?

Pour la plupart des gens, une connexion à large bande standard (par exemple, 10 Mbit/s en bas et 1 Mbit/s en haut) ne posera aucun problème. Pour ceux qui gèrent des serveurs à domicile, en fonction du nombre de participants, vous pouvez rencontrer des problèmes si votre bande passante en amont est inférieure à 5 Mbit/s environ. Plus d'informations sur les exigences du réseau [ici](/wiki/Network-Requirements).

### Dois-je faire tourner un serveur ?

Non. Si vous souhaitez simplement vous connecter aux serveurs d'autres personnes, tout ce dont vous avez besoin est un client. Lisez ceci si vous pensez avoir besoin de [faire tourner votre propre serveur](/wiki/Running-a-Server).

### Comment fonctionne Jamulus (en général) ?

<img src="{{site.url}}/assets/img/fr-screenshots/diagram-overview.png" loading="lazy" alt="Diagramme montrant le fonctionnement de Jamulus">


Jamulus fonctionne sur le principe client-serveur. L'audio de chaque musicien est envoyé à un serveur, où il est mixé et traité. Ensuite, l'audio est renvoyé à chaque client. Si un serveur est rendu public et enregistré sur un répertoire, ses informations seront diffusées à tous les clients.

### Pourquoi Jamulus ne fournit-il pas de support vidéo ?

L'ajout du support vidéo ajoute beaucoup de complexité. Vous pouvez utiliser d'autres logiciels comme Jitsi ou Zoom si vous souhaitez voir les autres lorsque vous jouez (ou avoir un "public"), mais la vidéo sera nettement en retard sur l'audio de Jamulus.
