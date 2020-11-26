---
layout: wiki
title: "Serveurs centraux"
lang: "fr"
permalink: "/wiki/Central-Servers"
---

# Inscription au serveur public

À partir de mai 2020, afin de minimiser le problème de la saturation du serveur, nous avons créé plusieurs serveurs centraux basés sur le genre musical (chacun avec une limite actuelle de 150 serveurs). 

Lorsque vous démarrez un serveur public, vous verrez un message vous indiquant si votre serveur a été listé avec succès ou non. Si vous laissez votre serveur en fonction, il réessaiera de s'inscrire jusqu'à ce qu'un créneau soit libéré.  

## Serveurs sans <abbr title="Interface utilisateur graphique">IUG</abbr>

À partir de la version v3.5.4 de Jamulus, vous devrez définir le serveur central (genre) manuellement en utilisant l'option `--centralserver` (`-e`) comme suit : 

|                 Genre                    |           Adresse du serveur            |
|------------------------------------------|-----------------------------------------|
|**Tout genre**                            |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**                                  |`jamulusrock.fischvolk.de:22424`         |
|**Jazz**                                  |`jamulusjazz.fischvolk.de:22324`         |
|**Classique/Folk/Chœurs**                 |`jamulusclassical.fischvolk.de:22524`    |
|Default _(obsolète depuis Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`             |
