---
layout: wiki
title: "Installation auf Linux"
lang: "de"
permalink: "/wiki/Installation-for-Linux"
---
{% include breadcrumb.html root="Jamulus nutzen" branch1="Erste Schritte" branch1-url="Getting-Started" %}

# Installation auf Linux
Wenn du die [Erste Schritte](Getting-Started) Seite noch nicht gelesen hast, solltest du das nachholen.

Obwohl wir momentan keine offiziellen Pakete für jede Linux Distribution anbieten, könnte es sein, dass du Jamulus über den Paketmanager deiner Distribution installieren kannst. Schau einfach in dieser Tabelle nach:

[![Packaging status](https://repology.org/badge/vertical-allrepos/jamulus.svg)](https://repology.org/project/jamulus/versions)

Eine Liste inoffizieller [Pakete für verschiedene Distributionen findest du hier](https://github.com/jamulussoftware/jamulus/discussions/914).

### Flatpak

Jamulus existiert als [Flatpak](https://flatpak.org/) auf [Flathub hier](https://flathub.org/apps/details/io.jamulus.Jamulus). Um das Jamulus Flatpak zu nutzen musst du pipewire konfigurieren.

### Debian and Ubuntu
Jamulus kann aus den [buster-backports](https://packages.debian.org/de/buster-backports/jamulus) oder - wenn du amd64 **Debian**/**Ubuntu** installiert hast - als .deb Datei installiert werden:

1. Downloade die [neuste .deb Datei]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Update apt: `sudo apt-get update`
1. Installiere das Paket: `sudo apt install /path/to/{{ site.download_file_names.deb-gui }}`.
1. Da Jamulus den JACK Server benötigt, musst du ihn auch installieren. Wir empfehlen, dass du `QjackCtl` zur Konfiguration von JACK benutzt. Installiere das Programm mit `sudo apt-get install qjackctl`

Jetzt kannst du dir die Sektion "[Richte deine Soundkarte ein](#richte-deine-soundkarte-ein)" ansehen.

**Beachte:** Dank [mirabilos](https://github.com/mirabilos) ist Jamulus (mit GUI) in den [Debian Bullseye (testing)](https://packages.debian.org/bullseye/jamulus) Paketquellen. Wenn du schon Bullseye nutzt, kannst du Jamulus via `sudo apt-get install jamulus` installieren.

---

Wenn du Jamulus nicht in den Paketquellen deiner Distro finden kannst, musst du Jamulus kompillieren. Das ist nicht schwer:

## Jamulus Sourcecode herunterladen

1. Öffne ein Terminalfenster (Kommandozeile: `Strg+Alt+T` auf Ubuntu und verwandten Distributionen)
1. Lade den Sourcecode für die neueste Version herunter und entpacke diesen:
```shell
wget https://github.com/jamulussoftware/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```

## Abhängigkeiten installieren

Aktualisiere zuerst deine Paketquellen (z.B. auf Debian-basierten Distributionen mit `sudo apt-get update`).

Auf **Ubuntu-basierten** Distributionen 18.04+, Debian 9+ oder 10 und Raspberry Pi Raspbian Buster oder neuer:

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Auf **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus libQt5Concurrent5 jack-audio-connection-kit-devel
```

### QjackCtl: Empfohlen, aber nicht zwingend notwendig

[QjackCtl](https://qjackctl.sourceforge.io) ist ein Programm, das den JACK Audioserver (den du vorher installiert hast) über eine GUI einrichten kann. Installiere QjackCtl z.B. wie folgt:

```shell
sudo apt-get install qjackctl
```

Du kannst auch einen [low-latency kernel]( https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) verwenden (z.B. für Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`) um die Latenz noch stärker zu reduzieren.

## Kompiliere Jamulus

Wechsle in das Jamulus Verzeichnis, das du vorher heruntergeladen hast:

```shell
cd jamulus-latest
```
Kompiliere den Quellcode (das letzte `make` kann einige Minuten dauern):

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```
**Beachte**: Die kompilierte Version von Jamulus wird nach `/usr/local/bin` kopiert.

Du kannst jetzt den Quellcode-Ordner löschen.

## Richte deine Soundkarte ein

### Konfiguriere Jack mit QjackCtl
Jamulus Clients brauchen [JACK](https://jackaudio.org/). Du musst JACK aber zuerst einrichten. Am Besten machst du das mit `QjackCtl`.
1. Öffne die Kommandozeile z.B. mit STRG-ALT-T
1. Führe `qjackctl` aus und warte, bis sich das **Jack Audio Connection Kit** öffnet.
2. Konfiguriere dein Audiointerface wie folgt (die genauen Einstellungen für JACK hängen von den Funktionen deiner Soundkarte ab):

- Wähle dein Audio **Interface** aus (es können mehrere in der Liste sichtbar sein)
- Setzte die **Sample Rate auf 48000**
- Setze die **Frames/Period Einstellung erst einmal auf 128** und Periods/Buffer zunächst auf 2

Starte JACK neu, um alle neuen Einstellungen zu übernehmen.

### Jamulus starten
Öffne Jamulus z.B. mit der Kommandozeile. Wenn du sie benutzt, führe den Befehl `jamulus`, oder wenn du Jamulus selbst kompiliert hast `Jamulus` (mit einem großen 'J') aus, um den Jamulus Client zu starten

Wenn du Soundprobleme (kurze Unterbrechungen (Dropouts) o.Ä.) hast (insbesondere XRUNs, die von Jack/QjackCtl gemeldet werden), versuche größere Werte (z.B. 256 Frames oder 3 Perioden) zu setzen. Niedrigere Einstellungen (z.B. 64 Frames) bieten zwar eine geringere Latenz, aber möglicherweise mehr Soundprobleme.
Siehe auch die [Fehlerbehebungsseite](Client-Troubleshooting).

## Alles installiert?
Jamulus wurde installiert und kann jetzt benutzt werden. Wenn du willst, kannst du jetzt auf die folgende Seite gehen:

[Nach der Installation](Onboarding){: .button}

## Installation auf eine neue Version zu aktualisieren

Lade die neuen Quellen gemäß [Jamulus Sourcecode herunterladen](Installation-for-Linux#jamulus-sourcecode-herunterladen) herunter und wiederhole nur die [Kompilierungsanleitung](Installation-for-Linux#kompiliere-jamulus) wie für eine neue Installation von oben oder nutze ein neues .deb Paket, wenn du das genutzt hast.

## Hinweise für Geeks

* Du musst "make clean" ausführen, um die automatisch generierten Qt-Dateien (die in der .tar.gz-Datei vorhanden sind und möglicherweise nicht mit der Qt-Version, die du verwendest, übereinstimmen) zu entfernen.

* Um eine externe, gemeinsam genutzte OPUS-Bibliothek anstelle der eingebauten zu verwenden, benutze qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* Um diese Datei zu benutzen, konfiguriere die Software mit `qmake "CONFIG+=noupcasename" Jamulus.pro`, um sicherzustellen, dass der Ausgabezielname dieser Software **j**amulus statt **J**amulus ist.

* Benutzer vom Raspberry Pi: Vielleicht möchtest du den Client auf einer anderen Maschine kompilieren und die Binärdatei auf einem anderen Raspberry Pi laufen lassen. In diesem Fall brauchst du nur die Bibliotheken für einen [headless server](Server-Linux#running-a-headless-server), aber _mit_ den JACK-Sound-Paketen. Schaut dir insbesondere die Fußnote für den headless-Build an.

* Ab Version 3.5.3 ist Jamulus nicht mehr mit Qt4 kompatibel.
