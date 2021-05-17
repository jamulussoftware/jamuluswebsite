---
layout: wiki
title: "Installation sous Linux"
lang: "fr"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation pour Linux
Assurez-vous de lire la page [Configuration](Getting-Started).

### Debian et Ubuntu

1. Téléchargez le [dernier fichier .deb]({{ site.download_root_link }}{ site.download_file_names.deb-gui }})
1. Mettez à jour apt en ouvrant une fenêtre de console (CTRL+ALT+T devrait fonctionner) et tapez : `sudo apt-get update`
1. Naviguez jusqu'à l'endroit où vous avez téléchargé le programme d'installation et double-cliquez dessus, ou utilisez la ligne de commande : `sudo apt install ./{{ site.download_file_names.deb-gui }}`.
1. Une fois installé, vous pouvez supprimer le fichier et fermer toutes les fenêtres de la console.

Notez que si vous devez mettre à jour Jamulus vers une version plus récente, téléchargez simplement le nouveau fichier .deb et réinstallez comme ci-dessus.

Pour les installateurs sur d'autres distributions, voir [Repology](https://repology.org/project/jamulus/versions). Vous pouvez également utiliser l'un des [scripts d'installation](https://github.com/jamulussoftware/installscripts). 


## Configurer votre matériel

### Configurer JACK avec QjackCtl
Les clients Jamulus ont besoin de [JACK](https://jackaudio.org/) pour fonctionner, mais vous devez d'abord le configurer. La méthode recommandée est d'utiliser `QjackCtl`.
1. Exécutez la commande `qjackctl`. Vous verrez la page principale de l'utilitaire **Qt JACK Control**.
2. Configurez votre matériel audio comme suit (les paramètres exacts de JACK dépendront de ce que votre matériel audio est capable de faire) :

- Réglez la **Interface** audio sur celle que vous voulez (il peut y en avoir plusieurs dans la liste).
- Réglez la **Fréquence d'échantillonnage sur 48000**.
- Définissez la **Frames/Période à 128** et Périodes/Buffer à 2 dans un premier temps.

Redémarrez JACK pour que les nouveaux paramètres prennent effet.

### Démarrez Jamulus

Une fois JACK lancé et configuré, démarrez Jamulus.

Si vous rencontrez des problèmes d'interruption du son (en particulier des erreurs XRUN signalées par JACK/QjackCtl), essayez de définir des valeurs plus élevées (par exemple, 256 images ou 3 périodes). Des valeurs plus faibles (par exemple 64 frames) peuvent apporter de meilleures performances mais peut-être plus de problèmes de son. Voir la page [dépannage](Client-Troubleshooting) sinon.

## Tout est installé ?

Jetez un coup d'oeil à la

[page d'installation de Jamulus](Setup){: .button}
