<!-- HINWEIS: Dies muss sowohl für Client und Server als auch für alle Betriebssysteme gelten -->

Wenn du Jamulus installiert hast und es läuft, solltest du eine Kopie deiner Einstellungen aufbewahren. Eine Sicherungskopie ist immer eine gute Idee. Außerdem sind die Einstellungsdateien zwischen verschiedenen Jamulus-Versionen nicht rückwärts kompatibel. Wenn du also zu einer früheren Version zurückkehren möchten, musst du deine alten Einstellungen wiederherstellen.

Um deine Einstellungsdatei unter Windows zu finden, suche im Ordner `%APPDATA%`. Dort findest du eine oder mehrere `.ini`-Dateien in einem Ordner namens `Jamulus`.

Für alle anderen Plattformen führst du den folgenden Befehl in der Befehlszeile aus, um herauszufinden, wo sie sich befinden:

`find ~ -name Jamulus.ini -ls`

**Hinweise zum Mitschreiben**

* Sichere keine Einstellungsdateien und stelle sie nicht wieder her, während Jamulus läuft.
* Es wird nicht empfohlen, die Einstellungsdateien von Hand zu bearbeiten (dafür sind sie nicht gedacht).
* Du kannst alle Einstellungen auf die Standardwerte zurücksetzen, indem du die Einstellungsdatei löscht (nachdem du Jamulus beendet hast).
