---
lang: fr
layout: wiki
permalink: /wiki/Client-Troubleshooting
title: 'Dépannage du client'
---

# Troubleshooting
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

### Vous n'entendez aucun son/les autres ne vous entendent pas?

Commencez par les choses simples : vérifiez que votre instrument/microphone et vos écouteurs sont connectés aux bonnes prises. Assurez-vous qu'aucune autre application (navigateur, outil de vidéoconférence, etc...) n'utilise également votre carte son. Vous devez les fermer lorsque vous utilisez Jamulus. Si tout semble correct et que le problème persiste, il est probable qu'il y ait un problème avec les paramètres de votre périphérique audio. Cela dépendra de votre configuration particulière (plate-forme, matériel, logiciels et pilotes), il est donc préférable de demander conseil sur [les forums] (https://github.com/jamulussoftware/jamulus/discussions).

**Utilisateurs de Windows (ASIO4ALL)** : Si vous utilisez le pilote ASIO4ALL, consultez la section [Configuration de ASIO4LL](Installation-for-Windows#configuration-de-asio4all).

### Un son très fort est émis si vous vous connectez à un serveur

Vous créez un larsen car votre microphone enregistre le signal de votre haut-parleur. Déconnectez-vous du serveur et sélectionnez les périphériques d'entrée et de sortie corrects. Consultez la page d'installation de Jamulus pour votre système d'exploitation pour obtenir plus d'informations sur la manière de procéder.

### Vous ne voyez pas le casque ou le microphone que vous venez de connecter à votre PC?

Redémarrez simplement Jamulus avec votre appareil branché. Actuellement, Jamulus n'affiche pas les périphériques qui ont été branchés après le chargement du système de son.

### Votre son est saccadé

Il se peut que votre périphérique audio ne fonctionne pas avec la taille de tampon que vous avez sélectionnée. Sélectionnez une taille de mémoire tampon plus importante dans les paramètres de Jamulus. Si possible, utilisez un autre appareil, car une grande taille de mémoire tampon entraîne une latence plus élevée.

### Vous avez tous un son correct, mais il est difficile de jouer ensemble

**Dans la mesure du possible, N'ÉCOUTEZ PAS votre signal direct**. Assurez-vous d'écouter autant que possible le son de votre propre instrument/voix _qui revient du serveur_. Ce signal est le résultat du mélange et de la synchronisation de votre son avec celui de vos partenaires de jeu, et sera le signal que vos camarades de groupe entendent aussi. L'écoute de ce signal signifie donc que vous serez synchronisés les uns avec les autres (en supposant que vous avez tous une latence raisonnablement faible). Notez que si un ou plusieurs musiciens ne respectent pas cette règle, ils ralentiront leur jeu ou leur chant.

Vous pouvez vérifier si vous entendez correctement votre signal en procédant comme suit :

1. Lancez Jamulus et connectez-vous à un serveur dont le temps de ping est long (supérieur à 200 ms).
2. Frappez une fois dans vos mains (ou jouez une note courte sur un instrument). Vous devriez entendre le son du serveur Jamulus revenir, mais avec un retard significatif.
3. Cliquez sur le bouton "Mute" sous votre nom/paramètre Jamulus dans la fenêtre principale du mixeur Jamulus (**Pas** le bouton "Mute Myself" à gauche).
4. Frappez à nouveau dans vos mains.

Si vous entendez deux claquements de mains après l'étape 2, ou n'importe quel claquement après l'étape 4, alors vous **n'avez pas** obéi à la règle numéro un - votre audio local est activé et vous devez le désactiver.

La manière exacte dont vous éviterez d'écouter votre signal direct dépendra de votre configuration individuelle - votre interface audio, votre table de mixage, le point de connexion des casques, etc. Par exemple, certaines interfaces audio ont des boutons "moniteur" (désactivez-les), ou des options similaires. **Si vous rencontrez toujours des problèmes, essayez de poser la question sur le [forum] (https://github.com/jamulussoftware/jamulus/discussions).

Sachez que si l'écoute du signal du serveur vous permet d'être synchrone avec les autres musiciens, vous pouvez également rencontrer des problèmes si votre latence globale (indiquée par le voyant "Delay" dans Jamulus) n'est pas verte ou au moins jaune la plupart du temps. Consultez le [manuel du logiciel](/wiki/Software-Manual) pour savoir comment ajuster votre configuration afin de résoudre ce problème.

### Vous n'arrivez pas à régler votre micro?

Lorsque vous utilisez un microphone tout en jouant de votre autre instrument, vous pouvez utiliser un signal d'entrée audio stéréo dans vos réglages où un canal est connecté à l'instrument et l'autre canal est connecté à un signal de microphone. Sur le canal du microphone, un effet de réverbération optionnel peut être appliqué.

### Les voyants de la mémoire tampon deviennent soudainement rouges, pannes, gigue, sons bizarres?

Le CPU de votre ordinateur peut avoir des problèmes. Essayez de ne rien avoir qui soit en concurrence avec Jamulus (comme Zoom Meetings ou les flux en direct de Facebook) sur votre machine. Ou du moins, quittez-les pendant que vous jouez. Empêchez les scanners de virus d'effectuer des analyses, les mises à jour de logiciels, etc. Sachez que le paramètre de réverbération dans Jamulus utilise également plus de CPU, lorsque la réverbération est importante.

### Les temps de ping et de latence commencent bien, puis s'aggravent et causent des problèmes.

Cela peut indiquer que quelque chose d'autre est en concurrence avec Jamulus sur votre réseau, alors assurez-vous que personne ne regarde des films Netflix HD ou ne participe à des vidéoconférences Zoom pendant que vous jouez. Une solution plus permanente pour les utilisateurs à l'esprit technique peut être trouvée en examinant [le problème de l'hypertrophie de la mémoire tampon](https://www.bufferbloat.net/projects/bloat/wiki/) sur leur routeur et si vous pouvez mettre en œuvre la gestion intelligente des files d'attente (SQM). Plus de détails ici](https://www.bufferbloat.net/projects/bloat/wiki/What_can_I_do_about_Bufferbloat/).

### Vous êtes frustré par les canaux logiciels, le routage audio, les taux d'échantillonnage et autres?

Il est généralement plus simple et plus fiable de disposer d'une [table de mixage] (https://www.thomann.de/pics/bdb/191244/7355025_800.jpg) pour connecter votre matériel (instruments, micro, enregistreur, etc.), puis d'envoyer un simple signal stéréo à votre interface sonore (assurez-vous toutefois d'écouter le son résultant sur le serveur Jamulus via votre ordinateur !). L'énorme variété des combinaisons possibles de matériel, de logiciels et d'instruments signifie que le paramétrage de votre carte son pour fonctionner avec votre configuration particulière peut sinon devenir très vite compliqué.

### Vous êtes gêné par le larsen ou le bruit de quelqu'un qui se joint à votre jam?

Vous pouvez régler votre "Niveau de nouveau client" sur une valeur faible (par exemple 10), ou régler les musiciens avec lesquels vous jouez sur l'état "Solo" (dans le panneau de mixage sur le côté droit). De cette façon, soit les nouveaux arrivants seront très silencieux, soit vous ne les entendrez pas du tout.

### Vous ne voyez pas le serveur que vous voulez rejoindre?

Vérifiez d'abord que vous avez sélectionné le bon serveur de genre dans votre fenêtre de configuration de la connexion. Parfois, des problèmes de réseau font que votre client ne liste pas tous les serveurs disponibles. Si vous connaissez le nom du serveur que vous voulez rejoindre, vous pouvez [rechercher son adresse IP ici] (https://explorer.jamulus.io/). Saisissez l'adresse IP dans le champ "Nom/adresse du serveur" de la fenêtre de configuration de la connexion pour vous y connecter.

### Vous ne voyez pas du tout de liste de serveurs?

Au Royaume-Uni (et peut-être dans d'autres régions/routeurs), le paramètre du modem Internet de Virgin Media Cable peut causer un problème. La case "Block Fragmented IP Packets" ne doit pas être cochée. Pour les autres routeurs/ISP, essayez également de désactiver le SPI (Stateful Packet Inspection) et si cela résout le problème, vous pourrez décider de le laisser désactivé ou non.

Dans certains cas, il se peut que ce soit votre fournisseur d'accès qui bloque l'utilisation de Jamulus. Voir la note sur la [page de dépannage du serveur](Server-Troubleshooting#Personne-ne-peut-se-connecter-à-mon-serveur---mais-je-peux-me-connecter-localement) à propos du problème "Personne ne peut se connecter à mon serveur".

### Difficultés à utiliser Garageband (ou un autre DAW) avec Jamulus ?

Voir [cette discussion du forum](https://sourceforge.net/p/llcon/discussion/533517/thread/d3dd58eedc/#b994)

### Vous utilisez un Mac et votre entrée n'est pas entendue ?

(Avec les remerciements de [Mark Anthony De Souza](https://www.facebook.com/groups/619274602254947/permalink/765122847670121/?comment_id=765525034296569))

Vous n'avez peut-être pas répondu "Oui" à la question "Jamulus veut accéder à votre microphone". Pour résoudre ce problème :
* Allez dans `Préférences` > `Sécurité et confidentialité` > onglet `Privacy`.
* Trouvez `Microphone` sur la gauche et assurez-vous que `Jamulus` est activé sur la liste de droite.

***

Pour toute autre question, veuillez effectuer une recherche ou poster un message sur les [Forums de discussion] (https://github.com/jamulussoftware/jamulus/discussions).
