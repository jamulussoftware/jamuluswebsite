
[comment]: # (This is an include file for use in multiple documents)

- `-h` ou `--help`           Afficher le texte d'aide         
- `-i` ou `--inifile`        Définit l'emplacement du fichier d'initialisation (remplace la valeur par défaut)
- `-n` ou `--nogui`          Désactiver l'interface graphique (pour une utilisation en mode sans interface graphique)                      
- `-p` ou `--port`           Définit le numéro du port UDP local. La valeur par défaut est 22124
- `--jsonrpcport`            Permet au serveur API JSON-RPC de contrôler l'application, définit le numéro de port TCP (EXPÉRIMENTAL, les API peuvent changer ; accessible uniquement depuis localhost). Veuillez consulter [le fichier de documentation de l'API JSON-RPC](https://github.com/jamulussoftware/jamulus/blob/master/docs/JSON-RPC.md).
- `--jsonrpcsecretfile`      Requis lorsque vous utilisez `--jsonrpcport`. Définit un chemin vers un fichier texte contenant une chaîne d'authentification pour obtenir l'accès à l'API JSON-RPC.
- -Q` ou `--qos`            Définit la valeur DS Field byte de la qualité de service. La valeur par défaut est 128 (DSP/CS4). QoS est ignoré par Windows. Pour l'activer, voir [cette page](QOS-Windows)
- `-t` ou `--notranslation`  Désactiver les traductions de langue de l'interface utilisateur
- `-6` ou `--enableipv6`     Active l'adressage IPv6 (IPv4 est toujours activé)
- `-v` ou `--version`        Affiche les informations sur la version
