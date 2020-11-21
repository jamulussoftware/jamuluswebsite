---
layout: wiki
title: "Premier pas…"
lang: "fr"
permalink: "/wiki/Getting-Started"
---

# Premier pas avec Jamulus

## Pré-requis

1. **Un ordinateur** fonctionnant sous **Windows 10**, **MacOS X** El Capitan (v10.11) ou plus récent, ou **Linux**.
1. **Une connexion à Internet filaire** (n'utilisez pas le Wi-Fi, ça peut causer des problèmes de son). La plupart des connexions Internet à haut débit devrait convenir[^1].
1. **Un casque ou des écouteurs filaires – pas de haut-parleurs** pour ne pas provoquer d'écho ou boucle (larsen) et pour minimiser le délai[^2].

## Maximiser la qualité, réduire le délai

### 1. Utilisez une interface audio, un micro externe, pas la carte son ou le micro de l'ordinateur

Sauf si vous êtes un musicien ou une musicienne avec un micro USB, il vous est vivement conseillé d'utiliser un interface audio&nbsp;: une boîte dans laquelle vous pouvez brancher votre (vos) instrument(s). Elle se connecte généralement à l'ordinateur en USB.  
Pour plus de détails, voir la [configuration matérielle](Hardware-Setup).

### 2. Minimisez le trafic Internet et fermez tous les programmes sur votre PC

Essayez de faire en sorte que rien sur votre machine ou votre réseau ne soit en concurrence avec Jamulus lorsque vous l'utilisez.

### 3. Connectez vous aux serveurs ayant les temps de réponse (ping) les plus bas

Les serveurs indiqués dans la liste avec 15ms ou moins vous donneront les meilleures chances de passer un bon moment (bien qu'il y ait aussi d'autres éléments qui affectent les performances). Si vous dépassez cette limite, vous prenez des risques.

Maintenant que vous avez appris les bases, allons-y :

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installation sous Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installation sous macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Pour les utilisateurs de Linux</a>
</div>

Voir également – [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Faites fonctionner Jamulus sur n'importe quel ordinateur à l'aide d'une clé USB (systèmes 64 bits uniquement). Vérifie votre matériel et le configure comme un chef dès le départ&nbsp;!

## Tout est installé ?

Si vous avez installé Jamulus, jetez un coup d'œil à la [configuration matérielle](Hardware-Setup).

Pour des informations détaillées sur l'utilisation de Jamulus, veuillez consulter le [manuel du logiciel](Software-Manual).

## Autres guides
* [Cet excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} (en anglais) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) pourrait également valoir le coup d'œil.
* Sur le site [Bassetorius](https://www.bassetorius.fr/applications/jamulus/){: target="_blank" rel="noopener noreferrer"} vous trouverez également une série d'articles bien faits et détaillés, en français, sur l'utilisation de Jamulus.

## Vous avez des problèmes ? Vous ne parvenez pas à jouer en rythme ?

**ÉCOUTEZ. UNIQUEMENT. LE. SIGNAL. DU. SERVEUR !**

Ou dit autrement : n'écoutez **pas** votre signal directement.

Ça peut évidement être compliqué pour les chanteurs ou les chanteuses ou les instruments acoustiques, mais même si votre connexion est excellente, si les joueurs n'écoutent pas **leur propre signal provenant du serveur**, votre synchronisation **en pâtira**.  
_(Pour éviter toute confusion : cela n'a rien à voir avec les contrôles "muets" de Jamulus.)_

Vous trouverez de plus amples informations sur la manière d'éviter de vous écouter (et de vous aider à résoudre d'autres problèmes) dans la <abbr title="Questions fréquements posées">FAQ</abbr> [Résolution des problèmes](Client-Troubleshooting) (_en cours de "construction"_)

## Comment fonctionne Jamulus (en général)

**Voici comment des millions de personnes utilisent Jamulus pour jouer, chanter et enseigner la musique avec d'autres personnes en temps réel, partout dans le monde :**

![Overview](https://user-images.githubusercontent.com/9108457/99860064-376c5c00-2b92-11eb-878a-4a65746925c6.png)
_Jamulus fonctionne sur le principe client-serveur. Le signal audio des musiciens est envoyé à un serveur, y est mixé et traité. Ensuite, le signal audio est renvoyé à chaque client. Si un serveur est rendu public et enregistré sur un serveur central, ses informations seront diffusées à tous les clients._

## Notes de bas de page
[^1]: [Plus de détails ici](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. Si vous avez une connexion avec 10Mbits descendant et 1Mbps montant, il est peu probable que vous rencontriez des problèmes liés à la bande passante.
[^2]: Les casques ou écouteurs Bluetooth ont généralement une latence trop importante. C'est l'une des raisons pour lesquelles il faut un casque ou des écouteurs filaires. En particulier, si vous chantez ou jouez d'un instrument acoustique, pour vous assurer de rester en rythme avec les autres, n'utilisez que des écouteurs ou un casque (voir [ce paragrapge](Getting-Started#vous-avez-des-problèmes--vous-ne-parvenez-pas-à-jouer-en-rythme-) pour de plus amples informations).
