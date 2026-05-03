<!-- NOTA: questo deve essere applicato sia al client che al server ea tutti i sistemi operativi -->

Una volta installato e funzionante, potresti voler conservare una copia
delle tue impostazioni. Avere un backup è sempre una buona idea, e i file
delle impostazioni non sono retrocompatibili tra le versioni di
Jamulus. Quindi, se vuoi tornare alla versione precedente, dovrai
ripristinare le impostazioni che avevi.

Per trovare il file delle impostazioni su Windows, digita `%APPDATA%` nella
barra di ricerca e cerca una cartella denominata `Jamulus`. Ci saranno uno o
più file `.ini` in questa cartella. Ora esegui il backup delle impostazioni
di Jamulus.

Per tutte le altre piattaforme, bisogna eseguire quanto segue nella riga di
comando per trovare dove si trovano, e copiare i file in un'altra posizione:

`find ~ -name Jamulus.ini -ls`

Se hai utilizzato il parametro '--inifile' per salvare un file ini in una
posizione diversa, non dimenticare di eseguire anche il backup di questi
file.  **Punti da notare**

* Non eseguire il backup o il ripristino dei file delle impostazioni quando
  Jamulus è in esecuzione.
* Non è consigliato modificare manualmente i file delle impostazioni (non
  sono progettati per questo).
* Puoi ripristinare tutte le impostazioni ai valori predefiniti
  semplicemente eliminando il file delle impostazioni (dopo aver chiuso
  Jamulus).
