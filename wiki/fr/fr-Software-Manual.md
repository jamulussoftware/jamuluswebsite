---
layout: wiki
title: "Manuel du logiciel"
lang: "fr"
permalink: "/wiki/Software-Manual"
---
# Manuel du logiciel Jamulus
{:.no_toc}

Ce manuel documente l'application client Jamulus destinée aux musiciens et chanteurs qui utilisent le logiciel pour se connecter à un serveur.

<details markdown="1">

<summary>Table of contents</summary>

* TOC
{:toc}

</details>  

# Fenêtre principale


<figure>
	<img src="{{site.url}}/assets/img/fr-screenshots/main-screen-medium.png" style="border: 5px solid grey;" loading="lazy" alt="Image de la fenêtre principale de Jamulus">
	<figcaption>Votre mixage local lorsqu'il est connecté à un serveur</figcaption>
</figure>

## Diodes d'êtat

Le voyant d'état **Delay** indique l'état actuel du délai audio :

<figure><img src="{{site.url}}/assets/img/fr-screenshots/led-green.png" style="float:left; margin-right:10px;" loading="lazy" alt="Image d'un symbole diode verte"></figure>

**Vert** - Le délai est parfait pour une session de jam.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/led-yellow.png" style="float:left; margin-right:10px;" loading="lazy" alt="Image d'un symbole diode jaune"></figure>

**Jaune** - Une session est toujours possible mais elle peut être plus difficile à jouer.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/led-red.png" style="float:left; margin-right:10px;" loading="lazy" alt="Image d'un symbole diode rouge"></figure>

**Rouge** - Le délai est trop important pour une session

Le voyant d'état **Buffers** indique l'état actuel du flux audio/du streaming. Si le voyant est **rouge**, le flux audio est interrompu. Cela est dû à l'un des problèmes suivants :

- Le tampon de gigue du réseau n'est pas assez grand pour la gigue actuelle de l'interface réseau/audio.
- Le délai de la mémoire tampon de la carte son (taille de la mémoire tampon) est trop faible (voir la fenêtre Paramètres).
- Le débit du flux en amont ou en aval est trop élevé pour votre bande passante Internet.
- Le CPU du client ou du serveur est à 100%.


## Niveau d'entrée

Ceci indique le niveau des deux canaux stéréo de votre entrée audio.
Veillez à ne pas écrêter le signal d'entrée afin d'éviter toute distorsion du signal audio (les diodes indiquent l'écrêtage lorsqu'il se produit).

## Bouton me silencer

Coupe votre flux audio vers le serveur afin que vous puissiez vous entendre et voir vos propres niveaux d'entrée, mais pas les autres musiciens. Sachez que les autres musiciens ne sauront pas si vous avez coupé votre son.

### Effet réverbération

La réverbération peut être appliquée à un canal audio mono local ou aux deux canaux en mode stéréo.
La sélection du canal mono et le niveau de réverbération peuvent être modifiés.
Par exemple, si un signal de microphone est envoyé sur le canal audio droit de la carte son et qu'un effet de réverbération doit être appliqué, réglez le sélecteur de canal sur la droite et déplacez le chariot vers la droite et déplacez le chariot vers le haut jusqu'à ce que le niveau de réverbération souhaité soit atteint.

## Bouton tchate

Le texte saisi dans cette boîte de dialogue est envoyé à tous les clients connectés. Si un nouveau message de tchate arrive et que la boîte de dialogue tchate n'est pas déjà ouverte, elle s'ouvre automatiquement pour tous les clients.

## Bouton connecter/déconnecter

Ouvre une boîte de dialogue dans laquelle vous pouvez sélectionner un serveur auquel vous connecter. Si vous êtes connecté, appuyez sur ce bouton pour mettre fin à la session.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/connection-setup-window.png" style="border: 5px solid grey;" loading="lazy" alt="Image d'une fenêtre de connexion au serveurs"></figure>

La fenêtre de configuration de la connexion affiche une liste des serveurs disponibles ainsi que le nombre d'occupants et le nombre maximum supporté. Les opérateurs de serveurs enregistrent leurs serveurs sur des listes (la plupart du temps définies par genre, bien que certaines puissent être spécifiques à un lieu ou pour tous les genres). Utilisez le menu déroulant Liste pour sélectionner un genre, cliquez sur le serveur que vous souhaitez rejoindre et appuyez sur le bouton Connecter pour vous y connecter. Vous pouvez également double-cliquer sur le nom du serveur. Les serveurs permanents (ceux qui sont répertoriés depuis plus de 24 heures) sont affichés en gras.

Vous pouvez filtrer la liste par nom de serveur ou par emplacement. Pour ne répertorier que les serveurs occupés, saisissez le caractère "#".

Si vous connaissez l'adresse IP ou l'URL d'un serveur, vous pouvez vous y connecter en remplissant le champ Nom/adresse du serveur. Un numéro de port facultatif peut être ajouté après l'adresse IP ou l'URL en utilisant deux points comme séparateur, par exemple `jamulus.example.com:22124`. Le champ affichera également une liste des adresses de serveur les plus récemment utilisées.

## Mélangeur audio du serveur

<figure><img src="{{site.url}}/assets/img/fr-screenshots/mixer-channles.png" style="float:left; margin-right:10px; margin-bottom:20px; border: 5px solid grey;" loading="lazy" alt="Image d'une paire de commandes de mélangeur de serveur"></figure>

L'écran du mélangeur audio affiche chaque utilisateur connecté au serveur (y compris vous-même).
Les chariots vous permettent de régler le niveau de ce que vous entendez sans affecter ce que les autres entendent.

Le VU-mètre indique le niveau d'entrée sur le serveur, c'est-à-dire le son envoyé.

Si vous avez réglé votre canal audio sur Stéréo ou Sortie stéréo dans vos paramètres, vous verrez également un contrôle de panoramique (shift-cliquer pour le réinitialiser).

Si vous voyez une icône "silencé" au-dessus d'un utilisateur, cela signifie que cette personne ne peut pas vous entendre. Soit il a coupé votre son, soit il a mis en solo un ou plusieurs utilisateurs dont vous ne faites pas parti, soit il a mis votre chariot à zéro dans son mixage.

L'utilisation du bouton **Silencer** empêche les utilisateurs d'être entendus dans votre mixage local. Sachez que lorsque vous mettez quelqu'un en sourdine, une icône "sourdine" apparaît au-dessus de votre chariot pour indiquer que vous ne pouvez pas l'entendre. Notez également que vous continuerez à voir leurs VU-mètres bouger si le son de l'utilisateur mis en sourdine atteint le serveur. La position de votre fader pour eux n'est pas affectée non plus.

Le bouton **Solo** vous permet d'entendre un ou plusieurs utilisateurs seuls. Ceux qui ne sont pas en solo seront mis en sourdine. Notez également que les personnes qui ne sont pas en solo verront une icône "silencé" au-dessus de votre chariot.

Les utilisateurs sont répertoriés de gauche à droite dans l'ordre de leur connexion. Vous pouvez modifier l'ordre de tri en utilisant l'option Editer dans le menu de l'application.

Vous pouvez regrouper des utilisateurs à l'aide du bouton "group". Si vous déplacez le chariot d'un membre du groupe, les autres chariots de ce groupe seront déplacés de la même manière. Vous pouvez isoler temporairement un canal du groupe avec shift-clic-glisser.

Si l'opérateur du serveur a activé l'enregistrement, vous verrez un message au-dessus de la table de mélange indiquant que vous êtes enregistré.


# Paramètres

## Mon profil

Dans le menu Affichage, sélectionnez Mon profil... Pour définir votre alias/nom qui s'affiche sous votre chariot dans la table de mixage audio du serveur.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/profile-window.png" style="border: 5px solid grey;" loading="lazy" alt="Image de la fenêtre de profil"></figure>

Si un instrument et/ou un pays est défini, les icônes de ces sélections s'affichent également sous votre chariot. Le paramètre de compétence change la couleur de fond de l'étiquette du fader et l'entrée de la ville s'affiche dans l'info-bulle de l'étiquette du chariot.

<figure><img src="{{site.url}}/assets/img/fr-screenshots/profile-tooltip.png" loading="lazy" alt="Image d'une infobulle montrant les informations du profil"></figure>

### Habillage

Ceci applique un habillage à la fenêtre principale, dont certains sont conçus pour accueillir des ensembles plus importants.

### Rangées du mixeur

Ce paramètre définit le nombre de rangées affichées dans le mixeur audio du serveur, pour une utilisation avec de plus grands ensembles.

## Configuration audio/réseau

<figure><img src="{{site.url}}/assets/img/fr-screenshots/settings-network.png" style="border: 5px solid grey;" loading="lazy" alt="Image de la fenêtre réseau"></figure>

### Périphérique

Sous le système d'exploitation Windows, le pilote ASIO (carte son) peut être sélectionné à l'aide de Jamulus. Si le pilote ASIO sélectionné n'est pas valide, un message d'erreur s'affiche et le pilote valide précédent est sélectionné. Sous macOS, le matériel d'entrée et de sortie peut être sélectionné. Sous Linux, Jack est sélectionné automatiquement.

### Mappage des canaux d'entrée/sortie

<figure><img src="{{site.url}}/assets/img/fr-screenshots/channel-mapping.png" style="float:left ; margin-right:10px ; margin-bottom:20px ;" loading="lazy" alt="Image du mappage des canaux d'entrée et de sortie"></figure>.

Si le périphérique de la carte son sélectionné offre plus d'un canal d'entrée ou de sortie, les paramètres _Input Channel Mapping et Output Channel Mapping_ sont visibles. Pour chaque canal d'entrée/sortie Jamulus (canal gauche et droit) un canal réel différent de la carte son peut être sélectionné.

### Canaux audio

Permet de sélectionner le nombre de canaux audio à utiliser pour la communication entre le client et le serveur. Trois modes sont disponibles :

Les modes **Mono** et **Stereo** utilisent respectivement un et deux canaux audio.

**Mono-in/Stereo-out** : Le signal audio envoyé au serveur est mono mais le signal de retour est stéréo. Ceci est utile si la carte son capture un instrument sur un canal d'entrée et un microphone sur l'autre. Dans ce cas les deux signaux d'entrée peuvent être mixés sur un canal mono, mais le mixage du serveur est entendu en stéréo.

L'activation du mode stéréo augmente le débit de données de votre flux. Assurez-vous que votre taux d'upload ne dépasse pas la vitesse de chargement disponible de votre connexion Internet.

En mode de streaming stéréo, aucune sélection de canal audio pour l'effet de réverbération n'est disponible dans la fenêtre principale car l'effet est appliqué en mode stéréo.

### Qualité audio

Plus la qualité audio est élevée, plus le débit de données de votre flux audio est élevé. Assurez-vous que votre taux de téléchargement ne dépasse pas la vitesse de téléchargement disponible de votre connexion Internet.

### Délai de mise en mémoire tampon

Le paramètre de délai de mise en mémoire tampon est un paramètre fondamental du logiciel Jamulus. Ce paramètre a une influence sur de nombreuses propriétés de la connexion. Trois tailles de tampon sont prises en charge :

- **64 échantillons** Le paramètre préféré. Fournit la latence la plus faible mais ne fonctionne pas avec toutes les cartes son.
- 128 échantillons** Devrait fonctionner avec la plupart des cartes son disponibles.
- 256 échantillons** Ne doit être utilisé que sur des ordinateurs très lents, ou avec une connexion Internet lente.

Certains pilotes de carte son ne permettent pas de modifier le délai de mise en mémoire tampon à partir du logiciel Jamulus.
Dans ce cas, le réglage du délai de mise en mémoire tampon est désactivé et doit être modifié à l'aide du pilote de la carte son. Sous Windows, appuyez sur le bouton ASIO Setup pour ouvrir le panneau de configuration du pilote.

Sous Linux, utilisez l'outil de configuration JACK pour modifier la taille du tampon.

Le délai réel de la mémoire tampon a une influence sur l'état de la connexion, le taux de chargement actuel et le délai global.
Plus la taille de la mémoire tampon est faible, plus la probabilité d'un voyant rouge dans l'indicateur d'état (abandons) est élevée et plus le débit de chargement est élevé et plus le délai global est faible.

Le réglage de la mémoire tampon est donc un compromis entre la qualité audio et le délai global.

### Tampon de gigue

Le tampon de gigue compense les glissements de temps du réseau et de la carte son. La taille de la mémoire tampon.
La taille de la mémoire tampon influe donc sur la qualité du flux audio (nombre d'interruptions) et sur le délai global (plus la mémoire tampon est longue, plus le délai est élevé).

Vous pouvez définir manuellement la taille du tampon de gigue pour votre client local et le serveur distant. Pour le tampon de gigue local, les interruptions du flux audio sont indiquées par le voyant situé sous les curseurs de taille de la mémoire tampon de gigue.
Si le voyant passe au rouge, cela signifie qu'il y a eu dépassement de la mémoire tampon et que le flux audio est interrompu.

Le réglage de la mémoire tampon de gigue est donc un compromis entre la qualité audio et le délai global.

Si le paramètre Auto est activé, les mémoires tampon de gigue de votre client local et du serveur distant sont définis automatiquement en fonction des mesures de la gigue temporelle du réseau et de la carte son. Si le contrôle Auto est activé, les faders de taille de la mémoire tampon de gigue sont désactivés (ils ne peuvent pas être déplacés avec la souris).

### Activer les petits tampons réseau

Permet la prise en charge de très petits paquets audio réseau. Ceux-ci ne sont utilisés que si le délai de la mémoire tampon de la carte son est inférieur à 128 échantillons. Plus les tampons réseau sont petits, plus la latence audio est faible. Mais dans le même temps, la charge du réseau augmente et la probabilité de pertes audio augmente également.

### Mesures

Le temps de ping est le temps nécessaire au flux audio pour aller du client au serveur et inversement.
Ce délai est introduit par le réseau et devrait idéalement être d'environ 20-30 ms. Lorsque ce délai est supérieur à environ 50 ms, il commence à devenir plus perceptible et vous aurez peut-être plus de mal à suivre le rythme, même si cela reste possible une fois que vous vous y serez habitué. Des facteurs tels que le tempo, l'instrument joué ou l'isolation de votre casque auront un impact sur le retard que vous pouvez supporter. 
Les causes les plus probables d'un retard élevé sont que la distance qui vous sépare du serveur est trop grande ou que votre connexion internet n'est pas suffisante.

Le délai global est calculé à partir du temps de ping actuel et du délai introduit par les paramètres actuels de la mémoire tampon.

Le débit audio en amont dépend de la taille actuelle des paquets audio et du paramètre de compression. Assurez-vous que le débit amont n'est pas supérieur à votre vitesse de téléchargement Internet disponible (vérifiez-le avec un service tel que [librespeed.org](https://librespeed.org/)).

## Configuration avancée

<figure><img src="{{site.url}}/assets/img/fr-screenshots/settings-advanced.png" style="border : 5px solid grey ;" loading="lazy" alt="Image de la fenêtre paramètres avancés"></figure>

### Adresse du serveur de répertoire personnalisé

Laissez ce champ vide, sauf si vous devez entrer l'adresse d'un serveur annuaire autre que celui par défaut.

### Niveau des nouveaux clients

Ce paramètre définit le niveau du chariot d'un client nouvellement connecté en pourcentage. Si un nouvel utilisateur se connecte au serveur actuel, il obtiendra le niveau de chariot initial spécifié si aucun autre niveau de chariot d'une précédente connexion de cet utilisateur n'était déjà enregistré. Vous pouvez définir tous les utilisateurs d'un serveur occupé à ce niveau en utilisant Editer > "Régler tous les chariots sur le niveau d'un nouveau client".

### Amplification de l'entrée

Augmente le gain de votre appareil. Utilisez cette fonction si votre appareil délivre un gain trop faible pour Jamulus.

### Protection contre le larsen

Tente de détecter les boucles de rétroaction audio. Une fois détectée, cette fonction active le bouton "Me silencer" et affiche un message d'explication pour vous permettre de résoudre le problème.

### Balance d'entrée

Contrôle les niveaux relatifs des canaux audio locaux gauche et droit. Pour un signal mono
il agit comme un panoramique entre les deux canaux. Par exemple, si un microphone est connecté au canal d'entrée droit et qu'un instrument est connecté au canal d'entrée gauche, la balance d'entrée agit comme un panoramique entre les deux canaux.
Un instrument est connecté au canal d'entrée gauche et est beaucoup plus fort que le microphone, déplacez le fader audio pour augmenter le volume relatif du microphone.
