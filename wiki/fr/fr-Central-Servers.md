---
layout: wiki
title: "Serveurs centraux"
lang: "fr"
permalink: "/wiki/Central-Servers"
---

# Enregistrement du serveur public

En mai 2020, afin de minimiser le problème du dépassement de la limite de serveurs, nous avons créé des serveurs centraux basés sur le genre musical (chacun avec une limite actuelle de 150 serveurs). 

Lorsque vous démarrez un serveur public, vous verrez un message indiquant si votre serveur a été listé avec succès ou non. Si vous laissez votre serveur en marche, il réessaiera de s'inscrire jusqu'à ce qu'un créneau libre soit disponible.  

## Serveur sans GUI (_Headless server_)

À partir de Jamulus v3.5.4, vous devrez définir le serveur central (genre) manuellement en utilisant l'option `--centralserver` (`-e`) comme suit : 

|                 Genre                    |           Adresse du serveur            |
|------------------------------------------|-----------------------------------------|
|**Tout genre**                            |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**                                  |`jamulusrock.fischvolk.de:22424`         |
|**Jazz**                                  |`jamulusjazz.fischvolk.de:22324`         |
|**Classique/Folk/Chœurs**                 |`jamulusclassical.fischvolk.de:22524`    |
|Default _(obsolète depuis Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`             |
