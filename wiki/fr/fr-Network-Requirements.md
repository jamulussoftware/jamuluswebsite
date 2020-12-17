---
layout: wiki
title: "Qualité, délais et bande passante réseau"
lang: "fr"
permalink: "/wiki/Network-Requirements"
---

# Pré-requis réseau

## Bande passante audio

Les paramètres audio ont un impact sur la bande passante requise du réseau. Le tableau ci-dessous résume les pré-requis réseau en ce qui concerne la configuration de :
* canaux : stéréo/mono
* qualité : haute/moyenne/basse
* durée du tampon audio : 2,67ms, 5,33ms, 10,67ms, 21,33ms

Avec les unités suivantes
* ms : millisecondes
* Kbps : Kilo-bits par seconde (rappel : 1Mbps = 1024Kbps, 1KByte = 8Kbits)
* Mbps : Méga-bits par seconde

| Canaux  | Qualité | Bande passante (pour un tampon : 2,67ms) |  Bande passante (pour un tampon : 5,33ms) | Bande passante (pour un tampon : 10,67ms) | Bande passante (pour un tampon : 21,33ms) |
| --------- | ------- | -------- | -------- | -------- | -------- |
| Stéréo    | Haute   | 894 Kbps | 657 Kbps | 541 Kbps | 483 Kbps |
| Stéréo    | Moyenne | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Stéréo    | Basse   | 606 Kbps | 372 Kbps | 256 Kbps | 198 Kbps |
| Mono      | Haute   | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Mono      | Moyenne | 594 Kbps | 366 Kbps | 250 Kbps | 192 Kbps |
| Mono      | Basse   | 534 Kbps | 306 Kbps | 190 Kbps | 132 Kbps |

## Bande passante réseau

Il y a un débit montant (le musicien envoie au serveur) et un débit descendant (le serveur renvoie le mixage au musicien) ![image](https://user-images.githubusercontent.com/9976944/79274940-999b0b00-7ea5-11ea-85be-3ded5ee198d5.png)

Notez également que le taux de transfert ADSL2 moyen est de 10 Mbits/seconde pour le débit descendant et de 1 Mbit/seconde pour le débit montant. Les performances réelles dépendent de la distance par rapport au fournisseur, qui peut [théoriquement varier de 24 Mb/s à 0,3 km à 1,5 Mb/s à 5,2 km](https://fr.wikipedia.org/wiki/ADSL#Estimation_du_d%C3%A9bit_maximal_r%C3%A9el_en_fonction_de_la_longueur_de_la_ligne) pour le taux de téléchargement.
