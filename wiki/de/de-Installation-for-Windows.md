---
layout: wiki
title: "Installation auf Windows"
lang: "de"
permalink: "/wiki/Installation-for-Windows"
---

# Installation auf Windows
Wenn du die [Erste Schritte](Getting-Started) Seite noch nicht gelesen hast, solltest du das nachholen.
1. **Downloade und installiere einen ASIO-Treiber**. Wir empfehlen, eine Soundkarte/Interface mit einem nativen, herstellereigenen ASIO-Treiber zu verwenden. Wenn kein nativer ASIO-Treiber vorhanden ist (v.A. bei integrierten Soundkarten), installiere [ASIO4ALL](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} vor der Installation von Jamulus.
1. **Downloade und installiere Jamulus** von der [Jamulus Projektseite](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Wenn du eine Warnung bekommst, klicke auf „Mehr Infos“ und „Trotzdem ausführen“, um Jamulus zu installieren.
1. **Richte deine Soundkarte ein**. Wenn du Jamulus installiert hast, musst du deine Audio-Hardware einrichten. Wenn du ASIO4All nutzt, schau dir die [Einrichtung](#asio4all-einrichten) an (scrolle etwas nach unten) sonst kannst du gleich deine Audio-Hardware einrichten. Siehe [Hardware-Setup](Hardware-Setup).

Du kannst Jamulus auch selbst [kompilieren](Compiling), wenn du das willst.

***

## ASIO4All einrichten
*Du solltest ASIO4All nur dann nutzen, wenn deine Soundkarte keinen nativen, vom Hersteller der Soundkarte entwickelten ASIO Treiber anbietet, da native ASIO Treiber eine bessere Latenz haben könnten.*

**Schließe alle Anwendungen** (besonders die, die (wie z.B. dein Browser) auf deine Soundkarte zugreifen könnten), da ASIO4All exklusiven Zugriff auf die Soundkarte benötigt. Wenn das Audio nicht sofort funktioniert, stelle sicher, dass nur die **richtigen Ein-/Ausgänge** in ASIO4All **eingeschaltet sind**.
Möglicherweise musst du ein bisschen herumprobieren, um die richtigen Ein/Ausgänge zu finden, weil jeder PC etwas anders ist. Teste das am Besten, während du mit einem Server verbunden bist, und überprüfe, ob deine Stimme/dein Instrument hörbar ist. Damit kannst du gleich testen, ob alles richtig eingestellt ist.

### ASIO4All einrichten (Anleitung)

1. Jamulus Einstellungen öffnen (linke Spalte in Jamulus)
1. Klick auf _„ASIO-Einstellungen“_
1. Aktiviere die _erweiterte Ansicht_ in ASIO4ALL (klicke auf das Werkzeug-Icon unten rechts)
1. Öffne deine Soundkarten- Ein-/Ausgänge, indem du auf das _Plus-Symbol_ neben dem Soundkartennamen klickst.
1. Aktiviere/deaktiviere die korrekten Ein-/Ausgänge

Viele interne Soundkarten heißen Realtek High Definition Audio, Conexant oder ähnlich.
Kopfhörer und Lautsprecher werden oft als „Output“ und Mikrofone als „Input“ bezeichnet.

### Hast du Probleme mit dem ASIO4All Setup?

Obwohl ASIO4ALL manchmal gleich ohne Setup funktioniert, kann es sein, dass du Probleme mit der Einrichtung hast.

Wenn nichts zu funktionieren scheint, versuche zuerst, Jamulus und/oder deinen PC **neuzustarten**.
Danach versuche **die Ein-/Ausgänge nochmal neu einzurichten**. Aktivierte und zugängliche Ein-/Ausgänge zeigen ein leuchtendes An/Aus- und ein Play-Symbol. Wenn du ein rotes Kreuz oder ein gelbes Symbol siehst, musst du eventuell andere Anwendungen, wie deinen Browser, Zoom, ... schließen oder deinen PC neu starten.

Wirf einen Blick auf [dieses Video](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} von @trombonepizza, das ausführlichere Informationen zur Einrichtung von ASIO4All gibt (English).

Offizielle und ausführliche Infos zur Konfiguration von ASIO4All sind auch in den [FAQs auf der ASIO4All Website](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"}, sowie im ASIO4ALL Handbuch dokumentiert. Diese findest du höchstwahrscheinlich auf deinem Desktop oder in dem Ordner, in dem das ASIO4ALL-Binary installiert ist (normalerweise `C:\Program Files (x86)\ASIO4ALL v2\`).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Wenn du dein Audio-Equipment noch nicht eingerichtet hast, schau im [Hardware-Setup](Hardware-Setup).

Ausführliche Informationen zur Benutzung von Jamulus findest du im [Jamulus Help Manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).
