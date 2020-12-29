---
layout: wiki
title: "Kompilieren"
lang: "de"
permalink: "/wiki/Compiling"
---

# Jamulus kompilieren

## Linux

Lies bitte die [Client Installationsseite](Installation-for-Linux) oder die Anleitung zum kompilieren eines [Headless-Servers](Server-Linux#running-a-headless-server) durch.

## macOS
Du musst Jamulus nicht für MacOS kompilieren, da wir offizielle Binärdateien zur Verfügung stellen. Aber wenn du es aber trotzdem machen willst, folge den unten stehenden Anweisungen.

### Anforderungen

1. Installiere XCode
1. Installiere Qt wie folgt

```shell
brew install qt5
brew link qt5 --force
```

### Projekt erstellen

#### XCode-Projektdatei erzeugen
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Anzeigen von Build-Targets und Konfiguration in der Konsole
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
sollte folgendes zeigen
```shell
Targets:
    Jamulus
    Qt Preprocess

Build Configurations:
    Debug
    Release

If no build configuration is specified and -scheme is not passed then "Release" is used.

Schemes:
    Jamulus
```

#### Projekt kompilieren

```shell
xcodebuild build
```

Erstellt die Binärdatei in `./Release/Jamulus.app`


## Windows
Du brauchst Jamulus für Windows nicht zu kompilieren, da wir offizielle Binärdateien zur Verfügung stellen. Aber wenn du es aber trotzdem machen willst, folge den unten stehenden Anweisungen.

**benötigte Software**: [QT](https://www.qt.io/download), ein Compiler wie Visual Studio, ASIO Development SDK

- Lade den Jamulus-Quellcode z.B. per git oder per Zip-Download aus dem Jamulus Repo herunter
- Downloade und kopiere die Dateien der [ASIOSDK](https://www.steinberg.net/de/company/developer.html) in ein Verzeichnis `[\pfad\zum\jamulus\quellcode]\windows`, damit u.A. das
  Verzeichnis `[\pfad\zum\jamulus\quellcode]\windows\ASIOSDK2\common` existiert
- Öffne Jamulus.pro im Qt Creator und kompiliere das Programm

## Allgemeine Anmerkungen

### Der "headless" build Flag

Kompilieren mit dem `headless` Flag kann unter folgenden Umständen die Installation einiger abhängiger Pakete vermeiden, was etwas Speicherplatz spart und eventuell die Kompilierzeit beschleunigt:

1. Wenn du Jamulus unter Gentoo Linux ausführen willst, sind die einzigen Pakete, die du für einen headless build brauchst, `qtcore`, `qtnetwork`, `qtconcurrent` und `qtxml` (sowohl für das Kompilieren als auch für den Betrieb des Servers).

1. Wenn du Jamulus unter Ubuntu/Debian nutzt, benötigst du zwar alle Pakete um die Binärdatei zu **kompilieren**; um den fertigen headless Jamulus-Server **auszuführen**, brauchst du aber nur `libqt5core5a`, `libqt5network5`, `libqt5xml5` und eventuell `libqt5concurrent5`. Wenn du das Jamulus Binary auf eine andere Maschine (wie z.B. einen Raspberry Pi) kopierst, brauchst du auch nur diese Pakete.

1. Wenn du einen GUI Client erstellen möchtest um ihn auf einem anderen Rechner auszuführen (z.B. einem Raspberry Pi), dann brauchst du nur die Abhängigkeiten des [headless Servers](Server-Linux#running-a-headless-server) (siehe Punkt oben) und zusätzlich die JACK-Soundbibliotheken.
