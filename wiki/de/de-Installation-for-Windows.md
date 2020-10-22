---
layout: wiki
title: "Installation auf Windows"
lang: "de"
permalink: "/wiki/Installation-for-Windows"
---

# Installation auf Windows
Wenn du die [Schnellstartseite](Getting-Started) noch nicht gelesen hast, solltest du das nachholen.

1. **Downloade und installiere einen ASIO-Treiber**. Wir empfehlen, eine Soundkarte/Interface mit einem nativen ASIO-Treiber zu verwenden. Wenn kein nativer ASIO-Treiber vorhanden ist (v.A. bei integrierten Soundkarten), installiere [diesen kostenlosen ASIO-Treiber (ASIO4All)](http://www.asio4all.org) **vor** der Installation von Jamulus.
1. **Downloade und installiere Jamulus** von der [Jamulus Projektseite](https://sourceforge.net/projects/llcon/files/). Wenn du eine Warnung bekommst, klicke auf „Mehr Infos“ und „Trotzdem ausführen“, um Jamulus zu installieren.
1. **Richte deine Soundkarte ein**. Wenn du fertig bist, musst du deine Audio-Hardware einrichten. Wenn du ASIO4All nutzt, schau dir die Einrichtung an (scrolle etwas nach unten), und danach das [Hardware-Setup](Hardware-Setup).

Du kannst Jamulus auch selbst [kompilieren](Compiling), wenn du das willst.

## ASIO4All einrichten
*Du solltest ASIO4All nur dann nutzen, wenn deine Soundkarte keinen nativen, vom Hersteller der Soundkarte entwickelten ASIO Treiber anbietet (das ist v.A. bei integrierten Soundkarten der Fall), da native ASIO Treiber eine bessere Latenz haben könnten.*

**Schließe alle Anwendungen** (besonders die, die (wie u.A. dein Browser) auf deine Soundkarte zugreifen könnten), um Probleme zu minimieren. Wenn das Audio nicht sofort funktioniert, stelle sicher, dass nur die **richtigen Ein-/Ausgänge** in ASIO4All **eingeschaltet sind**.
Möglicherweise musst du ein bisschen herumprobieren, um die richtigen Ein/Ausgänge zu finden. Jeder PC ist etwas anders. Teste das am Besten, während du mit einem Server verbunden bist, damit du gleich hören kannst, ob deine Stimme/dein Instrument hörbar ist. Dann kannst du gleich testen, ob alles richtig eingestellt ist.

### ASIO4All einrichten (Anleitung)

1. Jamulus Einstellungen öffnen
1. Klicke auf _„ASIO-Einstellungen“_
1. Aktiviere die _erweiterte Ansicht_ in ASIO4All (klicke auf das Werkzeug-Icon unten rechts)
1. Öffne deine Soundkarten- Ein-/Ausgänge, indem du auf das _Plus-Symbol_ neben dem Soundkartennamen klickst.
1. Aktiviere/deaktiviere die korrekten Ein-/Ausgänge

Viele interne Soundkarten heißen Realtek High Definition Audio, Conexant oder ähnlich.
Kopfhörer und Lautsprecher werden oft als „Output“ und Mikrofone als „Input“ bezeichnet.

### Hast du Probleme mit dem ASIO4All Setup?

Obwohl ASIO4All manchmal gleich ohne Setup funktioniert, kann es sein, dass du Probleme mit der Einrichtung hast.

Wenn nichts zu funktionieren scheint, versuche zuerst, Jamulus und/oder deinen PC **neuzustarten**.
Danach versuche **die Ein-/Ausgänge neu einzurichten**. Aktivierte und zugängliche Ein-/Ausgänge zeigen ein leuchtendes An/Aus- und ein Play-Symbol. Wenn du ein rotes Kreuz oder ein gelbes Symbol siehst, musst du eventuell andere Anwendungen, wie deinen Browser, Zoom, ... schließen.

Wirf einen Blick auf [dieses Video](https://youtu.be/_GzOsitVgLI) von @trombonepizza, das ausführlichere Informationen zur Einrichtung von ASIO4All gibt (English).

Offizielle und ausführlichere Infos zur Konfiguration von ASIO4All sind in den [FAQs auf der ASIO4All Website](http://www.asio4all.org/faq.html), sowie im ASIO4All Handbuch dokumentiert. Diese findest du höchstwahrscheinlich auf deinem Desktop oder in dem Ordner, in dem das ASIO4All-Binary installiert ist (normalerweise `C:\Program Files (x86)\ASIO4ALL v2\`).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Wenn du dein Audio-Equipment noch nicht eingerichtet hast, schau im [Hardware-Setup](Hardware-Setup).

Ausführliche Informationen zur Benutzung von Jamulus findest du im [Jamulus Help Manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).
