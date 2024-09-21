
[comment]: # (Il s'agit d'un fichier d'inclusion à utiliser dans plusieurs
documents)

- `-h` ou `--help` Afficher le texte d'aide
- `-i` ou `--inifile` paramètre l'emplacement du fichier d'initialisation
  (remplace la valeur par défaut). Sur macOS, fournissez simplement un nom
  de fichier, puisque les fichiers de configuration ne peuvent être lus que
  depuis
  `/Users/<nomdutilisateur>/Library/Containers/app.jamulussoftware.Jamulus/Data/`.
  Pour le serveur, remplacez `app.jamulussoftware.Jamulus` par
  `app.jamulussoftware.JamulusServer`. Activez "Afficher le dossier
  Bibliothèque" dans "Afficher les options d'affichage" dans le Finder pour
  voir ce dossier.)
- `-n` ou `--nogui` Désactiver l'interface graphique (pour une utilisation
  en mode sans interface graphique)
- `-p` ou `--port` Définit le numéro du port UDP local. La valeur par défaut
  est 22124
- `--jsonrpcport` Permet au serveur API JSON-RPC de contrôler l'application,
  définit le numéro de port TCP (EXPÉRIMENTAL, les API peuvent changer ;
  accessible uniquement depuis localhost). Veuillez consulter [le fichier de
  documentation de l'API
  JSON-RPC](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Requis lorsque vous utilisez
  `--jsonrpcport`. Définit un chemin vers un fichier texte contenant une
  chaîne d'authentification pour obtenir l'accès à l'API JSON-RPC.
- `--jsonrpcbindip` L'adresse IP à laquelle le serveur JSON-RPC devrait se
  lier. (optionnel, la valeur par défaut est 127.0.0.1)
- -Q` ou `--qos` Définit la valeur DS Field byte de la qualité de
  service. La valeur par défaut est 128 (DSP/CS4). QoS est ignoré par
  Windows. Pour l'activer, voir [cette page](QOS-Windows)
- `-t` ou `--notranslation` Désactiver les traductions de langue de
  l'interface utilisateur
- `-6` ou `--enableipv6` Active l'adressage IPv6 (IPv4 est toujours activé)
- `-v` ou `--version` Affiche les informations sur la version
