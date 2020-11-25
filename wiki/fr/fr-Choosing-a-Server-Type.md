---
layout: wiki
title: "Choisir le type de serveur"
lang: "fr"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Les types de serveur
<!-- Proposal for improvement see #45 -->
Commencez d'abord par vous (re)poser la (les) question(s), **ai-je vraiment besoin de mon propre serveur, et si oui pourquoi faire ?**

Le serveur peut être configuré dans trois modes, que le serveur soit à domicile ou chez un fournisseur de service (« _cloud_ », serveur dédié…). Les réponses au « _pourquoi ?_ » ci-dessous vont vous aider à choisir :
1. Le concept de Jamulus est génial ! J'ai la bande passante ou déjà un serveur dans le « _cloud_ » ou un serveur dédié et je veux moi aussi contribuer et agrandir l'offre de serveurs publics disponibles avec une faible latence dans ma région.
2. Le concept de Jamulus est génial ! Mais… pour ma formation, c'est gênant de parfois être dérangé ou écouté par d'autres sur les serveurs publics.
3. Vous êtes une organisation (école, conservatoire… ) et voulez y référencer plusieurs serveurs par groupe, genre ou classe administrés par votre organisation, vos professeurs ou encore vos élèves.
<!-- End of proposal -->

### 1. Serveur public
Votre serveur devra être référencé dans la liste des serveurs publics sur un des [serveurs centraux](Central-Servers) que les clients utilisent. Vous devrez le référencer sur le serveur central de votre genre musical de prédilection. Les musiciens et musiciennes pourront alors le découvrir et s'y connecter. Il n'est pas forcément nécessaire de fonctionner comme un serveur public puisque de nombreuses autres personnes en proposent déjà. Il suffit en général de se connecter à un serveur à faible latence et de commencer à jouer !

![Schéma de fonctionnement d'un serveur public](https://user-images.githubusercontent.com/9108457/100002427-d37da980-2dc4-11eb-9a22-ac575cf0d6bf.png)

Ce mode est activé en cochant l'option "_Rendre mon serveur public_" en lançant le serveur depuis l'interface graphuique (GUI).

Pour un serveur sans interface graphique ("_headless server_"), les options suivantes à passer à la ligne de commande permettent de configurer un serveur public :

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

<!-- Proposal for improvement -->
_**Note** : Il n'est **pas nécessaire** de faire une redirection de port ou de configurer votre routeur pour faire fonctionner un serveur public.
<!-- Proposal for improvement In relation to #50 -->
Sous MacOS ou Windows, à la première utilisation, le système (le pare-feu ou firewall) demandera certainement d'autoriser les connexions entrantes pour l'application Jamulus, il faudra les autoriser !
<!-- End of proposal -->

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.

<!-- Proposal for improvement In relation to #45 -->
#### Le serveur doit il être actif en permanence ?
Tout dépend de la réponse à la question « _pourquoi ?_ » :
* Si le but est de **proposer un serveur public à la comunauté**, probablement que **oui**, et vous ferez certainement tourner un serveur sans GUI ("_headless_") sur une machine dédiée et allumée en permanence.
* Si le but est de **retrouver vos amis le temps d'une séance de répétition ou d'improvisation** et que vous ne savez pas comment rediriger le port ou configurer votre routeur ou _box internet_ pour faire tourner le serveur en mode privé la réponse est **non**.
Vous pouvez lancer le serveur via la _GUI_ le temps de la session juste avant l'heure de rendez vous.
Dans ce cas utilisez un nom explicite et précisez dans le message d'accueil à l'attention des inconnu·e·s que le serveur ne sera actif que le temps de la répétition ou la session et qu'il est actif pour les besoins de votre formation. Ainsi les gens sauront que ce serveur est destiné à un événement précis et ne viendrons probablement pas vous y déranger.
<!-- End of proposal -->

### 2. Serveur Privé

Ce type de serveur ne sera pas listé sur un des serveurs centraux. Vous devez donner aux musiciens l'adresse (l'IP publique ou le nom de domaine associé à l'IP publique) de votre serveur pour qu'ils puissent s'y connecter avec leurs _clients_. Consultez la section [Gestion d'un serveur privé](Running-a-Private-Server) pour savoir ce qu'il faut faire pour permettre à d'autres personnes de s'y connecter.

![Schéma de fonctionnement d'un serveur privé](https://user-images.githubusercontent.com/9108457/100002706-3a02c780-2dc5-11eb-8c7c-816e0cc02ed6.png)

Ce mode est désactivé en décochant l'option « _Rendre mon serveur public_ » si le serveur est lancé avec l'interface graphique (GUI).

Pour un serveur sans interface graphique (« _headless server_ »), les options suivantes à passer à la ligne de commande permettent de configurer un serveur privé (il suffit de ne pas spécifier le serveur central) :

```shell
Jamulus --nogui --server
```

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.

### 3. Serveur central
**La majorité des administrateurs de serveur peut ignorer ce type de serveur.**

La configuration de votre serveur en tant que serveur central n'est nécéssaire que dans des circonstances particulières (par exemple, pour des événements en ligne ou des associations musicales ou une des raisons évoquées au début de ce document).

Pour consulter les serveurs répertoriés sur un serveur central personnalisé, les musiciens ou musiciennes doivent entrer l'adresse dans le champ "_Serveur central personnalisé_" des paramètres de leur _client_.  Ils ou elles verront alors la liste des serveurs référencés sur ce serveur central dans la fenêtre des paramètres de connexion.

Les administrateurs de serveurs « _normaux_ » devront configurer leur serveur comme un serveur public et utiliser l'adresse de votre serveur central afin que leur serveur apparaisse dans votre liste de serveurs avec l'option `--centralserver custom.centralserveur.example:port` où `custom.centralserveur.example` est le nom de domaine ou l'IP publique de votre serveur et `port` le port d'écoute si ce n'est pas le port par défaut.

Pour démarrer le serveur comme un serveur central il faut passer l'option `--centralserver localhost` à la ligne de commande (c'est-à-dire se spécifier comme le serveur central à interroger).

Si vous voulez filtrer la liste des serveurs autorisés à se référencer sur votre serveur central il faut utiliser l'option `--listfilter` de la ligne de commande et y lister les IP des serveurs autorisés.

Voir [les options en ligne de commande](Command-Line-Options) pour de plus amples informations sur cette fonctionnalité ainsi que tous les autres paramètres qui peuvent être ajustés.
