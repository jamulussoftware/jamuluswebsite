<!-- HINWEIS: Dies muss sowohl für Client und Server als auch für alle Betriebssysteme gelten -->

Wenn du Jamulus installiert hast und es läuft, solltest du eine Kopie deiner Einstellungen aufbewahren. Eine Sicherungskopie ist immer eine gute Idee. Außerdem sind die Einstellungsdateien zwischen verschiedenen Jamulus-Versionen nicht abwärtskompatibel. Wenn du also zu einer früheren Version zurückkehren möchten, musst du deine alten Einstellungen wiederherstellen.

To find your settings file on Windows, type `%APPDATA%` into the search bar and look for a folder named `Jamulus`. There will be one or more `.ini` files in this folder. Now back up Jamulus' settings.

For all other platforms, run the following from the command line to find where they live and copy the files to another location:

`find ~ -name Jamulus.ini -ls`

If you used the `--inifile` parameter to save an inifile to a different location, don't forget to also backup these files. **Points to note**

* Sichere keine Einstellungsdateien und stelle sie nicht wieder her, während Jamulus läuft.
* It is not recommended to manually edit settings files (they're not designed for that).
* Du kannst alle Einstellungen auf die Standardwerte zurücksetzen, indem du die Einstellungsdatei löscht (nachdem du Jamulus beendet hast).
