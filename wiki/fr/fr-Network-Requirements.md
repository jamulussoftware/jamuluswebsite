---
layout: wiki
title: "Quality, Delay and Bandwidth"
lang: "en"
permalink: "/wiki/Network-Requirements"
---

{% include breadcrumb.html root="More" branch1="Running a Server" branch1-url="Running-a-Server"  %}

# Configuration réseau

## Bande passante audio

Les paramètres audio ont un impact sur la bande passante réseau requise. Le tableau ci-dessous résume les exigences du réseau en fonction de la configuration de :
* Canaux : stéréo/mono
* Qualité : haute/moyenne/basse
* Durée du tampon audio : 2,67 ms, 5,33 ms, 10,67 ms, 21,33 ms.

Avec les unités suivantes
* ms : millisecondes
* Kbit/s : Kilo-bits par seconde (Rappel : 1 Mbit/s = 1024 Kbit/s, 1 KByte/s = 8 Kbit/s)
* Mbit/s : Méga-bits par seconde

| Canaux | Qualité | Bande passante (pour le tampon : 2,67 ms) | Bande passante (pour le tampon : 5,33 ms) | Bande passante (pour le tampon : 10,67 ms) | Bande passante (pour le tampon : 21,33 ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Stéréo haute qualité : 894 Kbit/s, 657 Kbit/s, 541 Kbit/s, 483 Kbit/s.
| Stéréo | Moyen | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s | Stéréo | Faible | 606 Kbit/s | 444 Kbit/s | 541 Kbit/s | 483 Kbit/s
| Stéréo basse : 606 Kbit/s, 372 Kbit/s, 256 Kbit/s et 198 Kbit/s.
| Mono | Haut | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s | Mono | Moyen | 594 Kbit/s | 328 Kbit/s | 328 Kbit/s | 270 Kbit/s
| Mono | Moyen | 594 Kbit/s | 366 Kbit/s | 250 Kbit/s | 192 Kbit/s | Mono | Bas | 534 Kbit/s | 256 Kbit/s | 198 Kbit/s | 0,5 %.
| Mono | Faible | 534 Kbit/s | 306 Kbit/s | 190 Kbit/s | 132 Kbit/s | | Mono | Moyenne | 594 Kbit/s | 366 Kbit/s | 250 Kbit/s | 192 Kbit/s

## Largeur de bande du réseau

Il y a un amont (musicien envoyant au serveur) et un aval (serveur renvoyant le mixage au musicien).
<figure><img src="{{site.url}}/assets/img/en-screenshots/bandwidth-diagram.png" loading="lazy" alt="Un diagramme de la bande passante du réseau Jamulus à partir de différentes qualités audio allant de faible à élevée"></figure>

Notez également que le débit moyen de l'ADSL2 est de 10 Mbit/s en aval et de 1 Mbit/s en amont. Les performances réelles dépendent de la distance au fournisseur, qui peut [théoriquement aller de 24 Mbit/s à 0,3 km à 1,5 Mbit/s à 5,2 km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) pour le débit descendant.
