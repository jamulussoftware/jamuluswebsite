---
layout: wiki
title: "Pour commencer"
lang: "fr"
permalink: "/wiki/Getting-Started"
---

# Pour commencer

## Vous avez besoin de

1. **Un ordinateur** au moins sous **Windows 10**, **MacOS X** El Capitan (v10.11) ou plus réçent, ou **GNU/Linux**.
1. **Une connection Internet filaire** (n'utilisez pas la Wi-Fi, cela va causer des problèmes de son). La plupart des connexions standard suffisent[^1].
1. **Des microphones filaires - pas de haut parleurs** pour éviter de l'écho ou des larsen et pour minimiser le délai[^2].

## Maximiser la qualité et diminuer le délai

### 1. Utilisez une interface audio∕un microphone externe, pas votre carte son interne

Sauf dans le cas où vous êtes un musicien ayant un microphone (USB), il est fortement recommandé d'utiliser une carte son : un appareil sur lequel vous pouvez brancher votre instrument. Celle-çi se connectera à votre PC, généralement par USB. Visitez [la section matériel](Hardware-Setup).

### 2. Réduisez votre trafic Internet et fermez les programmes de votre PC

Assurez-vous que Jamulus ait le maximum de ressources sur votre machine ainsi que via votre connexion réseau quand vous l'utilisez.

### 3. Connectez-vous aux serveurs qui ont le meilleur temps de réponse

Les serveurs qui s'affichent dans la liste avec un temps de 15ms ou moins optimiserons votre expérience (même s'il y a d'autres éléments qui influent sur les performances). Avec des temps de réponse plus longs, c'est à vos risques et périls.

Maintenant que vous avez les bases, c'est parti :

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installer sur Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installer sur macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Installer sur une distribution GNU/Linux</a>
</div>

Découvrez aussi : [Jamulus OS !](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Exécutez Jamulus sur n'importe quel ordinateur avec une clé USB (uniquement pour les systèmes en 64 bits). Vérifiez la compatibilité de votre matériel et profitez-en !

## Tout est bon ?

Si vous voulez configurer Jamulus, visitez [la section matériel](Hardware-Setup).

Pour de plus amples informations à propos de l'utilisation de Jamulus, regardez [le mode d'emploi](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

## D'autres guides
* [Cet excellent guide (en)](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) pourrait aussi vous aider.

## Un ou des problème(s) ? Ça ne fonctionne pas longtemps ?

**ÉCOUTEZ. UNIQUEMENT. LE. SIGNAL. DE. VOTRE. SERVEUR !**

Ou dit autrement : n'écoutez **pas** votre signal directement.

C'est évidemment compliqué pour les chanteurs et pour certains instruments, mais même si votre connexion est excellente, si les chanteurs/musiciens n'écoutent pas leur propre son provenant du serveur, votre synchronisation en pâtira. (Attention : cela n'a rien à voir avec les commandes « mutes » de Jamulus)

Vous trouverez plus d'informations sur comment éviter de vous écouter (et pour vous aider à résoudre d'autres problèmes) dans la [section FAQ - Dépannage](Client-Troubleshooting) (_actuellement en construction_)

## Comment Jamulus fonctionne (principe de base)

**Voici comment des millions de personne utilisent Jamulus pour jouer, chanter et apprendre la musique avec d'autres personnes en temps réel à travers le monde :**

![Un schéma pour expliquer le principe de fonctionnement de Jamulus](https://user-images.githubusercontent.com/44293594/99189852-b2351180-2763-11eb-96fc-660f5038a83c.png)
_Jamulus fonctionne sur le principe serveur-clients. Le son de chacun est envoyé au serveur, qui les mixe. Ensuite, le son est envoyé à chaque client. Si un serveur est public et enregistré sur un serveur central, ses informations seront diffusés à tous les clients._

## Notes
[^1]: [Tous les détails ici](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. Si vous avez une connexion avec 10Mbits descendants et 1Mbps montants, vous n'aurez sûrement aucun problème de bande-passante.
[^2]: Les écouteurs Bluetooth basiques ont une latence trop importante, c'est la raison pour laquelle des écouteurs filaires sont recommandés. C'est aussi une des raisons pour laquelle les micros filaires sont recommandés. Particulièrement si vous chantez ou jouez d'un instrument accoustique, afin d'être sûr d'être synchronisé avec les autres. (regardez cette [notice](Getting-Started#having-trouble-cant-keep-in-time) pour plus d'informations).
