---
layout: wiki
title: "Erste Schritte"
lang: "de"
permalink: "/wiki/Getting-Started"
---

# Erste Schritte mit Jamulus

## Du brauchst

1.  **Einen Computer** (**Windows 10**, **macOS** (**MacOS X** El Capitan v10.11 oder neuer), **Linux**)
2.  **Eine kabelgebundene Internetverbindung** (LAN, _kein WLAN_, sonst gibt es Qualitätsprobleme). Die meisten Internetverbindungen sind ausreichend[^1].
3.  **Kabelgebundene Kopfhörer – keine Lautsprecher** um Echo/Rückkopplungen zu vermeiden und die Latenz zu verringern[^2].

## Qualität maximieren, Verzögerung minimieren

### 1. Verringere die Latenz durch wenig Internetverkehr und schließe alle Programme auf deinem PC

Während du Jamulus verwendest, versuche keine anderen Programme auf deinem PC auszuführen und den Internetverkehr in deinem Netzwerk so gering wie möglich zu halten, damit die Audioverzögerung gering bleibt. Das heißt, dass du parallel z.B. keinen Videostream anschauen solltest.

### 2. Nutze ein Audiointerface/USB-Mikrofon, nicht deine interne Soundkarte

Obwohl du auch das eingebaute Mikrofon und damit die Soundkarte deines Computers nutzen kannst, ist die Qualität und Latenz von externen Soundkarten (Interfaces) normalerweise deutlich besser. Ein Audiointerface ist eine Box, an die du dein(e) Instrument(e) anschließen kannst. Normalerweise verbindet man ein Interface per USB mit deinem PC. Du kannst natürlich auch ein externes USB-Mikrofon nutzen. Mehr Infos findest du unter [Audiohardware](#audiohardware).


### 3. Verbinde dich mit Servern mit niedrigem Ping
Der Ping (Zeit, die ein Signal von deinem PC zum Jamulus Server und zurück benötigt) sollte so gering wie möglich sein. Verbinde dich immer mit den Servern mit den niedrigsten Ping-Zeiten. 15ms oder weniger sind perfekt.

Die wichtigsten Faktoren kennst du jetzt! Los geht's:

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installation auf Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installation auf macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Installation auf Linux</a>
</div>
[Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/){: target="_blank" rel="noopener noreferrer"}

Auf fast jedem PC (nur 64-Bit-Systeme) kannst du Jamulus mit einem USB-Stick starten! Jamulus OS prüft deine Hardware automatisch und richtet sie ein.

## Audiohardware
Schau dir die [Liste von getesteter Hardware](Sound-Devices) und das [Hardware Setup](Hardware-Setup) an.

## Weitere Anleitungen

* [Diese ausgezeichnete Anleitung](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} von [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) kann dir weiterhelfen!

## Schwierigkeiten? Probleme? Kannst du den Rhythmus nicht einhalten?

**HÖRE. NUR. AUF. DAS. SIGNAL. VOM. SERVER!**

Oder anders ausgedrückt, höre **nicht** auf dein direktes Signal.

Selbst wenn du eine gute Internetverbindung hast: Um den Rhythmus halten zu können, musst du dich auf das Signal vom Server und nicht auf dein Livesignal konzentrieren. _(Um Zweifel auszuschließen: das hat nichts mit den „Mute“-Reglern in Jamulus zu tun.)_

Weitere Informationen darüber, wie du vermeiden kannst, auf dich selbst zu hören (und Hilfe bei anderen Problemen), findest du auf der [Fehlerbehebung FAQ](Client-Troubleshooting) Seite. (_momentan in Arbeit_)

## Wie Jamulus funktioniert (kurz und knapp)

**Millionen von Menschen benutzen Jamulus um mit anderen Menschen auf der ganzen Welt in Echtzeit zu spielen, zu singen und Musik zu unterrichten. Das funktioniert ganz einfach:**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus arbeitet nach dem Client-Server-Prinzip. Das Audiosignal von allen Musikern wird an einen Server geschickt, dort gemischt und verarbeitet. Danach wird das Audio an jeden Client gesendet. Wenn ein Server öffentlich gemacht und auf einem zentralen Server registriert wird, werden seine Informationen an alle Clients gesendet._

## Fußnoten
[^1]: Empfohlen werden mindestens 10MBit/s Download und 1MBit/s Upload ([vollständige Details hier](Network-Requirements){: target="_blank" rel="noopener noreferrer"}). Wenn du keine LAN Buchse mehr an deinem Laptop hast, kannst du einen USB zu LAN-Adapter versuchen.
[^2]: Die Zeitverzögerung von Bluetooth-Kopfhörern ist normalerweise zu hoch. Deshalb solltest du einen kabelgebundenen Kopfhörer nutzen. Besonders beim Singen oder Spielen akustischer Instrumente sind Kopfhörer auch eine gute Hilfe um sicherzustellen, dass du mit anderen im Takt bleibst (siehe [diesen Hinweis](Getting-Started#schwierigkeiten-probleme-kannst-du-den-rhythmus-nicht-einhalten)).
