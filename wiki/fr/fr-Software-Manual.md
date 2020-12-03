---
layout: wiki
title: "Manuel du logiciel"
lang: "fr"
permalink: "/wiki/Software-Manual"
---
Aide Jamulus (Manuel du Logiciel)
=================================
_(Note : les copies d'écran ont été faites avec l'interface en anglais, les termes utilisés dans ce manuel correspondent aux termes employés dans l'interface du logiciel en français.)_

Fenêtre principale
------------------

![Fenêtre principale](https://user-images.githubusercontent.com/20726856/97360410-77476880-189e-11eb-99c6-f4a68258bf31.png)

### LEDs d'état

La LED **Délai** indique l'état actuel du retard audio :

* **Vert** - Le délai est parfait pour une bonne session

![image](https://user-images.githubusercontent.com/4561747/99384024-b6c60b00-28c6-11eb-9e7d-aa1e4245353f.png)

* **Jaune** - Une session est toujours possible mais elle peut être plus difficile à jouer

![image](https://user-images.githubusercontent.com/4561747/99384041-bb8abf00-28c6-11eb-96ab-c1c08acf2a85.png)

* **Rouge** - Le délai est trop important pour jouer

![image](https://user-images.githubusercontent.com/4561747/99384044-bded1900-28c6-11eb-8971-9ab6ee1908b5.png)


**Tampons** indique l'état actuel de l'audio/du streaming. Si le voyant est **rouge**, le flux audio est interrompu. Cela peut être dû à l'un des problèmes suivants :

- Le tampon de gigue[^1] réseau n'est pas assez grand pour la gigue actuelle de l'interface réseau/audio.
- Le délai de l'interface audio (taille de la mémoire tampon) est trop faible (voir la fenêtre des paramètres).
- Le débit montant ou descendant est trop élevé pour votre bande passante Internet.
- Le processeur du client ou du serveur est à 100 %.

### Niveau d'entrée

![Niveau d'entrée](https://user-images.githubusercontent.com/20726856/97363247-9516cc80-18a2-11eb-8195-1e887ee8040f.png)

Ceci indique le niveau des deux canaux stéréo pour votre entrée audio.
Veillez à ne pas écrêter le signal d'entrée pour éviter une distorsion du signal audio (les LEDs indiquent l'écrêtage lorsqu'il se produit).

### Bouton _Tchate_

![Fenêtre « Tchate »](https://user-images.githubusercontent.com/20726856/97360717-d7d6a580-189e-11eb-84db-80536e17dc30.png)

Le texte saisi dans cette fenêtre est envoyé à tous les clients connectés.
Si un nouveau message de tchate arrive et que la fenêtre du tchate n'est pas encore ouverte, elle est ouverte automatiquement pour tous les clients.

### Profil de musicien

![Fenêtre « Profil de musicien »](https://user-images.githubusercontent.com/20726856/97360811-f9379180-189e-11eb-98bf-7f44f884adaa.png)

Dans le menu Vue, sélectionnez Mon profil… pour définir votre pseudo qui s'affiche sous votre potentiomètre dans la console de mixage audio du serveur. Si un instrument et/ou un pays est défini, les icônes correspondant à ces choix seront également affichées sous votre potentiomètre. Le paramètre de compétence modifie la couleur de fond du de l'etiquette du potentiomètre et l'entrée de la ville apparaît dans l'info-bulle à son survol (voir la capture d'écran ci-dessous).

![Info-bulle de l'étiquette du potentiomètre](https://user-images.githubusercontent.com/20726856/97360889-166c6000-189f-11eb-802d-330e761ed017.png)

### Bouton de connexion/déconnexion

Ouvre une boîte de dialogue dans laquelle vous pouvez sélectionner un serveur auquel vous connecter. Si vous êtes connecté, en appuyant sur ce bouton, vous mettez fin à la session.

![Fenêtre « Paramètres de connexion »](https://user-images.githubusercontent.com/20726856/97360965-31d76b00-189f-11eb-870b-f58be6e30f04.png)

La fenêtre de configuration de la connexion affiche une liste des serveurs disponibles avec le nombre de musiciens y étants connecté et le nombre maximum d'utilisateur accepté. Les administrateurs de serveurs peuvent optionellement référencer leurs serveurs par genre musical. Utilisez le menu déroulant Liste pour sélectionner un genre, cliquez sur le serveur que vous souhaitez rejoindre et appuyez sur le bouton Se connecter pour vous y connecter. Vous pouvez également double-cliquer sur le nom du serveur. Les serveurs permanents (ceux qui ont été listés pendant plus de 24 heures) sont indiqués en gras.

Vous pouvez filtrer la liste par nom de serveur ou par emplacement. Pour ne répertorier que les serveurs occupés, entrez un caractère « # ».

Si vous connaissez l'adresse IP ou l'URL d'un serveur, vous pouvez vous y connecter en utilisant le champ Adresse du serveur. Un numéro de port optionnel peut être ajouté après l'adresse IP ou l'URL en utilisant le deux-points comme séparateur, par ex. jamulus.example.com:22124. Le champ affichera également une liste des serveurs les plus utilisées récemment.

### Bouton Me Silencer

Coupe votre flux audio vers le serveur afin que vous puissiez vous entendre et voir vos propres niveaux d'entrée, mais pas les autres musiciens. Sachez que les autres musiciens ne sauront pas si vous vous êtes mis en silence.

### L'effet Réverb

![Réverb](https://user-images.githubusercontent.com/20726856/97361142-6e0acb80-189f-11eb-8fd7-e03aa4ffc662.png)

La réverbération peut être appliquée à un canal audio mono local ou aux deux canaux en mode stéréo.
La sélection du canal mono et le niveau de réverbération peuvent être modifiés. Par exemple, si le signal d'un micro est envoyé sur le canal audio de droite de l'interface audio et que vous voullez y appliquer un effet de réverbération, réglez le sélecteur de canal sur le canal de droite et déplacez le curseur vers le haut jusqu'à ce que le niveau de réverbération souhaité soit atteint.

### Contrôle local du panoramique/de la balance audio

![Panoramique/Balance audio locale](https://user-images.githubusercontent.com/20726856/97361250-8c70c700-189f-11eb-82c2-9a9d768dcfff.png)

Contrôle les niveaux relatifs des canaux audio locaux gauche et droite. Pour un signal mono, il agit comme un panoramique entre les deux canaux. Par exemple, si un micro est connecté au canal d'entrée de droite et qu'un instrument est connecté au canal d'entrée de gauche qui est beaucoup plus fort que le micro, déplacez le curseur dans une direction où l'étiquette au-dessus du potentiomètre indique G -x, où x est l'indicateur d'atténuation.

### Console de mixage du serveur

![Potentiomètres](https://user-images.githubusercontent.com/20726856/97361324-a5797800-189f-11eb-80d4-3a93e5728b99.png)

Dans le cadre de la console de mixage, un potentiomètre rectiligne est affiché pour chaque client connecté au serveur (y compris vous-même). Les potentiomètres vous permettent d'ajuster le niveau de ce que vous entendez sans affecter ce que les autres entendent.

Le VU-mètre indique le niveau d'entrée au serveur, c'est-à-dire le son envoyé.

Si vous avez réglé votre canal audio sur Stéréo ou Sortie Stéréo dans vos paramètres, vous verrez alors un contrôle de balance audio (Maj-clic-droit pour réinitialiser).

Si vous voyez une icône « muet » au-dessus d'un canal, cela signifie que ce musicien ne peut pas vous entendre. Soit il vous a mis en silence, soit il a mis en solo un ou plusieurs canaux sans inclure le vôtre, soit il a réglé votre potentiomètre dans son mixage à zéro.

L'utilisation du **bouton Muet** empêche d'entendre le canal sélectionné dans votre mixage local. Sachez que lorsque vous mettez un musicien en silence, il verra une icône « muet » au-dessus de votre potentiomètre pour indiquer que vous ne l'entendez pas. Notez également que vous continuerez à voir son VU-mètre bouger si le signal du musicien mis en sourdine atteint le serveur. La position de votre potentiomètre pour eux n'est pas affectée non plus.

Le **bouton Solo** vous permet d'entendre un ou plusieurs musiciens seuls. Ceux qui ne sont pas en solo seront mis en silence. Notez également que ces musiciens qui ne sont pas en solo verront une icône « muet » au-dessus de votre potentiomètre.

Les canaux sont répertoriés de gauche à droite dans l'ordre dans lequel les clients se connectent jusqu'à ce qu'ils partent, leur « créneau » étant alors occupé par le nouvel arrivant suivant. Vous pouvez modifier l'ordre de tri en utilisant l'option Éditer dans le menu de l'application.

Vous pouvez regrouper les canaux audio en utilisant le commutateur « groupe ». Déplacer le potentiomètre de n'importe quel membre du groupe va agir sur les autres potentiomètres de ce groupe avec une proportion identique. Vous pouvez isoler temporairement un canal du groupe avec Maj-clic-glisser.

Si l'administrateur du serveur a activé l'enregistrement, vous verrez un message au-dessus de la console de mixage indiquant que vous êtes en train d'être enregistré.



Fenêtre des paramètres
----------------------

![image](https://user-images.githubusercontent.com/20726856/97361399-c4780a00-189f-11eb-8ad0-6b94f7eb1dcc.png)

### Périphérique audio

![Périphérique audio sous Windows](https://user-images.githubusercontent.com/20726856/97361494-e70a2300-189f-11eb-9095-2c34ad07314d.png)
![Périphérique audio sous MacOS](https://user-images.githubusercontent.com/20726856/97361570-02752e00-18a0-11eb-8475-e92a57ce6ae7.png)

Le pilote ASIO (Périphérique) peut être sélectionné à l'aide de Jamulus sous le système d'exploitation Windows. Si le pilote ASIO sélectionné n'est pas valide, un message d'erreur s'affiche et le pilote valide précédent est sélectionné. Sous le système d'exploitation Mac, le matériel d'entrée et de sortie peut être sélectionné.

### Assignation des canaux d'entrée/sortie

![Cartographie des canaux](https://user-images.githubusercontent.com/20726856/97361637-1caf0c00-18a0-11eb-9b65-81225b7e3dd5.png)

Si le périphérique audio sélectionné fournit plus d'un canal d'entrée ou de sortie, les _Cartographie des canaux d'entrée_ et _Cartographie des canaux de sortie_ sont visibles. Pour chaque canal d'entrée/sortie Jamulus (canal gauche et droite), un canal différent de l'actuel périphérique audio peut être sélectionné.

### Activer les petits tampons de réseau

Permet la prise en charge des très petits paquets audio réseau. Ils ne sont utilisés que si le délai du tampon du périphérique audio est inférieur à 128 échantillons. Plus les tampons réseau sont petits, plus la latence audio est faible. Mais en même temps la charge réseau augmente et la probabilité de décrochage audio augmente également.

### Délai de temporisation

![Délai de temporisation](https://user-images.githubusercontent.com/20726856/97361710-3c463480-18a0-11eb-8d5c-07ed6590ccac.png)

Le réglage du délai de temporisation est un réglage fondamental pour le logiciel Jamulus. Ce réglage a une influence sur de nombreuses propriétés de la connexion. Trois tailles de mémoire tampon sont prises en charge :

- 64 échantillons : le paramètre à choisir de préférence, fournit la latence la plus faible mais ne fonctionne pas avec toutes les interfaces audio.
- 128 échantillons : devrait fonctionner pour la plupart des interfaces audio disponibles.
- 256 échantillons : ne devrait être utilisé que sur des ordinateurs très lents, ou avec une connexion internet avec une bande passante lente.

Certains pilotes de périphérique audio ne permettent pas de modifier le délai de tampon à partir de Jamulus.
Dans ce cas, le réglage du délai de temporisation est désactivé et doit être modifié à l'aide du pilote du périphérique audio. Sous Windows, appuyez sur le bouton Configuration ASIO pour ouvrir le panneau des paramètres du pilote.

![Fenêtre du Délai de tampon Windows](https://user-images.githubusercontent.com/20726856/97361808-65ff5b80-18a0-11eb-88d6-fb2131f10c75.png)

Sous Linux, utilisez l'outil de configuration Jack pour modifier la taille du tampon.

Le délai actuel du tampon a une influence sur l'état de la connexion, le taux de transfert courant et le délai global.
Plus la taille du tampon est faible, plus la probabilité d'un voyant rouge dans l'indicateur d'état (décrochages) est élevée et plus le taux de transfert est élevé et le délai global est faible.

![Dépendances du délai de tempon](https://user-images.githubusercontent.com/20726856/97361878-816a6680-18a0-11eb-8c1f-fbf956be4b81.png)

Le réglage du tampon est donc un compromis entre la qualité audio et le délai global.

### Tampon de gigue avec indicateur d'état du tampon

![Tampon de gigue](https://user-images.githubusercontent.com/20726856/97361956-9b0bae00-18a0-11eb-85de-dc2ded891175.png)

Le tampon de gigue compense les gigues de synchronisation du réseau et de la carte son. La taille du tampon influence donc la qualité du flux audio (le nombre de décrochages) et le délai global (plus le tampon est long, plus le délai est important).

Vous pouvez définir manuellement la taille du tampon de gigue pour le client local et le serveur distant. Pour le tampon de gigue locale, les décrochages dans le flux audio sont indiqués par le voyant lumineux situé sous les curseurs de taille de tampon de gigue.
Si le voyant devient rouge, un dépassement ou une sous-utilisation du tampon a eu lieu et le flux audio est interrompu.

Le réglage du tampon de gigue est donc aussi un compromis entre la qualité audio et le délai global.

Si le paramètre Auto est activé, les tampons de gigue du client local et du serveur distant sont automatiquement réglés en fonction des mesures de la gigue de synchronisation du réseau et du périphérique audio. Si la vérification automatique est activée, les curseurs de la taille des tampons de gigue sont désactivés (ils ne peuvent pas être déplacés avec la souris).

### Canaux audio

![Canaux audio](https://user-images.githubusercontent.com/20726856/97362020-b24a9b80-18a0-11eb-8a55-ee536b29460b.png)

Sélectionne le nombre de canaux audio à utiliser pour la communication entre le client et le serveur. Trois modes sont disponibles :

Les modes Mono et Stéréo utilisent respectivement un et deux canaux audio.

Mono-entrée/stéréo-sortie : le signal audio envoyé au serveur est mono mais le signal de retour est stéréo. C'est utile si le périphérique audio a l'instrument sur un canal d'entrée et le micro sur l'autre. Dans ce cas, les deux signaux d'entrée peuvent être mélangés sur un canal mono mais le mixage du serveur est entendu en stéréo.

L'activation du mode stéréo augmentera le débit de données de votre flux. Assurez-vous que votre débit montant ne dépasse pas la vitesse montante disponible pour votre connexion internet.

En mode de flux stéréo, aucune sélection de canal audio pour l'effet de réverbération ne sera disponible dans la fenêtre principale puisque l'effet est alors appliqué aux deux canaux du signal stéréo dans ce cas.

### Qualité audio

![Qualité audio](https://user-images.githubusercontent.com/20726856/97362080-c42c3e80-18a0-11eb-87ac-9a4ca948bbcf.png)

Plus la qualité audio est élevée, plus le débit de données de votre flux audio est élevé. Assurez-vous que votre débit montant ne dépasse pas la vitesse montante disponible pour votre connexion internet.

### Niveau de nouveau client

![Niveau de nouveau client](https://user-images.githubusercontent.com/20726856/97362173-e2923a00-18a0-11eb-8401-9ad71866f6b1.png)

Ce paramètre définit le niveau du canal d'un client nouvellement connecté, en pourcentage. Si un nouveau musicien se connecte au serveur courant, il obtiendra le niveau initial spécifié si aucun autre niveau de canal provenant d'une connexion précédente de ce même client n'a déjà été enregistré. Vous pouvez configurer tous les clients d'un serveur occupé à ce niveau en utilisant Éditer > « Régler tous les chariots sur niveau d'un nouveau client ».

### Thème fantaisie

![Thème fantaisie](https://user-images.githubusercontent.com/20726856/97362214-f9389100-18a0-11eb-9adb-ebf2c1d18007.png)

Il s'agit d'appliquer un thème fantaisie à la fenêtre principale.

### Adresse personnalisée du serveur central

![Adresse du serveur central](https://user-images.githubusercontent.com/20726856/97362265-0a819d80-18a1-11eb-9b0c-2f7ecf21841c.png)

Laissez ce champ vide, sauf si vous devez entrer l'adresse d'un serveur central autre que celui par défaut.

### Paramètre de l'état actuel de la connexion

![Indicateurs](https://user-images.githubusercontent.com/20726856/97362338-271dd580-18a1-11eb-99b7-02c9371a6258.png)

Le temps de réponse est le temps nécessaire au flux audio pour faire l'aller-retour entre le client et le serveur.
Ce délai est introduit par le réseau et devrait être d'environ 20 à 30 ms. Si le délai est supérieur à environ 50 ms, la distance qui vous sépare du serveur est trop importante ou votre connexion internet n'est pas suffisante.

Le délai global est calculé à partir du « ping » actuel et du délai introduit par les paramètres actuel du tampon.

Le débit montant de l'audio dépend de la taille actuelle des paquets audio et du réglage de la qualité audio. Assurez-vous que le débit montant n'est pas supérieur à votre vitesse montante Internet (vérifiez ça avec un service tel que [speedtest.net](http://speedtest.net)).

----
## Notes

[^1]: dans le domaine des réseaux informatiques, la **gigue** (en anglais **jitter**) est la variation de la latence au fil du temps. _(Source : [Wikipédia](https://fr.wikipedia.org/wiki/Gigue_(informatique)){: target="_blank" rel="noopener noreferrer"})_
