<!-- NOTE : Ceci doit s'appliquer à la fois au client et au serveur, et à tous les systèmes d'exploitation -->

Une fois installé et en fonctionnement, vous voudrez peut-être conserver une copie de vos paramètres. Avoir une sauvegarde est toujours une bonne idée, et les fichiers de paramètres ne sont pas rétrocompatibles entre les versions de Jamulus. Ainsi, si vous souhaitez revenir à la version précédente, vous devrez restaurer les paramètres que vous aviez.

Pour trouver votre fichier de paramètres sous Windows, regardez dans le dossier `%APPDATA%`. Vous trouverez un ou plusieurs fichiers `.ini` dans un dossier nommé `Jamulus`.

Pour toutes les autres plateformes, exécutez la commande suivante à partir de la ligne de commande pour trouver leur emplacement :

`find ~ -name Jamulus.ini -ls`

**Points à noter**

* Ne pas sauvegarder ou restaurer les fichiers de paramètres lorsque Jamulus est en cours d'exécution.
* Il n'est pas recommandé de modifier les fichiers de paramètres à la main (ils ne sont pas conçus pour cela).
* Vous pouvez rétablir tous les paramètres par défaut en supprimant simplement le fichier de paramètres (après avoir fermé Jamulus).
