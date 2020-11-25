---
layout: wiki
title: "Choisir le type de serveur"
lang: "fr"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Les types de serveur

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

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.


### 2. Serveur Privé

Ce type de serveur ne sera pas listé sur un des serveurs centraux. Vous devez donner aux musiciens l'adresse (l'IP publique ou le nom de domaine associé à l'IP publique) de votre serveur pour qu'ils puissent s'y connecter avec leurs _clients_. Consultez la section [Administration d'un serveur privé](Running-a-Private-Server) pour savoir ce qu'il faut faire pour permettre à d'autres personnes de s'y connecter.

![Schéma de fonctionnement d'un serveur privé](https://user-images.githubusercontent.com/9108457/100002706-3a02c780-2dc5-11eb-8c7c-816e0cc02ed6.png)

Ce mode est désactivé en décochant l'option « _Rendre mon serveur public_ » si le serveur est lancé avec l'interface graphique (GUI).

Pour un serveur sans interface graphique (« _headless server_ »), les options suivantes à passer à la ligne de commande permettent de configurer un serveur privé (il suffit de ne pas spécifier le serveur central) :

```shell
Jamulus --nogui --server
```

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.

### 3. Serveur central

La configuration de votre serveur en tant que serveur central n'est nécéssaire que dans des circonstances particulières (par exemple, pour des événements en ligne ou des associations musicales.

Pour consulter les serveurs répertoriés sur un serveur central personnalisé, les musiciens ou musiciennes doivent entrer l'adresse dans le champ "_Serveur central personnalisé_" des paramètres de leur _client_.  Ils ou elles verront alors la liste des serveurs référencés sur ce serveur central dans la fenêtre des paramètres de connexion.

Les administrateurs de serveurs « _normaux_ » devront configurer leur serveur comme un serveur public et utiliser l'adresse de votre serveur central afin que leur serveur apparaisse dans votre liste de serveurs avec l'option `--centralserver custom.centralserveur.example:port` où `custom.centralserveur.example` est le nom de domaine ou l'IP publique de votre serveur et `port` le port d'écoute si ce n'est pas le port par défaut.

Pour démarrer le serveur comme un serveur central il faut passer l'option `--centralserver localhost` à la ligne de commande (c'est-à-dire se spécifier comme le serveur central à interroger).

Si vous voulez filtrer la liste des serveurs autorisés à se référencer sur votre serveur central il faut utiliser l'option `--listfilter` de la ligne de commande et y lister les IP des serveurs autorisés.

Voir [les options en ligne de commande](Command-Line-Options) pour de plus amples informations sur cette fonctionnalité ainsi que tous les autres paramètres qui peuvent être ajustés.
