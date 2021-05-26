---
lang: fr
layout: wiki
permalink: /wiki/Choosing-a-Server-Type
title: 'Choisir un type de serveur'
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Types de Serveurs

Vous pouvez faire fonctionner votre serveur dans l'un des trois "modes" suivants (soit chez vous, soit sur un hôte tiers) :

### 1. Public

Votre serveur sera répertorié dans la liste [serveurs annuaire](Directory-Servers) que les clients utilisent par défaut. Les musiciens peuvent alors le découvrir et s'y connecter. Il n'est pas nécessaire de fonctionner en tant que serveur public puisque de nombreuses autres personnes en utilisent déjà. Il suffit de se connecter à un serveur à faible latence et de commencer à jouer.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/diagram-public-server.png" loading="lazy" alt="Diagramme des connexions entre clients au sein d'un serveur public Jamulus"></figure>

Ce mode est activé en cochant la case "Rendre mon serveur public..." et en saisissant (facultativement) les informations relatives à votre serveur.

Lors de l'exécution sans l'interface graphique ("headless"), la procédure suivante configurerait un serveur public :

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

Il n'est **pas** nécessaire de faire une redirection de port ou de configurer votre routeur pour qu'il exécute un serveur public.

Voir également [Options de la ligne de commande](Command-Line-Options) pour les autres paramètres que vous pouvez définir.


### 2. Privé

Ce type de serveur ne sera pas répertorié dans une liste de serveurs. Vous devez donner aux musiciens l'adresse de votre serveur pour qu'ils puissent y connecter leurs clients. Voir [Gestion d'un serveur privé](Running-a-Private-Server) pour savoir ce qu'il faut faire pour permettre aux autres de s'y connecter.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/diagram-private-server.png" loading="lazy" alt="Diagramme des connexions entre clients au sein d'un serveur privé Jamulus"></figure>

Ce mode est activé en décochant la case "Rendre mon serveur public...".

Lorsqu'il est exécuté sans l'interface graphique ("headless"), ce qui suit configurerait un serveur privé :

```shell Jamulus --nogui --server ```

Voir également [Options de la ligne de commande](Command-Line-Options) pour les autres paramètres que vous pouvez définir.

### 3. Serveur annuaire

La configuration de votre serveur en tant que serveur annuaire ne doit être effectuée que dans des circonstances particulières (par exemple, pour des événements en ligne ou des associations musicales). La plupart des gens peuvent ignorer ce type.

Pour afficher les serveurs répertoriés par un serveur d'annuaire personnalisé, les musiciens doivent saisir l'adresse dans le champ de paramètres "Adresse personnalisée du serveur annuaire" de leur client. Ils verront alors une liste de configuration de connexion générée par ce serveur d'annuaire.

Les opérateurs de serveurs normaux peuvent également s'inscrire auprès de votre serveur d'annuaire personnalisé afin que leurs serveurs apparaissent dans votre liste de serveurs en définissant le votre comme option `--centralserver`. i

Pour faire fonctionner un serveur en tant que serveur central, il doit être configuré avec `--centralserver localhost` (c'est-à-dire qu'il doit se spécifier comme le serveur d'annuaire à interroger).

#### Points de configuration à noter

Si vous voulez contrôler quels serveurs peuvent s'enregistrer grâce à votre serveur central, vous pouvez activer une liste blanche avec l'option de ligne de commande `--listfilter`. Consultez la page [Options de la ligne de commande](Command-Line-Options) pour plus d'informations sur cette fonctionnalité et les autres paramètres que vous pouvez définir.

Lorsque vous exécutez un serveur annuaire public derrière un pare-feu NAT sur un réseau privé, utilisez l'option `--serverpublicip` pour spécifier l'adresse IP publique du ou des serveurs listés par votre serveur annuaire. Ceci est nécessaire pour permettre aux clients de l'Internet public de se connecter à eux via NAT. Notez que pour les serveurs utilisant cette option, vous aurez toujours besoin d'une redirection de port appropriée dans votre routeur/pare-feu.
