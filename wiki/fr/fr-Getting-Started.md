---
layout: wiki
title: "Premier pas"
lang: "fr"
permalink: "/wiki/Getting-Started"
---

# Premier pas

## Pré-requis

1. **Un ordinateur** au moins sous **Windows 10**, **macOS** (**MacOS X** El Capitan v10.11 ou plus récent), ou **Linux**.
1. **Une connection Internet filaire** (n'utilisez pas le Wi-Fi, cela va causer des problèmes de son). La plupart des connexions à haut-débit suffisent[^1].
1. **Des casques ou écouteurs filaires - pas de haut parleurs** pour éviter de l'écho ou des larsens et pour minimiser le délai[^2].

## Maximiser la qualité et diminuer le délai

### 1. Réduisez votre trafic Internet et fermez les programmes de votre PC

Essayez de vous assurer que rien sur votre machine ou votre réseau (comme un flux vidéo) ne soit en concurrence avec Jamulus lorsque vous l'utilisez.

### 2. Utilisez une interface audio∕un micro externe, pas votre carte son interne

Nous vous recommandons vivement - bien que vous puissiez commencer sans ça - d'utiliser une interface audio (un boîtier dans lequel vous branchez un micro/instrument et que vous connectez à votre PC par exemple via USB) pour profiter d'un son de meilleure qualité avec une faible latence dans Jamulus. Vous pouvez également utiliser un microphone USB. Voir le [matériel recommandé](#matériel-recommandé).

### 3. Connectez-vous aux serveurs qui ont le meilleur temps de réponse

Les serveurs affichés dans la liste avec un temps de 15ms ou moins vous offriront de meilleures chances de passer un bon moment (même s'il y a d'autres éléments qui influent sur les performances). Si vous dépassez cette limite, vous prenez des risques.

Maintenant que vous avez les bases, c'est parti :

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installer sur Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installer sur macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Pour les utilisateurs de Linux</a>
</div>

Découvrez aussi : [Jamulus OS !](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Exécutez Jamulus sur n'importe quel ordinateur avec une clé USB (uniquement pour les systèmes en 64 bits). Vérifiez la compatibilité de votre matériel et profitez-en !

## Matériel recommandé

Voir [la liste de bon matériel connu](Sound-Devices) et la [configuration du matériel](Hardware-Setup).


Si vous installez Jamulus, jetez un coup d'œil [la configuration matérielle](Hardware-Setup).

Pour de plus amples informations à propos de l'utilisation de Jamulus, regardez [le manuel d'aide](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

## D'autres guides
* [Cet excellent guide (en)](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) pourrait aussi vous intéresser.

* Sur le site [Bassetorius](https://www.bassetorius.fr/applications/jamulus/){: target="_blank" rel="noopener noreferrer"} vous trouverez également une série d'articles bien faits et détaillés, en français, sur l'utilisation de Jamulus.

## Vous avez des problèmes ? Vous n'arrivez pas à être en rythme ?

**ÉCOUTEZ. UNIQUEMENT. LE. SIGNAL. DU. SERVEUR !**

Ou dit autrement : n'écoutez **pas** votre signal directement.

Ça peut évidemment être compliqué pour les chanteurs et pour certains instrumentistes, mais même si votre connexion est excellente, si les chanteur ou les musiciens n'écoutent pas **leur propre son provenant du serveur**, votre synchronisation **en pâtira**. (_Attention : cela n'a rien à voir avec les commandes « mutes » de Jamulus_)

Vous trouverez plus d'informations sur comment éviter de vous écouter (et pour vous aider à résoudre d'autres problèmes) dans la [section FAQ - Dépannage](Client-Troubleshooting) (_actuellement en construction_)

## Comment Jamulus fonctionne (principe de base)

**Voici comment des millions de personnes utilisent Jamulus pour jouer, chanter et enseignent la musique avec d'autres personnes en temps réel à travers le monde :**

![vue d'ensemble](https://user-images.githubusercontent.com/9108457/99901946-9200d780-2cba-11eb-8167-e20ae2621102.png)
_Jamulus fonctionne sur le principe clients/serveurs. Le son de chacun est envoyé au serveur, qui les mixe et les traite. Ensuite, le son est envoyé à chaque client. Si un serveur est public et enregistré sur un serveur central, ses informations seront diffusées à tous les clients._

## Notes
[^1]: [Tous les détails ici](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. Si vous avez une connexion avec 10Mbits descendant et 1Mbps montant, vous n'aurez sûrement aucun problème de bande-passante.
[^2]: Les casques sans-fil Bluetooth basiques ont généralement beaucoup trop de latence. C'est pourquoi, il est préférable d'utiliser un casque ou des écouteurs filaires. En particulier si vous chantez ou jouez d'un instrument accoustique, pour être sûr de jouer en rythme utilisez uniquement des casques filaires (voir ce [paragraphe à ce propos](Getting-Started#vous-avez-des-problèmes--vous-narrivez-pas-à-être-en-rythme-) pour de plus amples informations).
