---
layout: wiki
title: "Manuel du Logiciel"
lang: "fr"
permalink: "/wiki/Software-Manual"
---
Aide Jamulus (Manuel du Logiciel)
=================================
_(Note: les copies d'écran ont été faite avec l'interface en anglais, les termes utilisés dans ce manuel correspondent aux termes employés dans l'interface du logiciel en français.)_

Fenêtre Principale
------------------

![Main window](https://user-images.githubusercontent.com/20726856/97360410-77476880-189e-11eb-99c6-f4a68258bf31.png)

### LEDs d'état

![LEDs](https://user-images.githubusercontent.com/20726856/97360576-ac53bb00-189e-11eb-971e-a73414ec3f6f.png)

La LED **Délai** indique l'état actuel du retard audio :

* **Vert** - Le délai est parfait pour une bonne jam session

* **Jaune** - Une session est toujours possible mais elle peut être plus difficile à jouer

* **Rouge** - Le délai est trop important pour jouer

La LED **Tampons** indique l'état actuel de l'audio/du streaming. Si le voyant est **rouge**, le flux audio est interrompu. Cela peut être dû à l'un des problèmes suivants :

- Le tampon de gigue[^1] réseau n'est pas assez grand pour la gigue actuelle de l'interface réseau ou audio.
- Le délai de la carte son (taille de la mémoire tampon) est trop faible (voir la fenêtre des paramètres).
- Le debit montant ou le débit descendant est trop élevé pour votre bande passante Internet.
- Le processeur (CPU) du client ou du serveur est à 100 %.

### Niveau d'entrée

![Niveau d'entrée](https://user-images.githubusercontent.com/20726856/97363247-9516cc80-18a2-11eb-8195-1e887ee8040f.png)

Ceci indique le niveau des deux canaux stéréo pour votre entrée audio.
Veillez à ne pas écrêter le signal d'entrée pour éviter la saturation du signal audio (les LEDs indiquent l'écrêtage lorsqu'il se produit).



### Bouton _Tchate_

![Tchate](https://user-images.githubusercontent.com/20726856/97360717-d7d6a580-189e-11eb-84db-80536e17dc30.png)

Le texte saisi dans cette fenêtre est envoyé à tous les clients connectés.
Si un nouveau message de chat arrive et que la fenêtre du chat n'est pas encore ouverte, elle est ouverte automatiquement pour tous les clients.

### Profil de musicien

![Profil de musicien](https://user-images.githubusercontent.com/20726856/97360811-f9379180-189e-11eb-98bf-7f44f884adaa.png)

Dans le menu _Vue_, sélectionnez _Mon profil_ pour définir votre alias/nom qui s'affiche sous votre curseur dans le tableau de mixage audio du serveur. Si un instrument et/ou un pays est défini, les icônes pour ces paramètres seront également affichées sous votre curseur. Le paramètre de compétence modifie la couleur de fond du fader tag et l'entrée de la ville apparaît dans l'info-bulle du fader tag (voir la capture d'écran ci-dessous).

![Astuce pour les balises de curseur](https://user-images.githubusercontent.com/20726856/97360889-166c6000-189f-11eb-802d-330e761ed017.png)

### Bouton de connexion/déconnexion

Ouvre une fenêtre dans laquelle vous pouvez sélectionner un serveur auquel vous connecter. Si vous êtes connecté, en appuyant sur ce bouton, vous mettez fin à la session.

![Paramètres de connexion](https://user-images.githubusercontent.com/20726856/97360965-31d76b00-189f-11eb-870b-f58be6e30f04.png)

La fenêtre de configuration de la connexion affiche une liste des serveurs disponibles ainsi que le nombre de musiciens connectés, le nombre maximum d'utilisateur et le temps de réponse du serveur. Les administretaurs de serveurs peuvent, en option, référencer leurs serveurs par genre musical. Utilisez le menu déroulant Liste pour sélectionner un genre, cliquez sur le serveur que vous souhaitez rejoindre et appuyez sur le bouton Connexion pour vous y connecter. Vous pouvez également double-cliquer sur le nom du serveur. Les serveurs permanents (ceux qui ont été listés pendant plus de 24 heures) sont indiqués en gras.

Vous pouvez filtrer la liste par nom de serveur ou par emplacement. Pour ne répertorier que les serveurs occupés, entrez un caractère "#".

Si vous connaissez l'adresse IP ou l'URL d'un serveur, vous pouvez vous y connecter en utilisant le champ Nom/Adresse du serveur. Un numéro de port optionnel peut être ajouté après l'adresse IP ou l'URL en utilisant deux points comme séparateur, par exemple jamulus.example.com:22124. Le champ affichera également une liste des adresses de serveur les plus récemment utilisées.
Si le serveur écoute sur le port par défaut (22124) il n'est pas nécéssaire de le spécifier.

### Bouton _Me Silencer_

Coupe votre flux audio vers le serveur afin que vous puissiez vous entendre et voir vos propres niveaux d'entrée, mais pas les autres musiciens. Sachez que les autres musiciens ne sauront pas si vous vous êtes mis en sourdine.

### L'effet Réverb

![Réverb](https://user-images.githubusercontent.com/20726856/97361142-6e0acb80-189f-11eb-8fd7-e03aa4ffc662.png)

La réverbération peut être appliquée à un canal audio mono local ou aux deux canaux en mode stéréo.
La sélection du canal mono et le niveau de réverbération peuvent être modifiés. Par exemple, si un signal de microphone est envoyé sur le canal audio droit de la carte son et qu'un effet de réverbération doit être appliqué, réglez le sélecteur de canal sur la droite et déplacez le curseur vers le haut jusqu'à ce que le niveau de réverbération souhaité soit atteint.

### Contrôle local du panoramique et de la balance audio

![Panoramique ou Balance audio](https://user-images.githubusercontent.com/20726856/97361250-8c70c700-189f-11eb-82c2-9a9d768dcfff.png)

Contrôle les niveaux relatifs des canaux audio locaux gauche et droit. Pour un signal mono, il agit comme un panoramique entre les deux canaux. Par exemple, si un microphone est connecté au canal d'entrée droit et qu'un instrument est connecté au canal d'entrée gauche qui est beaucoup plus fort que le microphone, déplacez le fader audio dans une direction où l'étiquette au-dessus du fader indique G (ou D) -x, où x est l'indicateur d'atténuation actuel.

### Mélangeur audio du serveur

![Faders audio](https://user-images.githubusercontent.com/20726856/97361324-a5797800-189f-11eb-80d4-3a93e5728b99.png)

Dans le mélangeur audio, un fader est affiché pour chaque client connecté au serveur (y compris vous-même). Les faders vous permettent d'ajuster le niveau de ce que vous entendez sans affecter ce que les autres entendent.

Le VU-mètre indique le niveau d'entrée au serveur, c'est-à-dire le son envoyé.

Si vous avez réglé votre canal audio sur Stéréo ou Sortie Stéréo dans vos paramètres, vous verrez également un contrôle de panoramique.

Si vous voyez une icône "muet" au-dessus d'un canal, cela signifie que le musicien ne peut pas vous entendre. Soit ils vous ont mis en sourdine, soit ils ont mis en solo un ou plusieurs canaux sans inclure le vôtre, soit ils ont réglé votre fader dans leur mixage à zéro.

L'utilisation du bouton **Mute** empêche d'entendre le canal séléctionné dans votre mixage local. Sachez que lorsque vous mettez un musicien en sourdine, il verra une icône "muet" au-dessus de votre fader pour indiquer que vous ne l'entendez pas. Notez également que vous continuerez à voir leurs VU-mètres bouger si le son du musicien mis en sourdine atteint le serveur. La position de votre fader n'est pas non plus affectée.

Le bouton **Solo** vous permet d'entendre un ou plusieurs musiciens seuls. Ceux qui ne sont pas en solo seront mis en sourdine. Notez également que les musiciens qui ne sont pas en solo verront une icône "muet" au-dessus de votre curseur.

Les canaux sont répertoriés de gauche à droite dans l'ordre dans lequel les clients se connectent jusqu'à ce qu'ils partent, leur "créneau" étant alors rempli par le nouvel arrivant suivant. Vous pouvez modifier l'ordre de tri en utilisant l'option "Modifier" dans le menu de l'application.

Vous pouvez regrouper les canaus en utilisant le bouton "groupe". Si vous déplacez le fader d'un membre du groupe, les autres faders de ce groupe seront déplacés dans la même proportion.

Si l'administrateur du serveur a activé l'enregistrement, vous verrez un message au-dessus du mélangeur indiquant que vous êtes en train d'être enregistré.



Fenêtre des paramètres
----------------------

![Paramètres](https://user-images.githubusercontent.com/20726856/97361399-c4780a00-189f-11eb-8ad0-6b94f7eb1dcc.png)

### Interface audio

![Interface audio sous Windows](https://user-images.githubusercontent.com/20726856/97361494-e70a2300-189f-11eb-9095-2c34ad07314d.png)
![Interface audio sous MacOS](https://user-images.githubusercontent.com/20726856/97361570-02752e00-18a0-11eb-8475-e92a57ce6ae7.png)

Le pilote ASIO (carte son) peut être sélectionné à l'aide de Jamulus sous le système d'exploitation Windows. Si le pilote ASIO sélectionné n'est pas valide, un message d'erreur s'affiche et le pilote valide précédent est sélectionné. Sous le système d'exploitation MacOS, le matériel d'entrée et de sortie peut être sélectionné.

### Configuration des canaux d'entrée/sortie

![Sélection des entrées/sorties](https://user-images.githubusercontent.com/20726856/97361637-1caf0c00-18a0-11eb-9b65-81225b7e3dd5.png)

Si le dispositif de carte son sélectionné offre plus d'un canal d'entrée ou de sortie, les paramètres de configuration de la cartographie des canaux d'entrée et de sortie sont visibles. Pour chaque canal d'entrée/sortie Jamulus (canal gauche et droit), un canal différent de la carte son peut être sélectionné.

### Activer les petits tampons de réseau

Permet la prise en charge de très petits paquets audio en réseau. Ils ne sont utilisés que si le délai de la mémoire tampon de la carte son est inférieur à 128 échantillons. Plus les tampons réseau sont petits, plus la latence audio est faible. Mais en même temps, la charge du réseau augmente et la probabilité d'interruption de l'audio augmente également.

### Délai de temporisation

![Délai de temporisation](https://user-images.githubusercontent.com/20726856/97361710-3c463480-18a0-11eb-8d5c-07ed6590ccac.png)

Le réglage du délai de la mémoire tampon est un réglage fondamental du logiciel Jamulus. Ce réglage a une influence sur de nombreuses propriétés de la connexion. Trois tailles de mémoire tampon sont prises en charge :

- 2,67ms (64 samples) : Fournit la latence la plus faible mais ne fonctionne pas avec toutes les cartes son.
- 5,33ms (128 samples) : (le paramètre par défaut) Devrait fonctionner pour la plupart des cartes son disponibles.
- 10,67ms (256 samples) : Ne devrait être utilisé que sur des ordinateurs très lents, ou avec une connexion internet lente.

Certains pilotes de carte son ne permettent pas de modifier le délai de la mémoire tampon à partir du logiciel Jamulus.
Dans ce cas, le réglage du délai de la mémoire tampon est désactivé et doit être modifié à l'aide du pilote de la carte son. Sous Windows, appuyez sur le bouton ASIO Setup pour ouvrir le panneau des paramètres du pilote.

![Fenêtre du Délai de temporisation](https://user-images.githubusercontent.com/20726856/97361808-65ff5b80-18a0-11eb-88d6-fb2131f10c75.png)

Sous Linux, utilisez l'outil de configuration Jack pour modifier la taille de la mémoire tampon.

Le délai réel de la mémoire tampon a une influence sur l'état de la connexion, le taux de transfert actuel et le délai global.
Plus la taille de la mémoire tampon est faible, plus la probabilité d'un voyant rouge dans l'indicateur d'état (abandons) est élevée et plus le taux de transfert est élevé et le retard global est faible.

![Dépendances du Délai de temporisation](https://user-images.githubusercontent.com/20726856/97361878-816a6680-18a0-11eb-8c1f-fbf956be4b81.png)

Le réglage de la mémoire tampon est donc un compromis entre la qualité audio et le délai global.

### Tampon de gigue

![Tampon de gigue](https://user-images.githubusercontent.com/20726856/97361956-9b0bae00-18a0-11eb-85de-dc2ded891175.png)

Le tampon de gigue compense les gigues de synchronisation du réseau et de la carte son. La taille de la mémoire tampon influence donc la qualité du flux audio (le nombre d'interruptions) et le retard global
(plus le tampon est long, plus le délai est important).

Vous pouvez définir manuellement la taille du tampon de gigue pour le client local et le serveur distant. Pour la mémoire tampon de jitter locale, les pertes de flux audio sont indiquées par le voyant situé sous les curseurs de taille de la mémoire tampon de jitter.
Si le voyant devient rouge, cela signifie qu'il y a eu un dépassement ou une sous-utilisation de la mémoire tampon et que le flux audio est interrompu.

Le réglage du tampon de gigue est donc aussi un compromis entre la qualité audio et le délai global.

Si le paramètre Auto est activé, les tampons de gigue du client local et du serveur distant sont automatiquement réglés en fonction des mesures de la gigue de synchronisation du réseau et de la carte son. Si la vérification automatique est activée, les curseurs de la taille des tampons de jitter sont désactivés (ils ne peuvent pas être déplacés avec la souris).

### Canaux Audio

![Canaux Audio](https://user-images.githubusercontent.com/20726856/97362020-b24a9b80-18a0-11eb-8a55-ee536b29460b.png)

Sélectionne le nombre de canaux audio à utiliser pour la communication entre le client et le serveur. Trois modes sont disponibles :

Les modes Mono et Stéréo utilisent respectivement un et deux canaux audio.

Entrée Mono/Sortie Stéréo : Le signal audio envoyé au serveur est mono mais le signal de retour est stéréo. Ceci est utile si la carte son a l'instrument sur un canal d'entrée et le microphone sur l'autre. Dans ce cas, les deux signaux d'entrée peuvent être mélangés sur un canal mono mais le mixage du serveur est entendu en stéréo.

L'activation du mode stéréo augmentera le débit de votre flux. Assurez-vous que votre débit ne dépasse pas la vitesse de téléchargement disponible de votre connexion internet.

En mode de streaming stéréo, aucune sélection de canal audio pour l'effet de réverbération ne sera disponible dans la fenêtre principale puisque l'effet est appliqué aux deux canaux dans ce cas.

### Qualité audio

![Qualité audio](https://user-images.githubusercontent.com/20726856/97362080-c42c3e80-18a0-11eb-87ac-9a4ca948bbcf.png)

Plus la qualité audio est élevée, plus le débit de données de votre flux audio est élevé. Assurez-vous que votre débit ne dépasse pas la vitesse de téléchargement disponible de votre connexion internet.

### Niveau de nouveau client

![Niveau de nouveau client](https://user-images.githubusercontent.com/20726856/97362173-e2923a00-18a0-11eb-8401-9ad71866f6b1.png)

Ce paramètre définit le niveau du canal d'un client nouvellement connecté, en pourcentage. Si un nouveau musicien se connecte au serveur actuel, il obtiendra le niveau initial spécifié si aucun autre niveau de canal provenant d'une connexion précédente de ce client n'a déjà été enregistré.

### Thème graphique

![Thème graphique](https://user-images.githubusercontent.com/20726856/97362214-f9389100-18a0-11eb-9adb-ebf2c1d18007.png)

Il s'agit d'appliquer un thème graphique à la fenêtre principale.

### Adresse personnalisée du serveur central

![Adresse du serveur central](https://user-images.githubusercontent.com/20726856/97362265-0a819d80-18a1-11eb-9b0c-2f7ecf21841c.png)

Laissez ce champ vide, sauf si vous devez entrer l'adresse d'un serveur central autre que celui par défaut.

### Paramètre de l'état actuel de la connexion

![Indicateurs de l'état de la connexion](https://user-images.githubusercontent.com/20726856/97362338-271dd580-18a1-11eb-99b7-02c9371a6258.png)

Le temps de ping est le temps nécessaire au flux audio pour aller du client au serveur et revenir.
Ce délai est introduit par le réseau et devrait être d'environ 20 à 30 ms. Si ce délai est supérieur à environ 50 ms, la distance qui vous sépare du serveur est trop importante ou votre connexion internet n'est pas suffisante.

Le délai global est calculé à partir du temps de ping actuel et du délai introduit par les paramètres actuels de la mémoire tampon.

Le débit audio en amont dépend de la taille actuelle des paquets audio et du réglage de la compression. Assurez-vous que le débit en amont n'est pas supérieur à votre vitesse de téléchargement Internet (vérifiez cela avec un service tel que [speedtest.net](http://speedtest.net)).

----
## Notes

[^1]: Dans le domaine des réseaux informatiques, la **gigue** (en anglais **jitter**) est la variation de la latence au fil du temps. _(Source : [Wikipédia](https://fr.wikipedia.org/wiki/Gigue_(informatique)){: target="_blank" rel="noopener noreferrer"})_
