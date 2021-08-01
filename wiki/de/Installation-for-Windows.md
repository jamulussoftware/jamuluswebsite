---
lang: de
layout: wiki
permalink: /wiki/Installation-for-Windows
title: 'Installation auf Windows'
---

{% include breadcrumb.html root="Jamulus Nutzen" branch1="Erste Schritte" branch1-url="Getting-Started" %}

# Installation auf Windows

Stelle sicher, dass du die [Erste Schritte](Getting-Started) Seite bereits gelesen hast.
1. **Downloade und installiere einen ASIO-Treiber**. Wir empfehlen, eine Soundkarte/Interface mit einem nativen, herstellereigenen ASIO-Treiber zu verwenden. Wenn kein nativer ASIO-Treiber vorhanden ist (v.A. bei integrierten Soundkarten), brauchst du einen generischen Treiber wie ASIO4ALL. Mehr Informationen findest du im [ASIO](#asio) Abschnitt unten auf dieser Seite.
1. [Downloade Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
 **Alternativ-Download:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Installiere Jamulus**: Doppelklicke auf Installer, um die Installation zu starten. Wenn du eine Warnung von SmartScreen bekommst, klicke auf „Weitere Informationen“ und „Trotzdem ausführen“, um Jamulus zu installieren. (Wenn du eine neue Version von Jamulus heruntergeladen hast und auch einer der Ersten warst, wird Jamulus noch nicht auf der SmartScreen-Whitelist sein. Du erhältst diese Meldung, da wir momentan nicht für ein Software Zertifikat für Jamulus zahlen.)
1. **Starte Jamulus**. Jetzt kannst du Jamulus wie jedes andere Programm öffnen.
1. **Richte deine Soundkarte ein**. Wenn du Jamulus installiert hast, musst du deine Audio-Hardware einrichten. Falls du ASIO4ALL nutzt, schau dir die [Einrichtung](#asio4all-einrichten) und/oder das [Hardware-Setup](Hardware-Setup) an.

***

## ASIO

Jamulus nutzt [ASIO](https://de.wikipedia.org/wiki/Audio_Stream_Input/Output), um mit der möglicht geringsten Audiolatenz zu arbeiten.
* Wenn du eine externe Soundkarte bzw. -interface besitzt, nutze den offiziellen ASIO-Treiber (normalerweise bieten sie die beste Qualität).
* Wenn du keine externe Soundkarte besitzt, wirst du wahrscheinlich keinen ASIO-Treiber haben. Deshalb musst du einen generischen Treiber nutzen, wie ASIO4ALL:

Du kannst zwei Versionen von ASIO4ALL testen. ASIO4ALL v2.14 nutzt einen Workaround für einen Bug, der eventuell Probleme mit anderen Funktionen auslöst.

[ASIO4ALL v2.15 Beta 2 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta2_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL Website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### ASIO4ALL einrichten

*ASIO4ALL ist nur dann empfohlen, wenn deine Soundkarte keinen nativen, vom Hersteller der Soundkarte entwickelten ASIO-Treiber anbietet, da native ASIO-Treiber eine bessere Latenz anbieten können.*

Wenn du ASIO4ALL nutzt, musst du möglicherweise ein bisschen herumprobieren, da jeder PC immer etwas anders ist.

**Tipp:** Richte deine Soundkarte ein, während du [mit einem Server verbunden](Onboarding#2-verbindung-mit-einem-server-herstellen) bist. Das erleichtert dir das Setup, da du dann mit deinem Instrument oder deiner Stimme testen kannst, ob alles richtig eingestellt ist; aber lies erst einmal weiter.


Bevor du Jamulus startest:
1. **Schließe alle anderen Programme** (besonders die, die (wie z.B. dein Browser/Media Player) auf deine Soundkarte zugreifen könnten), weil Jamulus exklusiven Zugriff auf die Soundkarte benötigt. Andere Programme werden keinen Ton ausgeben/aufnehmen können, wenn Jamulus mit ASIO4ALL läuft.
1. Wenn das Audio nicht sofort funktioniert, stelle sicher, dass die **richtigen Ein-/Ausgänge** in ASIO4ALL **aktiv sind**. Alle anderen sollten ausgeschaltet sein. Suche in der [gemeinsame Auflistung funktionsfähiger ASIO4ALL Einstellungen](/kb/2021/03/20/ASIO4ALL-Examples.html) nach deinem System oder stelle sie selbst ein, wenn du deine nicht findest:

### ASIO4ALL Ein/Ausgänge einrichten (Anleitung)

1. Jamulus Einstellungen öffnen
1. Klick auf _„ASIO Geräte Einstellungen“_ (linke Spalte in Jamulus, unten)
1. Aktiviere die _erweiterte Ansicht_ in ASIO4ALL (klicke auf das Werkzeug-Icon unten rechts)
1. Aktiviere nur die Soundkarte, die du nutzen willst, indem du auf den Knopf direkt neben dem Namen der Soundkarte klickst
1. Öffne deine Soundkarte über das _Plus-Icon_ neben der Soundkarte, um die Ein/Ausgänge anzuzeigen
1. Aktiviere die richtigen Ein/Ausgänge in der Liste unter deiner Soundkarte und deaktiviere alle anderen Ein/Ausgänge. Du kannst über den Ein/Ausgängen hovern (mit dem Mauszeiger auf über dem Ein/Ausgang ruhen) ob sie die richtige Sample Rate für Jamulus unterstützen (48kHz; DVD-Qualität)

**Tipps:**
1. Viele interne Soundkarten heißen Realtek High Definition Audio, Conexant oder ähnlich.
1. Kopfhörer und Lautsprecher werden oft als „Output“ und Mikrofone als „Input“ oder „Capture“ bezeichnet.
1. Stereo Mix ist normalerweise nicht der Ein-/Ausgang, den du brauchst. Wenn du diesen Ein-/Ausgang siehst, solltest du ihn ausschalten.

### Probleme mit dem ASIO4ALL Setup?

Wenn es scheint, das nichts funktioniert, versuche zuerst Jamulus und/oder deinen PC **neuzustarten**, damit Hintergrundprozesse, die auf die Soundkarte zugreifen könnten, geschlossen werden.

Danach versuche *die Ein-/Ausgänge nochmal neu einzurichten*. Aktivierte und zugängliche Ein-/Ausgänge zeigen ein leuchtendes An/Aus- und ein Play-Symbol. Wenn du ein rotes Kreuz oder ein gelbes Symbol siehst, musst du eventuell andere Anwendungen schließen (z.B. deinen Browser, Zoom, usw.) oder deinen PC neu starten.

Wirf einen Blick auf [dieses Video](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} von [trombonepizza](https://github.com/trombonepizza), das ausführlichere Informationen zur Einrichtung von ASIO4ALL gibt (English).

Offizielle und ausführliche Infos zur Konfiguration von ASIO4ALL sind auch in den [FAQs auf der ASIO4ALL Website](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"}, sowie im ASIO4ALL Handbuch dokumentiert. Diese findest du höchstwahrscheinlich auf deinem Desktop oder in dem Ordner, in dem das ASIO4ALL-Binary installiert ist (normalerweise `C:\Program Files (x86)\ASIO4ALL v2\`).

## Alles installiert?

Jamulus wurde installiert und kann jetzt benutzt werden. Nun schau dir die folgende Seite an:

[Nach der Installation](Getting-Started){: .button}
