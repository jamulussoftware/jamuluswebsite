---
lang: fr
layout: wiki
permalink: /wiki/Directory-Servers
title: 'Serveurs annuaires'
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Enregistrement du serveur public

Comme il y a une limite de 150 serveurs par serveur annuaire, vous devez sélectionner le serveur annuaire sur lequel vous voulez annoncer votre serveur. Sélectionnez un genre si vous avez l'intention de limiter les joueurs à ce style (les joueurs pourront alors voir votre serveur dans leur liste de genres).

Lorsque vous démarrez un serveur public, vous verrez un message indiquant si votre serveur a été répertorié avec succès ou non. Si ce n'est pas le cas, et que vous laissez votre serveur en marche, il continuera à essayer de s'inscrire jusqu'à ce qu'un emplacement se libère.


## Serveurs "headless"

Définissez le serveur annuaire (genre) en utilisant l'option `--directoryserver` (`-e`) comme suit :


| Genre | Adresse du serveur |
|-----------|------------------|
|**Tout Genre 1** | `anygenre1.jamulus.io:22124`|
|**Tout Genre 2** | `anygenre2.jamulus.io:22224`|
|**Tout Genre 3** | `anygenre3.jamulus.io:22624`|
|**Genre Rock** | `rock.jamulus.io:22424`|
|**Genre Jazz** | `jazz.jamulus.io:22324`|
|**Genre Classique/Folk** | `classical.jamulus.io:22524`|
|**Genre Choral/Barbershop** | `choral.jamulus.io:22724`|
