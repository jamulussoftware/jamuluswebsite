---
layout: wiki
title: "Démarrage"
lang: "fr"
permalink: "/wiki/Getting-Started"
---

# Démarrer avec Jamulus

## Pré-requis

1. **Un ordinateur** sous **Windows 10**, **MacOS X** El Capitan (v10.11) ou plus récents, ou **Linux**.
1. **Une connection Internet filaire haut-débit** (si possible n'utilisez pas le Wi-Fi, ça peut causer des problèmes de son). N'importe quelle connexion haut-débit devrait convenir[^1].
1. **Un casque d'écoute filaire (pas de haut-parleurs&nbsp;!)** pour ne pas générer d'écho, de boucles ou de larsens et réduire le délai[^2].

## Augmenter la qualité et réduire le délai

### 1. Utilisez une interface audio, un micro externe, pas la carte son de l'ordinateur !

À moins que vous ne soyez un musicien équipé d'un microphone (USB), il vous est fortement conseillé d'utiliser une interface audio&nbsp;: un boîtier dans lequel vous pouvez brancher votre ou vos instruments. Celle-ci se connecte généralement à votre ordinateur via USB. Voir la [configuration du matériel](Hardware-Setup).

### 2. Minimisez le trafic Internet et fermez tous les autre programmes sur votre ordinateur

Essayez de faire en sorte que rien sur votre machine ou votre réseau ne vienne concurrencer Jamulus lorsque vous l'utilisez.

### 3. Se connecter aux serveurs ayant les temps de réponse (ping) les plus bas

Les serveurs indiqués dans la liste avec 15ms ou moins vous donneront les meilleures chances de passer un bon moment (bien qu'il y ait d'autres éléments qui affectent aussi les performances). Si vous dépassez cette limite, vous risquez de ne pas avoir une bonne éxperience.

Maintenant que nous avons les bases, allons-y :

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installation sous Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installation sous macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Pour les utilisateurs de Linux</a>
</div>

Mais aussi [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/).
Exécutez Jamulus sur n'importe quel ordinateur à l'aide d'une clé USB (systèmes 64 bits uniquement). [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) vérifie votre matériel et le configure comme un chef dès la sortie de la boîte !

## Tout est installé ?

Si vous avez installé Jamulus, vous pouvez aller jetez un coup d'œil à la [configuration matérielle](Hardware-Setup).

Pour des informations plus détaillées sur l'utilisation de Jamulus, vous pouvez consulter ce [document](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md) (en anglais).

## Autres guides
* [Cet excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} (en anglais) par [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (sur _Facebook_) pourrait également valoir la peine d'être consulté.

* Sur le site [Bassetorius](https://www.bassetorius.fr/applications/jamulus/){: target="_blank" rel="noopener noreferrer"} vous trouverez également une série d'articles bien faits et détaillés, en Français, sur l'utilisation de Jamulus.

## Vous avez des problèmes ? Vous ne vous en sortez pas ?

**N'ÉCOUTEZ QUE LE SIGNAL PROVENANT DU SERVEUR !**

Ou, en d'autres termes, **n'écoutez pas** votre signal direct !

C'est évidemment difficile pour les chanteurs et chanteuses ou certain·ne·s musicien·ne·s acoustiques, mais même si votre connexion est bonne, lorsque les joueurs et joueuses n'écoutent pas **leur propre signal revenant du serveur**, la synchronisation entre les musicien·ne·s en souffre. _(Pour éviter tout doute : cela n'a rien à voir avec les commandes "mute" de Jamulus)_.

Vous trouverez de plus amples informations sur la manière d'éviter de vous écouter (et de vous aider à résoudre d'autres problèmes) dans la [section FAQ "Dépannage"](Client-Troubleshooting) (_actuellement en cours de rédaction_)

## Comment fonctionne Jamulus (en résumé)

**Voici comment des millions de personnes utilisent Jamulus pour jouer, chanter, improviser et enseigner de la musique avec d'autres personnes en temps réel, partout dans le monde :**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus fonctionne sur le principe du client/serveur. L'audio de tout le monde (client Jamulus) est envoyé à un serveur Jamulus, y est mixé et traité. Ensuite, l'audio est envoyé à chaque utilisateur ou utilisatrice du client Jamulus. Si un serveur Jamulus est rendu public et enregistré sur un serveur central, alors ses informations seront diffusées à tous les clients Jumulus qui pourront alors s'y connecter librement._

## Notes de bas de page
[^1]: Si vous avez une connexion avec 10Mbits en descendant et 1Mbps en montant, il est peu probable que vous rencontriez des problèmes liés à la bande passante. [Plus de détails ici](Network-Requirements){: target="_blank" rel="noopener noreferrer"}.
[^2]: Les casques sans fil Bluetooth ont généralement beaucoup de latence. C'est pourquoi il est préférable d'utiliser un casque ou des écouteurs filaires. En particulier, si vous chantez ou jouez d'un instrument acoustique, pour être sûr de jouer en même temps, n'utilisez qu'un casque ou des écouteurs filaires (voir [ces notes](Getting-Started#having-trouble-cant-keep-in-time) pour de plus amples informations).
