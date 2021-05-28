---
layout: wiki
title: "Setup"
lang: "de"
permalink: "/wiki/Getting-Started"
---

# Setup - Erste Schritte mit Jamulus

Um das Beste von Jamulus genießen zu können, brauchst du mindestens:

1. **Eine kabelgebundene Internetverbindung** (kein WLAN - siehe [FAQ](/wiki/FAQ))
1. **Kabelgebundene Kopfhörer (weder Bluetooth noch Lautsprecher** - siehe [FAQ](/wiki/FAQ))
1. **Ein passendes Audiointerface oder Soundkarte und Mikrofon** ([siehe diese Auflistung](/kb/2021/01/05/Jamulus-Sound-Devices.html) für Beispiele)

Falls du Fragen dazu hast, schau mal rein in die [Diskussionen](https://github.com/jamulussoftware/jamulus/discussions)

## Installation
Um Jamulus mit deiner Hardware zum Laufen zu bringen, folge bitte die Installationsanleitung für deine Plattform:

* [Windows](/wiki/Installation-for-Windows)
* [macOS](/wiki/Installation-for-Macintosh)
* [Linux](/wiki/Installation-for-Linux)

Und nun schließe alle anderen Programme. Es ist besser simpel zu beginnen.

## Jamulus Hauptfenster

Wenn du Jamulus öffnest, siehst du ein Fenster, welches so aussieht:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/main-screen-default.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Das Hauptfenster bevor du dich mit einem Server verbindest</figcaption>
</figure>

## Profil einrichten

Lasse zuerst die anderen Teilnehmer wissen, wer du bist. Klick auf “Ansicht” (Menüleiste oben) > “Mein Profil…”, dann siehst du folgendes:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/profile-window.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Lass die Leute wissen, wer du bist</figcaption>
</figure>

Fülle mindestens das Feld “Alias/Name” aus. Dann kannst du das Fenster schließen.

## Mit einem Server verbinden und Audio testen

**Bevor du anfängst mit anderen Leuten zu musizieren, empfehlen wir, dass du dich zuerst mit einem leeren Server verbindest, um deine Konfiguration zu testen.** Und stell sicher, dass du auf das Signal vom Server hörst (wenn möglich) und nicht auf dich selbst vor Ort.

Bevor du dich mit einem Server verbindest, solltest du dich selbst **nicht** hören können. Die “Goldene Regel” von Jamulus ist:
auf deinen eigenen Klang über das Programm zu hören; nicht das direkte Signal von deinem Instrument. Dadurch kannst du mit anderen einfacher im Takt spielen ([siehe FAQ](/wiki/FAQ)).

Nun klicke auf “Verbinden” im Jamulus-Hauptfenster, um einem Server beizutreten. Ein weiteres Fenster geht auf:

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/connection-setup-window.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Einem Server beitreten</figcaption>
</figure>

Die wichtigste Eigenschaft von Servern ist ihre “Ping-Zeit”. Je höher der Wert, desto schwerieger ist, im Tempo mit anderen zu spielen. In der Regel solltest du möglichst einen Server auswählen, dessen Ping-Zeit geringer als 15ms ist.

Einmal mit einem Server verbunden, siehe zu, dass du dich gut hören kannst, pass deine Eingangslautstärke an und korrigiere eventuelle Probleme. Und natürlich halte dich an [Die goldene Regel](/wiki/Client-Troubleshooting).


## Das erstmalige Musizieren

Wenn die Audioeinstellungen fertig sind, kannst du loslegen. Nachdem du dich mit einem Server verbunden hast (du kannst ein Genre aus der Liste wählen), sind die Regler rechts in der Ansicht dein privates Mischpult. Alles was du hier änderst, hat Einfluss auf das, was du hörst, aber nicht auf das, was die anderen hören. Wenn du einen Regler runterziehst, wird dieser Kanal leiser, wenn du ihn nach oben ziehst, wird der Kanal für dich lauter.

<figure>
  <img src="{{site.url}}/assets/img/de-screenshots/main-screen-medium.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Das Hauptfenster wenn du mit einem Server verbunden bist</figcaption>
</figure>

Falls du nicht möchtest, dass die anderen dich hören, klick auf “Stummschalten”. Das verhindert, dass dein Audiosignal an andere Leute gesendet wird. Niemand erfährt, ob du das gemacht hast. Wenn du hingegen das Symbol “mute” über einem Regler siehst, bedeutet das, dass diese Person dich nicht hören kann, weil sie deinen Kanal in ihrem Mix stummgeschaltet hat.

Während du online bist, kannst du die Chatfunktion nutzen, um eine Nachricht an die anderen Teilnehmer zu schreiben. Die Willkommensbotschaft im Chat kann auch einige Richtlinien anzeigen.

Weitere Informationen über die Verwendung von Jamulus kann man im [Software Handbuch](/wiki/Software-Manual) finden.

## Fehlerbehebung

Hast du Probleme mit dem Audio? Kannst du die Serverliste nicht sehen, oder irgendeine andere Angelegenheit? Schau dir die [Fehlerbehebungsseite](/wiki/Client-Troubleshooting) an, oder frage gerne bei den [Diskussionen](https://github.com/jamulussoftware/jamulus/discussions).
