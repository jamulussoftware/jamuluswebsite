---
layout: wiki
title: "Installation auf Linux"
lang: "de"
permalink: "/wiki/Installation-for-Linux"
---
{% include breadcrumb.html root="Jamulus nutzen" branch1="Erste Schritte" branch1-url="Getting-Started" %}

# Installation auf Linux
Stelle sicher, dass du die [Erste Schritte](Setup) Seite bereits gelesen hast.

### Debian and Ubuntu

1. Downloade die [neuste .deb Datei]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Update apt: `sudo apt-get update`
1. Installiere das Paket: `sudo apt install /path/to/{{ site.download_file_names.deb-gui }}`.
1. Da Jamulus den JACK Server benötigt, musst du ihn auch installieren. Wir empfehlen, dass du `QjackCtl` zur Konfiguration von JACK benutzt. Installiere das Programm mit `sudo apt-get install qjackctl`

Wenn du Jamulus auf eine neue Version upgraden musst, kannst du die neue .deb Datei einfach herunterladen und neu installieren, wie oben beschrieben.

Für Installationspakete anderer Distributionen schau dir [Repology](https://repology.org/project/jamulus/versions) an. Du magst auch die von Benutzern erstellten [Installationsskripts](https://github.com/jamulussoftware/installscripts) verwenden.


## Richte deine Hardware ein

### Konfiguriere Jack mit QjackCtl
Jamulus Clients brauchen [JACK](https://jackaudio.org/). Du musst JACK aber zuerst einrichten. Am Besten machst du das mit `QjackCtl`.
1. Öffne die Kommandozeile z.B. mit STRG-ALT-T
1. Führe `qjackctl` aus und warte, bis sich das **Jack Audio Connection Kit** öffnet.
2. Konfiguriere dein Audiointerface wie folgt (die genauen Einstellungen für JACK hängen von den Funktionen deiner Soundkarte ab):

- Wähle dein Audio **Interface** aus (es können mehrere in der Liste sichtbar sein)
- Setzte die **Sample Rate auf 48000**
- Setze die **Frames/Period auf 128** und Periods/Buffer zunächst auf 2

Starte JACK neu, um die neuen Einstellungen zu übernehmen.

### Jamulus starten

Nun dass JACK konfiguriert und am Laufen ist, kannst du Jamulus aus dem Launcher starten (oder mit der Kommandozeile, führe den Befehl `jamulus` aus).

Wenn du Soundprobleme (kurze Unterbrechungen, Knistern o.Ä.) hast (insbesondere XRUNs, die von Jack/QjackCtl gemeldet werden), versuche größere Werte (z.B. 256 Frames oder 3 Perioden) zu setzen. Niedrigere Einstellungen (z.B. 64 Frames) bieten zwar eine bessere Leistung, aber möglicherweise mehr Soundprobleme.
Siehe auch die [Fehlerbehebungsseite](Client-Troubleshooting).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Nun schau dir die folgende Seite an:

[Nach der Installation](Setup){: .button}
