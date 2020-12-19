---
layout: wiki
title: "Installation auf Windows"
lang: "de"
permalink: "/wiki/Installation-for-Windows"
---

# Installation auf Windows
Wenn du die [Erste Schritte](Getting-Started) Seite noch nicht gelesen hast, solltest du das nachholen.
1. **Downloade und installiere einen ASIO-Treiber**. Wir empfehlen, eine Soundkarte/Interface mit einem nativen, herstellereigenen ASIO-Treiber zu verwenden. Wenn kein nativer ASIO-Treiber vorhanden ist (v.A. bei integrierten Soundkarten), installiere [ASIO4ALL](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} vor der Installation von Jamulus.
1. [Downloade und installiere Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Wenn du eine Warnung bekommst, klicke auf „Mehr Infos“ und „Trotzdem ausführen“, um Jamulus zu installieren. Du siehst diese Meldung, da wir momentan nicht für ein Software Zertifikat für Jamulus zahlen.
1. Starte Jamulus. Jetzt kannst du Jamulus wie jedes andere Programm öffnen.
1. **Richte deine Soundkarte ein**. Wenn du Jamulus installiert hast, musst du deine Audio-Hardware einrichten. Wenn du ASIO4All nutzt, schau dir die [Einrichtung](#asio4all-einrichten) an (scrolle etwas nach unten) sonst kannst du gleich deine Audio-Hardware einrichten. Siehe [Hardware-Setup](Hardware-Setup).

Wenn du willst, kannst du Jamulus auch selbst [kompilieren](Compiling).

***

## ASIO4All einrichten
*Fast alle integrierten Soundkarten benötigen diesen Treiber. Du solltest ASIO4All nur dann nutzen, wenn deine Soundkarte keinen nativen, vom Hersteller der Soundkarte entwickelten ASIO Treiber anbietet, da native ASIO Treiber eine bessere Latenz haben könnten.*

Wenn du ASIO4All nutzt, musst du möglicherweise ein bisschen herumprobieren, bis du deine individuell richtige Konfiguration eingestellt hast. Jeder PC ist etwas anders. Am Besten verbindest du dich mit einem Server und richtest dann gleichzeitig ASIO4All ein. Das erleichtert dir das Setup, da du dann mit deinem Instrument oder deiner Stimme testen kannst, ob alles richtig eingestellt ist.

Bevor du Jamulus startest solltest du:

1. **Alle anderen Programme schließen** (besonders die, die (wie z.B. dein Browser/Media Player) auf deine Soundkarte zugreifen könnten), weil Jamulus exklusiven Zugriff auf die Soundkarte benötigt
1. Sicherstellen, dass nur die **richtigen Ein-/Ausgänge** in ASIO4All **aktiv sind**. Alle anderen sollten ausgeschaltet sein. Wie das geht, siehst du hier:

### ASIO4All Ein/Ausgänge einrichten (Anleitung)

1. Jamulus Einstellungen öffnen (linke Spalte in Jamulus)
1. Klick auf _„ASIO-Einstellungen“_
1. Aktiviere die _erweiterte Ansicht_ in ASIO4ALL (klicke auf das Werkzeug-Icon unten rechts)
1. Aktiviere nur die Soundkarte, die du nutzen willst, indem du auf den Knopf direkt neben dem Namen der Soundkarte klickst
1. Öffne deine Soundkarte, um die Ein/Ausgänge anzuzeigen
1. Aktiviere die richtigen Ein/Ausgänge in der Liste unter deiner Soundkarte und deaktiviere alle anderen Ein/Ausgänge

**Tipp:** Viele interne Soundkarten heißen Realtek High Definition Audio, Conexant oder ähnlich.

Bezüglich der Ein/Ausgänge: Kopfhörer und Lautsprecher werden oft als „Output“ und Mikrofone als „Input“ oder „Capture“ bezeichnet. Stereo Mix ist normalerweise nicht der Ein/Ausgang, den du brauchst, deshalb – wenn du diesen Ein/Ausgang siehst – solltest du ihn ausschalten.

### Probleme mit dem ASIO4All Setup?

Wenn Nichts zu funktionieren scheint, versuche zuerst Jamulus und/oder deinen PC **neuzustarten**.
Danach versuche **die Ein-/Ausgänge nochmal neu einzurichten**. Aktivierte und zugängliche Ein-/Ausgänge zeigen ein leuchtendes An/Aus- und ein Play-Symbol. Wenn du ein rotes Kreuz oder ein gelbes Symbol siehst, musst du eventuell andere Anwendungen, wie deinen Browser, Zoom, ... schließen oder deinen PC neu starten.

Wirf einen Blick auf [dieses Video](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} von @trombonepizza, das ausführlichere Informationen zur Einrichtung von ASIO4All gibt (English).

Offizielle und ausführliche Infos zur Konfiguration von ASIO4All sind auch in den [FAQs auf der ASIO4All Website](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"}, sowie im ASIO4ALL Handbuch dokumentiert. Diese findest du höchstwahrscheinlich auf deinem Desktop oder in dem Ordner, in dem das ASIO4ALL-Binary installiert ist (normalerweise `C:\Program Files (x86)\ASIO4ALL v2\`).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Wenn du willst, kannst du jetzt auf die folgende Seite gehen:

[Nach der Installation](Onboarding){: .button}
