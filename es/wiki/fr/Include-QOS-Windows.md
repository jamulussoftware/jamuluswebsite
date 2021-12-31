
[comment]: # (This is an include file for use in multiple documents)

# Qualité de service (QoS)

Jamulus utilise DSCP/CS4 de manière opportuniste pour gérer le gonflement de la mémoire tampon, et utilise une valeur DSCP/CS4 par défaut de 128 (ou 0x80). Cette valeur est compatible avec IPv4 et IPv6. D'autres valeurs peuvent être définies en utilisant l'option -Q, par exemple -Q [0..255] (où 0 désactive la QoS). Cependant, la plupart des gens n'auront pas besoin de le faire.

## Utiliser QoS sous Windows

Les paramètres de QoS de Jamulus (y compris la valeur par défaut) n'ont aucun effet sur Windows car le système d'exploitation les ignore. Pour l'activer, vous devez suivre ces instructions. Notez également que vous devrez peut-être répéter cette procédure à chaque mise à jour de Jamulus.

Dans la boîte de recherche à côté du menu Démarrer, tapez : Local Group Policy Editor (entrer)<br> Dans la nouvelle fenêtre, (cliquer) sur l'icône du menu pour afficher le troisième panneau Actions.<br> Regardez le premier panneau de l'éditeur de stratégie du groupe local.<br> &nbsp;Stratégie de l'ordinateur local<br> &nbsp;&nbsp;Configuration<br> &nbsp;&nbsp;&nbsp;fenêtres paramètres<br> &nbsp;&nbsp;&nbsp;&nbsp;QoS basée sur la stratégie (cliquer)<br> Regarder le troisieme panneau (Actions) de l'éditeur de stratégie de groupe local<br> &nbsp;QoS basée sur la stratégie<br> &nbsp;&nbsp;Plus d'actions<br> &nbsp;&nbsp;&nbsp;créer une nouvelle stratégie (cliquer)<br> &nbsp;&nbsp;&nbsp;&nbsp;nom : Jamulus<br> &nbsp;&nbsp;&nbsp;&nbsp;Specifier la valeur DSCP : 32<br> &nbsp;&nbsp;&nbsp;&nbsp;suivant<br> &nbsp;&nbsp;&nbsp;&nbsp;Cette stratégie QoS s'applique seulement au programme Jamulus.exe<br> &nbsp;&nbsp;&nbsp;&nbsp;Suivant<br> &nbsp;&nbsp;&nbsp;&nbsp;Suivant<br> &nbsp;&nbsp;&nbsp;&nbsp;UDP<br> &nbsp;&nbsp;&nbsp;&nbsp;Fin<br>

(Avis : La stratégie de Jamulus dans le panneau central peut être modifiée)

