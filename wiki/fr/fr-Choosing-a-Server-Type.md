---
layout: wiki
title: "Choisir le type de serveur"
lang: "fr"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Les types de serveur

Commencez d'abord par vous (re)poser la (les) question(s), **ai-je vraiment besoin de mon propre serveur, et si oui pourquoi faire ?**

Le serveur peut être configuré dans trois modes, que le serveur soit à domicile ou chez un fournisseur de service (_cloud_, serveur dédié…). Les réponses au « _pourquoi ?_ » ci-dessous vont vous aider à choisir :
1. Le concept de Jamulus est génial ! J'ai la bande passante ou déjà un serveur dans le _cloud_ ou un serveur dédié et je veux moi aussi contribuer et agrandir l'offre de serveurs publics disponibles avec une faible latence dans ma région.
2. Le concept de Jamulus est génial ! Mais… pour ma formation, c'est génant de parfois être dérangé ou écouté par d'autres sur les serveurs publics.
3. Vous êtes une organisation (école, conservatoire… ) et voulez y réferencer plusieurs serveurs par groupe, genre ou classe administrés par votre organisation, vos professeurs ou encore vos élèves.

### 1. Serveur public
Votre serveur devra être répértorié dans la liste des [serveurs centraux](Central-Servers) que les clients utilisent par défaut. Vous devrez le référencer sur le serveur central de votre genre musical de prédiléction. Les musiciens et musiciennes pourront alors le découvrir et s'y connecter. Il n'est pas forcément nécessaire de fonctionner comme un serveur public puisque de nombreuses autres personnes en proposent déjà. Il suffit en général de se connecter à un serveur à faible latence et de commencer à jouer !

![PublicServer](https://user-images.githubusercontent.com/4561747/79310856-7e0b2100-7ef4-11ea-9511-b2e3339cab6f.png)

Ce mode est activé en cochant l'option "_Rendre mon serveur public_" en lançant le serveur depuis l'interface graphuique (GUI).

Pour un serveur sans interface graphique ("_headless server_"), les options suivantes à passer à la ligne de commande permettent de configurer un serveur public :

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

_**Note** : Il n'est **pas nécessaire** de faire une redirection de port ou de configurer votre routeur pour faire fonctionner un serveur public.
Sous MacOS ou Windows, à la première utilisation, le système (le pare-feu ou firewall) demandera certainement d'autoriser les connexions entrantes pour l'application Jamulus, il faudra les autoriser !_

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.

#### Le serveur doit il être actif en permanence ?
Tout dépend de la réponse à la question « _pourquoi ?_ » : 
* Si le but est de **proposer un serveur public à la comunauté**, probablement que **oui**, et vous ferez certainement tourner un serveur sans GUI ("_headless_") sur une machine dédiée et allumée en permanence.
* Si le but est de **retrouver vos ami·e·s le temps d'une répétion ou d'une session d'improvisation** et que vous ne savez pas comment rediriger le port ou configurer votre routeur ou _box internet_ pour faire tourner le serveur en mode privé la réponse est **non**.
Vous pouvez lancer le serveur via la _GUI_ le temps de la session juste avant l'heure de rendez vous.
Dans ce cas utilisez un nom explicite et précisez dans le message d'accueil à l'attention des inconnu·e·s que le serveur ne sera actif que le temps de la répétition ou la session et qu'il est actif pour les besoins de votre formation. Ainsi les gens sauront que ce serveur est destiné à un événement précis et ne viendrons probablement pas vous y déranger.


### 2. Serveur Privé

Ce type de serveur ne sera pas listé sur un des serveurs centraux. Vous devez donner aux musicien·ne·s l'adresse (l'IP publique ou le nom de domaine associé à l'IP publique) de votre serveur pour qu'ils puissent s'y connecter avec leurs _clients_. Consultez la section [Gestion d'un serveur privé](Running-a-Private-Server) pour savoir ce qu'il faut faire pour permettre à d'autres personnes de s'y connecter.

![PrivateServer](https://user-images.githubusercontent.com/4561747/79310944-9f6c0d00-7ef4-11ea-9d8a-ecb0e668c22d.png)

Ce mode est désactivé en décochant l'option "_Rendre mon serveur public_" si le serveur est lancé avec l'interface graphique (GUI).

Pour un serveur sans interface graphique ("_headless server_"), les options suivantes à passer à la ligne de commande permettent de configurer un serveur privé (il suffit de ne pas spécifier le serveur central) :

```shell
Jamulus --nogui --server
```

Voir aussi [les options en ligne de commande](Command-Line-Options) pour les paramètres qui peuvent être ajustés.

### 3. Serveur central
**La majorité des adminsitrateurs de serveur peut ignorer ce type de serveur.**{: .red }

La configuration de votre serveur en tant que serveur central n'est nécéssaire que dans des circonstances particulières (par exemple, pour des événements en ligne ou des associations musicales ou une des raisons évoquées au début de ce document).

Pour consulter les serveurs répertoriés sur un serveur central personnalisé, les musiciens ou musiciennes doivent entrer l'adresse dans le champ "_Serveur central personnalisé_" des paramètres de leur _client_.  Ils ou elles verront alors la liste des serveurs répértoriés sur ce serveur central dans la fenêtre des paramètres de connexion.

Les adminstrateurs de serveurs "_normaux_" devront configurer leur serveur comme un serveur public et utiliser l'adresse de votre serveur central afin que leur serveur apparaisse dans votre liste de serveurs avec l'option `--centralserver custom.centralserveur.example:port` où `custom.centralserveur.example` est le nom de domaine ou l'IP pubique de votre serveur et `port` le port d'écoute si ce n'est pas le port par défaut.

Pour démarrer le serveur comme un serveur central il faut passer l'option `--centralserver localhost` à la ligne de commande (c'est-à-dire se spécifier comme le serveur central à interroger).

Si vous voulez filtrer la liste des serveurs autorisés à se référencer sur votre serveur central il faut utiliser l'option `--listfilter` de la ligne de commande et y lister les IP des serveurs autorisés.

Voir [les options en ligne de commande](Command-Line-Options) pour de plus amples informations sur cette fonctionnalité ainsi que tous les autres paramètres qui peuvent être ajustés.
