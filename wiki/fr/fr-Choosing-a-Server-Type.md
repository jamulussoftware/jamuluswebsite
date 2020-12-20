---
layout: wiki
title: "Choisir un type de serveur"
lang: "fr"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Types de serveur

Vous pouvez administrer votre serveur dans un de ces trois « modes » (soit à domicile, soit chez un hôte tiers) :

### 1. Public
Votre serveur sera listé dans la liste du [serveur central](Central-Servers) que les clients utilisent par défaut. Les musiciens pourront alors découvrir et se connecter à votre serveur. Il n'est pas forcément nécessaire de le faire fonctionner comme un serveur public puisque beaucoup d'autres personnes en administrent déjà. Il suffit de se connecter à un serveur à faible latence et de commencer à bœuffer.

![Serveur public](https://user-images.githubusercontent.com/9108457/100002427-d37da980-2dc4-11eb-9a22-ac575cf0d6bf.png)

Ce mode est activé en cochant l'option "Rendre mon serveur public" et (éventuellement) en saisissant les informations relatives à votre serveur

Quand vous utilisez un serveur sans <abbr="Interface utilisateur graphique">IUG</abbr>, la suite devrait permettre de configurer un serveur public :

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Note** : il n'est **pas** nécéssaire de faire de la redirection de port ou de configurer votre routeur pour administrer un serveur public.

Voir aussi les [options en ligne de commande](Command-Line-Options) pour d'autres paramètres que vous pouvez configurer.


### 2. Privé

Ce type de serveur ne sera pas listé sur un serveur central. Vous devez donner l'adresse de votre serveur aux musiciens pour qu'ils y connectent leurs clients. Voir [Administration d'un serveur privé](Running-a-Private-Server) pour savoir ce qu'il faut faire pour permettre à d'autres de s'y connecter.

![Serveur privé](https://user-images.githubusercontent.com/9108457/100002706-3a02c780-2dc5-11eb-8c7c-816e0cc02ed6.png)

Ce mode est activé en décochant l'option « Rendre mon serveur public ».

Lors d'une utilisation sans <abbr title="Interface utilisateur graphique">IUG</abbr>, la suite devrait permettre de configurer un serveur privé :

```shell
Jamulus --nogui --server
```

Voir aussi les [options en ligne de commande](Command-Line-Options) pour d'autres paramètres que vous pouvez configurer.

### 3. Central

La configuration de votre serveur en tant que serveur central ne doit être effectuée que dans des circonstances particulières (par exemple, pour des événements en ligne ou des associations musicales). La plupart des gens peuvent ignorer ce type.

Pour voir les serveurs listés sur un serveur central personnalisé, les musiciens doivent entrer l'adresse dans le champ « Serveur central personnalisé » des paramètres de leur client. Ils verront alors une liste générée par ce serveur central dans les paramètres de connexion.

Les administrateurs de serveurs normaux peuvent également s'inscrire sur votre serveur central personnalisé afin que leurs serveurs apparaissent dans votre liste de serveurs en paramétrant le vôtre avec l'option `--centralserver`.

Pour démarrer le serveur en tant que serveur central, il doit être configuré avec `--centralserver localhost` (c'est-à-dire, se spécifier comme le serveur central à interroger).

Si vous voulez contrôler les serveurs qui peuvent s'inscrire sur votre serveur central, vous pouvez activer une liste blanche avec l'option en ligne de commande `--listfilter`. Voir les [options en ligne de commande](Command-Line-Options) pour davantage d'informations sur cette fonctionnalité.

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les autres paramètres que vous pouvez configurer.
