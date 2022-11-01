<!-- HINWEIS: Dies muss sowohl für Client und Server als auch für alle Betriebssysteme gelten -->

Wenn du Jamulus installiert hast und es läuft, solltest du eine Kopie deiner Einstellungen aufbewahren. Eine Sicherungskopie ist immer eine gute Idee. Außerdem sind die Einstellungsdateien zwischen verschiedenen Jamulus-Versionen nicht abwärtskompatibel. Wenn du also zu einer früheren Version zurückkehren möchten, musst du deine alten Einstellungen wiederherstellen.

Um deine Einstellungsdatei unter Windows zu finden, gebe `%APPDATA%` in die Suchleiste ein und suche nach dem `Jamulus` Ordner. Dort findest du eine oder mehrere `.ini`-Dateien. Sichere nun die Jamulus Einstellungen.

Für alle anderen Plattformen kannst du den folgenden Befehl in der Befehlszeile ausführen, um herauszufinden, wo sich die Dateien befinden und um die Dateien an einen anderen Ort zu kopieren:

`find ~ -name Jamulus.ini -ls`

Wenn du den `--inifile` Parameter verwendet hast um eine ini-Datei an einem anderen Ort zu speichern, vergiss nicht, auch diese Dateien zu sichern. **Hinweise**

* Sichere keine Einstellungsdateien und stelle sie nicht wieder her, während Jamulus läuft.
* Es ist nicht empfehlenswert, die Einstellungsdateien manuell zu bearbeiten (dafür sind sie nicht gedacht).
* Du kannst alle Einstellungen auf die Standardwerte zurücksetzen, indem du die Einstellungsdatei löscht (nachdem du Jamulus beendet hast).
