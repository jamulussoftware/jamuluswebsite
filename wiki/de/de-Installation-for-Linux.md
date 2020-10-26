---
layout: wiki
title: "Installation auf Linux"
lang: "de"
permalink: "/wiki/Installation-for-Linux"
---

# Installation auf Linux
Wenn du die [Schnellstartseite](Getting-Started) noch nicht gelesen hast, solltest du das nachholen.

**Im Moment bieten wir keine offiziellen Pakete für Jamulus an.**

Eine Liste inoffizieller [Pakete für verschiedene Distributionen findest du hier](https://github.com/corrados/jamulus/issues/223#issue-619038918){: target="_blank" rel="noopener noreferrer"}. Du kannst zwar das [all-in-one script](Linux-Client-Install-Script) benutzen, Jamulus zu kompillieren ist aber einfach:

## Jamulus Sourcecode herunterladen

1. Öffne ein Terminalfenster (Kommandozeile - `Strg+Alt+T` auf Ubuntu und verwandten Distributionen)
1. Lade den Sourcecode für die neueste Version herunter und entpacke diesen:
~~~
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
~~~

## Abhängigkeiten installieren

Aktualisiere zuerst deine Paketquellen (z.B. auf Debian-basierten Distributionen mit `sudo apt-get update`).

Auf **Ubuntu-basierten** Distributionen 18.04+, und auf Debian 9 oder 10:

`sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev`

Am **Debian** 11 (bullseye) oder neuer, und Raspberry Pi Raspbian Buster oder neuer:

`sudo apt-get install build-essential qtdeclarative5-dev  qt5-default qttools5-dev-tools libjack-jackd2-dev`

Auf **Fedora**:

`sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel`

### QjackCtl: Empfohlen, aber nicht zwingend notwendig

[QjackCtl](https://qjackctl.sourceforge.io){: target="_blank" rel="noopener noreferrer"} ist ein Programm, das den Jack Audioserver (den du vorher installiert hast) über eine GUI einrichten kann. Installiere QjackCtl z.B. wie folgt:

`sudo apt-get install qjackctl`

Du kannst auch einen [low-latency kernel]( https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) verwenden (z.B. für Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`) um die Latenz noch stärker zu reduzieren.

## Kompiliere Jamulus

Wechsle in das Jamulus Verzeichnis, das du vorher heruntergeladen hast:

```shell
cd jamulus-latest
```
Kompiliere den Quellcode (das letzte `make` kann einige Minuten dauern):

~~~
qmake Jamulus.pro
make clean
make
sudo make install
~~~

## Richte deine Soundkarte ein

### Konfiguriere Jack mit QJackCtl
Jamulus-Clients brauchen [Jack](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"}. Du musst Jack aber zuerst einrichten. Am Besten machst du das mit `qjackctl`.
1. Öffne die Kommandozeile
1. Führe `qjackctl` aus und warte, bis sich das **Jack Audio Connection Kit** öffnet.
2. Konfiguriere dein Audiointerface wie folgt (die genauen Einstellungen für Jack hängen von den Funktionen deiner Soundkarte ab):

- Wähle dein Audio **Interface** aus (es können mehrere in der Liste sichtbar sein)
- Setzte die **Sample Rate auf 48000**
- Setze die **Frames/Period Einstellung erst einmal auf 128** und Periods/Buffer zunächst auf 2

Starte Jack neu, um alle neuen Einstellungen zu übernehmen.

### Jamulus starten
1. Öffne die Kommandozeile oder führe Jamulus über deinen Desktop aus
1. Wenn du die Kommandozeile nutzt, führe den Befehl `Jamulus` (mit einem großen 'J') aus, um den Jamulus Client zu starten

Jamulus installiert sich nach `/usr/local/bin`.

Du kannst das Sourcecodeverzeichnis, in dem du kompiliert hast, jetzt löschen.

Wenn du Soundprobleme (kurze Unterbrechungen (Dropouts) o.Ä.) hast (insbesondere XRUNs, die von Jack/QJackCtl gemeldet werden), versuche größere Werte (z.B. 256 frames oder 3 periods) in Schritt 3 von oben zu setzen. Niedrigere Einstellungen (z.B. 64 frames) bieten zwar eine geringere Latenz, aber möglicherweise mehr Soundprobleme.
Siehe auch die [Fehlerbehebungsseite](Client-Troubleshooting).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Wenn du dein Audio-Equipment noch nicht eingerichtet hast, schau im [Hardware-Setup](Hardware-Setup).

Ausführliche Informationen zur Benutzung von Jamulus findest du im [Jamulus Help Manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

## Um deine Installation auf eine neue Version zu aktualisieren

Lade die neuen Quellen gemäß [Jamulus Sourcecode herunterladen](Installation-for-Linux#jamulus-sourcecode-herunterladen) herunter und wiederhole nur die [Kompilierungsanleitung](Installation-for-Linux#kompiliere-jamulus) wie für eine neue Installation von oben.

## Hinweise für Geeks

* Das "make clean" ist unerlässlich, um die automatisch generierten Qt-Dateien zu entfernen, die in der .tar.gz-Datei vorhanden sind und möglicherweise nicht mit der Qt-Version übereinstimmen, die du verwendest.

* Um eine externe, gemeinsam genutzte OPUS-Bibliothek anstelle der eingebauten zu verwenden, benutze qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* Um diese Datei zu benutzen, konfiguriere die Software mit `qmake "CONFIG+=noupcasename" Jamulus.pro`, um sicherzustellen, dass der Ausgabezielname dieser Software **j**amulus statt **J**amulus ist.

* Benutzer vom Raspberry Pi: Vielleicht möchtest du den Client auf einer anderen Maschine kompilieren und die Binärdatei auf einem anderen Raspberry Pi laufen lassen. In diesem Fall brauchst du nur die Bibliotheken für einen [headless server](Server-Linux#running-a-headless-server), aber _mit_ den Jack-Sound-Paketen. Schaut dir insbesondere die Fußnote für den headless-Build an.

* Ab Version 3.5.3 ist Jamulus nicht mehr mit Qt4 kompatibel.
