---
layout: wiki
title: "Kommandozeile"
lang: "de"
permalink: "/wiki/Command-Line-Options"
---

# Kommandozeile

Während die gebräuchlichsten Funktionen in Jamulus über die GUI eingestellt werden können, lässt sich Jamulus auch über die Kommandozeile steuern. Wie das genau funktioniert, hängt von deinem Betriebssystem ab.

Unter Windows kannst du die Rekorderfunktion `-R` z.B. wie folgt aktivieren: Klicke mit der rechten Maustaste auf die Jamulus Verknüpfung, dann auf "Eigenschaften" und füge die entsprechende Option (in diesem Beispiel `-R`) nach Jamulus.exe hinzu:

`"C:\Program Files (x86)\Jamulus\Jamulus.exe" -s -R "C:\path\to\your\Jam Recordings"`

Unter macOS, starte das Terminal Fenster und führe Jamulus mit den gewünschten Optionen wie folgt aus:

`/Applications/Jamulus.app/Contents/MacOS/Jamulus -s -R "/path/to/your/jam recordings"`

***

Du kannst dir alle verfügbaren Optionen der aktuellen Jamulus Version über den Parameter `-h` anzeigen lassen.


| Short | Long name | `[...]` bedeutet optionale Parameter | |
|-------|-----------|----------------------------------|-|
|    `-c` |`--connect`        | Verbindung zu Server Adresse beim start, Format `Adresse[:Port]` | (nur Client) |
|    `-d` |`--discononquit`   | breche Verbindungen ab mit allen Clients beim beenden | (nur Server) |
|    `-e` |`--centralserver`  | mache diesen Server öffentlich verfügbar. Prüfe auch Option `-o`| (nur Server) [Siehe Notiz](Choosing-a-Server-Type#1-public). |
|    `-f` |`--listfilter`     | Setze Server auf die Whitelist Serverliste, Format `IP Adresse 1[;IP Adresse 2]` | (nur Zentralserver) [Siehe Notiz](Choosing-a-Server-Type#3-central). |
|    `-F` |`--fastupdate`     | 64 samples frame size Modus. Reduziert Latenz wenn Clients mit "Enable Small Network Buffers" Option verbunden sind. Benötigt schnellere CPU um dropouts zu vermeiden, und mehr Bandbreite um Clients zu aktivieren. | (nur Server) |
| `-h,-?` |`--help`           | dieser Hilfetext | (Client und Server) |
|    `-i` |`--inifile`        | Setze Pfad zur Initialisierungs Datei (überschreibt das Standard) | (Client (immer) und Server (mit Oberfläche)) |
|    `-j` |`--nojackconnect`  | Deaktiviere Auto Jack Verbindungen | (nur Client) |
|    `-l` |`--log` | Aktiviere logging, etze Pfad und Dateinamen | (nur Server) |
|    `-m` |`--htmlstatus`     | Aktiviere HTML Status Datei, Setze Pfad und Dateinamen | (nur Server) |
|    `-M` |`--mutestream`     | Starte Jamulus in stummen Status | (nur Client) |
|    `-n` |`--nogui`          | Deaktiviere Oberfläche | (Client und Server) |
|    `-o` |`--serverinfo`     | Serverstandort im Format: <br/>`[Name];[Stadt];[Lokaler Wert]` (Siehe [Werte](https://doc.qt.io/qt-5/qlocale.html#Country-enum))| (nur öffentliche Server) |
|    `-p` |`--port`           | Lokaler UDP Port. Standard ist 22124 | (nur Server) |
|    `-R` |`--recording`      | Pfad zu einem beschreibbaren Pfad wo die Dateien gespeichert werden (in Anführungszeichen wenn nötig). | (nur Server) Siehe Beschreibung in [Server Setup](Server-Win-Mac#recording). |
|       | `--norecord`      | Starte mit deaktivierten Recorder | (nur Server) |
|    `-s` |`--server`         | Starte in Server Modus | (nur Server) [Siehe Notiz](Choosing-a-Server-Type) |
|    `-t` |`--notranslation`  | Keine Übersetzungen | (Client und Server) |
|    `-T` |`--multithreading` | Aktiviere Multithreading | (nur Server) |
|    `-u` |`--numchannels`    | maximale Kanäle. Standard ist 10, Maximum ist 50 | (nur Server) |
|    `-w` |`--welcomemessage` | Supports HTML and inline CSS formatting (in enclosing quotes), or set path to text file. | (nur Server) |
|    `-z` |`--startminimized` | Starte minimiert | (nur Server) |
|       |`--ctrlmidich`     | MIDI Controller Kanal  | (nur Client) siehe [Tips & Tricks](Tips-Tricks-More) |
|       |`--clientname`     | Windows Titel und jack client Name | (nur client) |
