---
lang: de
layout: wiki
permalink: /wiki/Getting-Started
title: Setup
---
Test zip
# Setup - Erste Schritte mit Jamulus

Um das Beste von Jamulus genießen zu können, brauchst du mindestens:

1. **Eine kabelgebundene Internetverbindung** (kein WLAN - siehe [FAQ](/wiki/FAQ#why-shouldnt-i-use-wireless-equipment))
1. **Kabelgebundene Kopfhörer (weder Bluetooth noch Lautsprecher** - siehe [FAQ](/wiki/FAQ#why-shouldnt-i-use-wireless-equipment))
1. **Ein passendes Audiointerface oder Soundkarte und Mikrofon** ([siehe diese Auflistung](/kb/2021/01/05/Jamulus-Sound-Devices.html) für Beispiele)

Falls du Fragen dazu hast, schau mal rein in die [Diskussionen](https://github.com/jamulussoftware/jamulus/discussions)

## Installation

To get Jamulus working with your operating system, please follow the installation guide for your platform:

<div class="fx-row fx-row-start-xs button-container">
    <a href="Installation-for-Windows" class="button fx-col-100-xs">Windows</a>
    <a href="Installation-for-Macintosh" class="button fx-col-100-xs">macOS</a>
    <a href= "Installation-for-Linux" class="button fx-col-100-xs">Linux</a>
</div>

Und nun schließe alle anderen Programme. Es ist besser simpel zu beginnen.

## Hardware Setup

If you use external audio hardware, plug that in before you start Jamulus. If you haven't configured your hardware, please see the installation guides mentioned above.

## Jamulus Hauptfenster

Wenn du Jamulus öffnest, siehst du ein Fenster, welches so aussieht:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/main-screen-default.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Das Hauptfenster bevor du dich mit einem Server verbindest</figcaption>
</figure>


## Profil einrichten

Lasse zuerst die anderen Teilnehmer wissen, wer du bist. Klick auf “Ansicht” (Menüleiste oben) > “Mein Profil…”, dann siehst du folgendes:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/settings-profile.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Lass die Leute wissen, wer du bist</figcaption>
</figure>


Fülle mindestens das Feld “Alias/Name” aus. Dann kannst du das Fenster schließen.

## Mit einem Server verbinden und Audio testen

Bevor du dich mit einem Server verbindest, solltest du dich selbst **nicht** hören können. Die “Goldene Regel” von Jamulus ist: auf deinen eigenen Klang über das Programm zu hören; nicht das direkte Signal von deinem Instrument. Dadurch kannst du mit anderen einfacher im Takt spielen ([siehe FAQ](/wiki/FAQ#why-should-i-not-listen-to-my-own-signal)).

**Bevor du anfängst mit anderen Leuten zu musizieren, empfehlen wir, dass du dich zuerst mit einem leeren Server verbindest, um deine Konfiguration zu testen.** Und stell sicher, dass du auf das Signal vom Server hörst (wenn möglich) und nicht auf dich selbst vor Ort.

Nun klicke auf “Verbinden” im Jamulus-Hauptfenster, um einem Server beizutreten. Ein weiteres Fenster geht auf:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/connection-setup-window.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Einem Server beitreten</figcaption>
</figure>

The most important thing about servers is their “ping time”. The bigger the number, the harder it will be to play in time with others. Usually, you would select a server with a ping of less than 50ms if you can.

Once connected to a server, make sure you can hear yourself OK and fix any input volume or other problems. You can have a look at the [troubleshooting page](/wiki/Client-Troubleshooting) for common problems. And of course, check that you are also able to obey [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

## Das erstmalige Musizieren

Wenn die Audioeinstellungen fertig sind, kannst du loslegen. Nachdem du dich mit einem Server verbunden hast (du kannst ein Genre aus der Liste wählen), sind die Regler rechts in der Ansicht dein privates Mischpult. Alles was du hier änderst, hat Einfluss auf das, was du hörst, aber nicht auf das, was die anderen hören. Wenn du einen Regler runterziehst, wird dieser Kanal leiser, wenn du ihn nach oben ziehst, wird der Kanal für dich lauter.

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/main-screen-medium.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Das Hauptfenster wenn du mit einem Server verbunden bist</figcaption>
</figure>

Falls du nicht möchtest, dass die anderen dich hören, klick auf “Stummschalten”. Das verhindert, dass dein Audiosignal an andere Leute gesendet wird. Niemand erfährt, ob du das gemacht hast. Wenn du hingegen das Symbol “mute” über einem Regler siehst, bedeutet das, dass diese Person dich nicht hören kann, weil sie deinen Kanal in ihrem Mix stummgeschaltet hat.

Während du online bist, kannst du die Chatfunktion nutzen, um eine Nachricht an die anderen Teilnehmer zu schreiben. Die Willkommensbotschaft im Chat kann auch einige Richtlinien anzeigen.

Weitere Informationen über die Verwendung von Jamulus kann man im [Software Handbuch](/wiki/Software-Manual) finden.

## Fehlerbehebung

Hast du Probleme mit dem Audio? Kannst du die Serverliste nicht sehen, oder irgendeine andere Angelegenheit? Schau dir die [Fehlerbehebungsseite](/wiki/Client-Troubleshooting) an, oder frage gerne bei den [Diskussionen](https://github.com/jamulussoftware/jamulus/discussions).
