---
layout: wiki
title: "Schnellstart"
lang: "de"
permalink: "/wiki/Getting-Started"
---

# Erste Schritte mit Jamulus

## Du brauchst

1. **Einen Computer** (*Windows 10*, *MacOS X* El Capitan (v10.11) oder neuer, *Linux*)
1. **Eine kabelgebundene Internetverbindung** (LAN, *kein WLAN*. Sonst gibt es Tonprobleme). Keine LAN Buchse mehr? Versuche einen USB zu LAN Adapter! Die meisten Internetverbindungen sind ausreichend. Empfohlen mindestens 10MBit/s Download und 1MBit/s Upload ([vollständige Details hier](Quality,-delay-and-network-bandwidth)).
1. **Kabelgebundene Kopfhörer - keine Lautsprecher** um Echo/Rückkopplungen zu vermeiden. Die Zeitverzögerung von Bluetooth-Kopfhörern ist normalerweise zu hoch. Deshalb solltest du einen kabelgebundenen Kopfhörer nutzen. Besonders beim Singen oder Spielen akustischer Instrumente sind Kopfhörer auch eine gute Hilfe um sicherzustellen, dass du mit anderen im Takt bleibst (siehe [diesen Hinweis](Getting-Started#schwierigkeiten-probleme-kannst-du-den-rhythmus-nicht-einhalten)).

### Empfohlen: ein Audio-Interface!

Obwohl du auch das eingebaute Mikrofon und damit die Soundkarte deines Computers nutzen kannst, ist die Qualität und Latenz von externen Soundkarten (Interfaces) normalerweise besser. Ein Audiointerface ist eine Box, an die du dein(e) Instrument(e) anschließen kannst. Normalerweise verbindet man ein Interface per USB mit deinem PC. Du kannst natürlich auch ein externes USB-Mikrofon probieren. Mehr Details findest du im [Hardware-Setup](Hardware-Setup).

### Latenz minimieren!

Je geringer die Latenz, desto besser kannst du mit anderen zusammenspielen. Die Minimierung der „Latenz“ (Signalverzögerung) ist also entscheidend für ein erfolgreiches Zusammenspiel. Während du Jamulus verwendest, versuche keine anderen Programme auf deinem PC ausführen und den Internetverkehr in deinem Netzwerk gering halten. Schau keine YouTube/Netflix Videos und stoppe Virenscans.

#### Ping!

Auch der Ping (Zeit, die ein Signal von deinem PC zum Jamulus Server und zurück benötigt) sollte so gering, wie möglich sein. Verbinde dich immer mit den Servern mit den **niedrigsten Ping-Zeiten**. 15ms oder weniger sind perfekt. Natürlich gibt es auch andere Einflussfaktoren für gelungene Online Musikstunden, die wichtigsten Faktoren kennst du jetzt aber!

## Bereit? Installiere Jamulus!
<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Für Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Für macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Für Linux</a>
</div>
[Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/)

Starte Jamulus auf jedem PC (nur 64-Bit-Systeme) nur mit einem USB-Stick! Prüft deine Hardware automatisch und stellt sie ein.

## Fertig? Alles installiert?

Wenn du Jamulus eingerichtet hast, schau dir das [Hardware-Setup](Hardware-Setup) an.

Ausführliche Informationen zur Benutzung von Jamulus findest du im [Handbuch](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

**Auch [diese ausgezeichnete Anleitung](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) von [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a)** (_Facebook_) kann dir weiterhelfen!

## Schwierigkeiten? Probleme? Kannst du den Rhythmus nicht einhalten?

**HÖRE. NUR. AUF. DAS. SIGNAL. VOM. SERVER!**

Oder anders ausgedrückt, höre **nicht** auf dein direktes Signal.

Selbst wenn deine Internetverbindung gut ist: Wenn du nicht auf dein eigenes Signal vom Server hörst, wird es sehr schwer sein, den Rhythmus einzuhalten.  _(Um Zweifel auszuschließen: das hat nichts mit den „Mute“-Reglern in Jamulus zu tun.)_

Weitere Informationen darüber, wie du vermeiden kannst, auf dich selbst zu hören (und Hilfe bei anderen Problemen), findest du auf der [Fehlerbehebung FAQ](Client-Troubleshooting) Seite. (_momentan in Arbeit_)

## Wie Jamulus funktioniert (in Kürze)

**Millionen von Menschen benutzen Jamulus um mit anderen Menschen auf der ganzen Welt in Echtzeit zu spielen, zu singen und Musik zu unterrichten. Das funktioniert ganz einfach:**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus arbeitet nach dem Client-Server-Prinzip. Das Audiosignal von allen Teilnehmern wird an einen Server geschickt, dort gemischt und verarbeitet. Danach wird das Audio an jeden Client gesendet. Wenn ein Server öffentlich gemacht und auf einem zentralen Server registriert wird, werden seine Informationen an alle Clients gesendet._
