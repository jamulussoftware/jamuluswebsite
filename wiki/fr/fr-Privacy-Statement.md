---
layout: wiki
title: "Jamulus – Confidentialité"
lang: "fr"
permalink: "/wiki/Privacy-Statement"
---

# Confidentialité et vie privée

## Site Internet jamulus.io
Le site jamulus.io s'efforce de ne pas collecter vos données personnelles. Si vous vous connectez au site jamulus.io, votre adresse IP est envoyée aux pages GitHub. De plus, comme nous avons placé un lien vers le logo de SourceForge dans le pied de page de chaque page, SourceForge peut également recevoir votre adresse IP.
Nous ne mettons pas de cookies de suivi, bien que SourceForge puisse le faire. Si vous ne le souhaitez pas, veuillez désactiver les cookies dans votre navigateur.

## Logiciel Jamulus

### Utilisation des informations de profil

Lorsque vous vous connectez à un serveur Jamulus public ou privé, tout ce que vous mettez dans Mon profil (dans les Paramètres) sera montré aux autres personnes sur ce serveur pendant que vous y êtes connecté. Le serveur ne stocke ni n'enregistre par ailleurs les informations relatives à votre profil et l'opérateur du serveur n'y a pas accès, sauf s'il est également connecté en tant que client.

Lorsque vous vous connectez à un serveur public, votre profil est également accessible aux tiers à partir du serveur central auquel ce serveur est enregistré. Il peut s'agir d'informations sur l'état du réseau public Jamulus (par exemple, [ici](http://jamulus.softins.co.uk/)), mais ne se limite pas à cela. Les informations relatives au profil ne sont pas enregistrées ou stockées par le serveur Jamulus auquel vous êtes connecté ou par le serveur central Jamulus, mais peuvent être stockées ou traitées par des tiers.

### Utilisation de l'adresse IP

Lorsque vous vous connectez à un serveur public ou privé, l'opérateur du serveur peut voir votre adresse IP pendant que vous êtes connecté.  Si l'opérateur du serveur a activé la journalisation (qui est désactivée par défaut), votre adresse IP sera également enregistrée et stockée dans le fichier journal du serveur.

En tant qu'administrateur de serveur, lorsque vous enregistrez un serveur public auprès d'un serveur central, votre adresse IP est envoyée à CloudFlare (1.1.1.1) afin d'identifier votre adresse IP publique. Les adresses IP de tous les serveurs publics enregistrés auprès du serveur central peuvent également être consultées par des tiers à des fins d'information ou autres (par exemple [ici](http://jamulus.softins.co.uk/)). Par ailleurs, votre adresse IP publique n'est pas enregistrée ou stockée par Jamulus, mais peut être stockée ou traitée par des tiers.

_Les utilisateurs concernés par l'utilisation du réseau CloudFlare peuvent [recompiler](Compiling) le code source de Jamulus pour utiliser une alternative pour `WELL_KNOWN_HOST` et `WELL_KNOWN_PORT` dans [global.h](https://github.com/corrados/jamulus/blob/master/src/global.h#L116)._

### Enregistrements audio

Vous verrez un avertissement si vous êtes connecté à un serveur Jamulus alors que l'enregistrement du serveur est activé. Les enregistrements de chaque joueur sont stockés par le serveur séparément sous forme de fichiers .WAV et seul l'opérateur du serveur y a accès.

### Messages Chat

Lorsque vous tapez un message dans la fenêtre de chat, les autres musiciens connectés peuvent le voir, mais les messages ne sont pas stockés par le serveur ainsi que par l'administrateur du serveur et aucun tiers n'y a accès.
