---
layout: wiki
title: "Einen Server betreiben"
lang: "de"
permalink: "/wiki/Running-a-Server"
---

# Einen Jamulus Server betreiben

## Muss ich einen Server betreiben, um Jamulus nutzen zu können?

NEIN.
{: .doubletextsize .red }


Du kannst einfach einen Server von jemand anderem aus der Serverliste auswählen und dann loslegen.

**Willst du nicht von anderen gestört werden?** Sobald du und deine Freunde mit einem öffentlichen Server verbunden sind, kannst du andere Musiker stummschalten, indem du nur die Musiker, mit denen du spielen willst mit der Solo Taste in deinem Mix aktivierst. Jeder Musiker, den du nicht auf „Solo” stellst, wird für dich stummgeschaltet und sieht in seinem Mix an deinem Regler, dass du ihn stummgeschaltet hast.

## Das klingt zu einfach.

Wenn du wirklich einen Server betreiben willst, ist es **sehr wichtig**, dass du verstehst, welchen Art von Server du betreiben willst.

<div class="fx-row fx-row-start-xs button-container">
  <a href="Choosing-a-Server-Type" class="button fx-col-100-xs" target="_blank" rel="noopener noreferrer">Mehr über Serverarten lesen</a>
</div>

... dann komm hierher zurück.

### Geschwindigkeit und Latenz

**_Die Leistungsfähigkeit des Servers selbst (und des Netzwerks, in dem er sich befindet) ist NICHT der wichtigste Faktor für die Qualität einer Jamulus-Sitzung!_**

Viele Leute denken, dass der Server Probleme macht, obwohl es eigentlich Probleme an den Clients sind. Vieles hängt von der [Hardware](Hardware-Setup), dem Netzwerk der Clients und davon, ob die Musiker sich an [Regel Nummer Eins](Getting-Started#schwierigkeiten-probleme-kannst-du-den-rhythmus-nicht-einhalten) halten ab. Es gibt daher keine Garantie dafür, dass ein eigener Server eine geringere Latenz oder eine bessere Gesamtleistung erzielt.

Wenn du planst, regelmäßig mit den gleichen Leuten zu spielen, solltest du zunächst sicherzustellen, dass jedes Mitglied der Gruppe für die korrekte Verwendung von Jamulus eingerichtet ist. Finde dazu einen öffentlichen Server mit einer geringen Ping-Zeit für alle (20 ms oder weniger), lasse jeden eine Verbindung zu diesem Server herstellen und arbeite daran, alle individuellen Probleme zu beheben (stelle sicher, dass sie [Regel Nr. 1](Getting-Started#schwierigkeiten-probleme-kannst-du-den-rhythmus-nicht-einhalten) befolgen). Verwende die oben genannte Solotechnik, um zu verhindern, dass du unterbrochen wirst.

Sobald alle Probleme mit den Musikern auf diese Weise gelöst sind, kannst du testen, ob du deinen eigenen Server entweder zu Hause oder auf einem Cloud-Host wie Amazon hosten willst, der evtl. besseren Latenzzeiten hat. Siehe [diesen Leitfaden](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/howto-idiots-guide-to-installing-jamulus-server-on-amazon-aws-lightsail-ubuntu-i/507719749802976/) zur Verwendung von AWS Lightsail von [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) (_Facebook_)

### Bandbreite – hast du genug?

Ein typischer Jam mit 4 Personen könnte grob 200Kbps * 4 = 800Kbs (0.8Mbps) Upload und Download benötigen. Eine typische Breitbandverbindung mit 10MBit/s Download und 1MBit/s Upload, **wird sehr wahrscheinlich ab dem fünften Musiker zu gering sein**, insbesondere wenn andere Musiker Einstellungen wählen, die viel Bandbreite benötigen. Hier kannst du testen, [wie viel Bandbreite dein Anschluss bietet](https://fast.com). [Mehr über die benötigte Bandbreite](Network-Requirements) bei verschiedenen Qualitätseinstellungen.

### Allgemein

- Nutze einen Cloud-Host für gute Pingzeiten, wenn du Probleme hast

- Jeder Server sollte mindestens 1,6 GHz CPU-Frequenz und 1 GB RAM haben.

- Wenn du einen Server betreibst, musst du möglicherweise alle Firewalls anpassen, die auf oder außerhalb deines Rechners oder Cloud Hosts laufen.

- Wenn du einen **privaten Server von zu Hause** (aber keinen öffentlichen) betreiben willst, musst du [Port-Forwarding](Running-a-Private-Server) in deinem Router einrichten.

- Jamulus unterstützt derzeit kein IPv6.


## Alles Ok? Los geht's!

<div class="fx-row fx-row-start-xs button-container">
    <a href="Server-Win-Mac" class="button fx-col-100-xs">Windows und macOS</a>
    <a href="Server-Linux" class="button fx-col-100-xs">Linux</a>
    <a href="Server-Rpi" class="button fx-col-100-xs">Raspberry Pi</a>
</div>

Serverbetreiber könnten [diese nützlichen Tools](https://github.com/corrados/jamulus/tree/master/tools) aus dem Jamulus-Repository nützlich finden. Klone dazu das Git-Repo und rufe `git submodule update --init` auf).

## Probleme?

Auf in die [Server-FAQ zur Fehlerbehebung](Server-Troubleshooting)!
