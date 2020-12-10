---
layout: wiki
title: "Dépannage du client"
lang: "fr"
permalink: "/wiki/Client-Troubleshooting"
---

# Dépannage

### Vous n'entendez aucun son ou les autres ne vous entendent pas ?
Commencez par les choses simples : assurez-vous que votre instrument ou micro et votre casque soient branchés sur les bonnes prises. Assurez-vous qu'aucune autre application comme votre navigateur, votre logiciel de vidéoconférence, etc. n'utilise votre carte son. Vous devriez les éteindre lorsque vous utilisez Jamulus. Si tout semble correct et que le problème persiste, il est probable qu'il y ait un problème avec les paramètres de votre périphérique son. Cela dépendra de votre configuration particulière (plate-forme, matériel, logiciel et pilotes), il est donc préférable de demander conseil sur [les forums](https://sourceforge.net/p/llcon/discussion/software/).

**Utilisateurs de Windows (ASIO4All)** : si vous utilisez le pilote ASIO4All, consultez la [section de configuration ASIO4All](Installation-for-Windows#configuration-de-asio4all).

### Tout sonne correctement, mais c'est difficile de rester en rythme

**Dans la mesure du possible, N'ÉCOUTEZ PAS votre signal direct.** Assurez-vous que vous écoutez autant que possible le son de votre propre instrument/voix _revenant du serveur_. Ce signal vous permet de vous synchroniser avec vos partenaires de jeu, et sera le signal que les membres du groupe entendront également. Ainsi, en écoutant ce signal, vous serez synchronisés les uns avec les autres (en supposant que vous avez tous une latence raisonnablement faible). Notez que si un ou plusieurs musiciens ne suivent pas cette règle, ils ralentiront lorsqu'ils joueront ou chanteront.

Vous pouvez testez si vous entendez correctement votre signal en procédant comme suit :

1. Faites entrer votre signal audio dans votre ordinateur.
1. Utilisez une application d'enregistrement audio (telle que [Audacity](https://www.audacityteam.org/)) sur votre ordinateur pour enregistrer cette entrée et vérifier qu'elle est correcte.
1. Assurez-vous que si vous mettez en silence votre entrée audio dans l'application d'enregistrement, vous ne pouvez pas vous entendre.
1. Fermez l'application d'enregistrement et lancez Jamulus. Vous ne devriez toujours pas vous entendre.
1. Connectez-vous à un serveur et jouez quelque chose. Maintenant, vous devriez vous entendre avec le délai du serveur.

**Si vous avez encore des problèmes**, essayez de demander sur le [forum du matériel](https://sourceforge.net/p/llcon/discussion/hardware/). La manière exacte dont vous éviterez d'écouter votre signal direct dépendra de votre configuration individuelle : votre interface son, votre console de mixage, l'endroit où est branché votre casque, etc… Par exemple, certaines interfaces audio ont des boutons « monitor » (désactivez-les), ou des options similaires.

Sachez que si l'écoute du signal du serveur vous assure d'être synchronisé avec les autres musiciens, vous pourriez également rencontrer des problèmes si votre latence globale (indiquée par le voyant lumineux « Délai » dans Jamulus) n'est pas verte ou au moins jaune la plupart du temps. Consultez le [manuel du logiciel](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md) pour comprendre comment ajuster votre configuration afin de vous aider dans cette tâche.

### Vous n'arrivez pas à régler votre micro ?

Lorsque vous utilisez un micro tout en jouant de votre instrument, vous pouvez utiliser un signal d'entrée audio stéréo dans vos réglages où un canal est connecté à l'instrument et l'autre canal est connecté au signal du micro. Sur le canal du micro, un effet de réverbération optionnel peut être appliqué.

### Les LEDs de la mémoire tampon deviennent soudainement rouges, des pannes, des sautillements, des sons bizarres ?

Le processeur de votre ordinateur peut avoir des problèmes. Essayez de ne rien avoir en concurrence avec Jamulus (comme Zoom Meetings ou les flux en direct de Facebook) sur votre machine. Ou au moins, quittez-les pendant que vous jouez. Empêchez les anti-virus d'effectuer des analyses ou les mises à jour logicielles, etc… Sachez que plus vous utilisez de réverbération dans Jamulus, plus le processeur sera utilisé.

### Les temps de ping et de latence commencent bien, puis s'aggravent, causant des problèmes

Cela peut indiquer que quelque chose d'autre entre en concurrence avec Jamulus sur votre réseau, alors assurez-vous que personne ne regarde de films en HD sur Netflix ou ne participe à des vidéoconférences Zoom pendant que vous jouez. Une solution plus permanente pour les utilisateurs à vocation technique, peut être trouvée en examinant [le problème du gonflement de la mémoire tampon](https://www.bufferbloat.net/projects/bloat/wiki/) (en anglais) sur leur routeur, et en vérifiant si vous pouvez mettre en œuvre la gestion intelligente des files d'attente (Smart Queue Management - SQM). [Plus de détails ici](https://www.bufferbloat.net/projects/bloat/wiki/What_can_I_do_about_Bufferbloat/) (en anglais).

### Vous n'êtes pas à l'aise avec les canaux du logiciel, le routage audio, les taux d'échantillonnage, et autres ?

Il est généralement beaucoup plus facile et plus fiable de disposer d'une [console de mixage](https://www.thomann.de/pics/bdb/191244/7355025_800.jpg) pour connecter votre matériel (instruments, micros, enregistreur, etc…) et d'envoyer ensuite un simple signal stéréo à votre interface son (assurez-vous cependant d'écouter le son résultant du serveur Jamulus via votre ordinateur !). La grande variété de combinaisons possibles de matériels, de logiciels et d'instruments signifie que la configuration de votre carte son pour qu'elle fonctionne avec votre configuration particulière peut se compliquer très rapidement.

### Vous vous faites exploser les oreilles par quelqu'un qui se joint à votre bœuf avec du larsen ou du bruit ?

Vous pouvez régler votre « Niveau de nouveau client » sur une valeur faible (par exemple 10), ou mettre les musiciens avec lesquels vous jouez en état « Solo » (dans le panneau de mixage sur le côté droit). De cette façon, soit les nouveaux venus seront très silencieux, soit vous ne les entendrez pas du tout. 

### Vous ne voyez pas le serveur que vous voulez rejoindre ?

Vérifiez d'abord que vous avez le bon serveur de genre musical sélectionné dans votre fenêtre des paramètres de connexion. Mais il arrive parfois que des problèmes de réseau empêchent votre client d'afficher la liste de tous les serveurs disponibles. Si vous connaissez le nom du serveur que vous souhaitez rejoindre, vous pouvez [rechercher son adresse IP ici](http://explorer.jamulus.io/)). Saisissez l'adresse IP dans le champ « Adresse du serveur » de la fenêtre « Paramètres de connexion » pour vous y connecter.

### Vous ne voyez pas du tout la liste des serveurs ?

Au Royaume-Uni (et éventuellement dans d'autres régions/routeurs), le réglage du modem Internet par câble de Virgin Media peut poser problème. « Block Fragmented IP Packets » ne doit pas être cochée. Pour les autres routeurs/FAI (fournisseur d'accès internet), essayez également de désactiver le SPI (Stateful Packet Inspection) et si cela résout le problème, vous pouvez décider de le laisser désactivé ou non.

Dans certains cas, il se peut que ce soit votre FAI qui bloque votre utilisation pour Jamulus. Voir la note sur la [page de dépannage du serveur](Server-Troubleshooting#personne-ne-peut-se-connecter-à-mon-serveur-mais-je-peux-my-connecter-localement) à propos de « Personne ne peut se connecter à mon serveur ».

### Des problèmes pour utiliser Garageband (ou autre STAN) avec Jamulus ? 

Voir [ce forum de discussion](https://sourceforge.net/p/llcon/discussion/533517/thread/d3dd58eedc/#b994) (en anglais).

### Vous utilisez un Mac et votre signal d'entrée n'est pas entendu ?

(Avec nos remerciements à [Mark Anthony De Souza](https://www.facebook.com/groups/619274602254947/permalink/765122847670121/?comment_id=765525034296569) (en anglais))

Peut-être n'avez-vous pas répondu « oui » à la question `« Jamulus souhaite accéder à votre micro »`.  Pour y remédier :
* Allez dans `Préférences Système` > `Sécurité et confidentialité` > onglet `Confidentialité`
* Recherchez `Microphone` sur la gauche et assurez-vous que `Jamulus` soit activé dans la liste de droite.

***

Pour toute autre question, veuillez rechercher ou poster sur les [forums de discussion](https://sourceforge.net/p/llcon/discussion/software/).
