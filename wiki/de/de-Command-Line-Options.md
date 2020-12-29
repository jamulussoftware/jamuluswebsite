---
layout: wiki
title: "Kommandozeile"
lang: "de"
permalink: "/wiki/Command-Line-Options"
---

# Kommandozeile

Obwohl die gebräuchlichsten Funktionen in Jamulus über die GUI eingestellt werden können, lässt sich Jamulus auch über die Kommandozeile steuern. Wie das genau funktioniert, hängt von deinem Betriebssystem ab.

Unter Windows kannst du die Rekorderfunktion `-R` z.B. wie folgt aktivieren: Klicke mit der rechten Maustaste auf die Jamulus Verknüpfung, dann auf „Eigenschaften“ und füge die entsprechende Option (in diesem Beispiel `-R`) nach Jamulus.exe hinzu:

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" -s -R "C:\Pfad\zu\deinen\Aufnahmen"
```

Unter macOS, starte das Terminal und führe Jamulus mit den gewünschten Optionen wie folgt aus:

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus -s -R "/Pfad/zu/deinen/Aufnahmen"
```

***

Du kannst dir alle verfügbaren Optionen der aktuellen Jamulus Version über den Parameter `-h` anzeigen lassen.


| Short | Long name | `[...]` bedeutet optionale Parameter | |
|-------|-----------|----------------------------------|-|
|    `-c` |`--connect`        | Automatische Verbindung zum angegebenen Server beim Start des Clients. Format `Adresse[:Port]` | (nur Client) |
|    `-d` |`--discononquit`   | Trenne alle Verbindungen mit allen Clients beim Beenden des Servers | (nur Server) |
|    `-e` |`--centralserver`  | Mache diesen Server öffentlich verfügbar und setzt sein Genre. Schau dir auch die Option `-o` an | (nur Server) [Siehe hier](Choosing-a-Server-Type#1-öffentlich). |
|    `-f` |`--listfilter`     | Setze Server auf die Whitelist, Format `IP Adresse 1[;IP Adresse 2]` | (nur Zentralserver) [Siehe hier](Choosing-a-Server-Type#3-zentral). |
|    `-F` |`--fastupdate`     | 64 samples frame size Modus. Reduziert Latenz wenn Clients mit der "Enable Small Network Buffers" Option verbunden sind. Benötigt schnelle CPU um Dropouts zu vermeiden, und mehr Bandbreite. | (nur Server) |
| `-h,-?` |`--help`           | Dieser Hilfetext | (Client und Server) |
|    `-i` |`--inifile`        | Setze Pfad zur Initialisierungs Datei (überschreibt den Standard) | (Client (immer) und Server (mit GUI)) |
|    `-j` |`--nojackconnect`  | Deaktiviert automatische JACK Verbindung | (nur Client) |
|    `-l` |`--log` | Aktiviere Logging, gebe Pfad und Dateinamen an | (nur Server) |
|    `-m` |`--htmlstatus`     | Aktiviere HTML Status Datei, gebe Pfad und Dateinamen an | (nur Server) |
|    `-M` |`--mutestream`     | Starte Jamulus im stummgeschalteten Modus | (nur Client) |
|    `-n` |`--nogui`          | Deaktiviere GUI | (Client und Server) |
|    `-o` |`--serverinfo`     | Serverstandort im Format: <br/>`[Name];[Stadt];[Lokaler Wert]` (Siehe [Werte](https://doc.qt.io/qt-5/qlocale.html#Country-enum))| (nur öffentliche Server) |
|    `-p` |`--port`           | Lokaler UDP Port. Standard ist 22124 | (nur Server) |
|    `-R` |`--recording`      | Pfad zu einem beschreibbaren Pfad wo die Aufgenommenen Dateien gespeichert werden (in Anführungszeichen wenn nötig). | (nur Server) Siehe Beschreibung im [Server Setup](Server-Win-Mac#recording). |
|       | `--norecord`      | Starte mit deaktivierten Recorder | (nur Server) |
|    `-s` |`--server`         | Starte in Server Modus | (nur Server) [Siehe Notiz](Choosing-a-Server-Type) |
|    `-t` |`--notranslation`  | Keine Übersetzungen | (Client und Server) |
|    `-T` |`--multithreading` | Aktiviere Multithreading | (nur Server) |
|    `-u` |`--numchannels`    | Maximale Anzahl an Nutzern. Standard ist 10, Maximum ist 50 | (nur Server) |
|    `-w` |`--welcomemessage` | Begrüßungsnachricht. Unterstützt HTML und inline CSS (in Anführungszeichen), oder Pfad zu einer Textdatei. | (nur Server) |
|    `-z` |`--startminimized` | Starte minimiert | (nur Server) |
|       |`--ctrlmidich`     | MIDI Controller Kanal und Offset, Format `channel[;offset]`  | (nur Client) Siehe [Tipps & Tricks](Tips-Tricks-More#Using-ctrlmidich-for-MIDI-controllers) |
|       |`--clientname`     | Fenster Titel und Jack Client Name | (nur Client) |
