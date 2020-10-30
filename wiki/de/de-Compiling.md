---
layout: wiki
title: "Kompilieren"
lang: "de"
permalink: "/wiki/Compiling"
---

# Jamulus kompilieren

## Linux

Lies bitte die [Client Installationsseite](Installation-for-Linux) oder diese Instruktionen wenn du einen [Headless-Server kompilieren](Server-Linux#running-a-headless-server) willst.

## MacOS
Du brauchst Jamulus nicht für MacOS zu kompilieren, da wir offizielle Binärdateien zur Verfügung stellen. Aber wenn Du es wirklich willst, folge den unten stehenden Anweisungen.
### Anforderungen

1. Installiere XCode
1. Installiere QT wie folgt

```shell
brew install qt5
brew link qt5 --force
```

### Projekt bauen

#### XCode-Projektdatei erzeugen
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Anzeigen von Build-Targets und der Konfiguration in der Konsole
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

#### Projekt bauen

```shell
xcodebuild build
```

Erstellt die Datei und stellt sie in ./Release/Jamulus.app zur Verfügung


## Windows
Du brauchst Jamulus nicht für Windows zu kompilieren, da wir offizielle Binärdateien zur Verfügung stellen. Aber wenn Du es wirklich willst, folge den unten stehenden Anweisungen.

**benötigte Software**: [QT](https://www.qt.io/download), ein Compiler wie zum Beispiel Visual Studio, ASIO Development Dateien

- Hole die Jamulus-Quellcode z.B. per git oder per Zip-Download aus dem Jamulus Repo
- hole und kopiere die Entwicklungsdateien [ASIOSDK](https://www.steinberg.net/de/company/developer.html) in das Verzeichnis jamulus/windows, so dass z.B. das
  Verzeichnis jamulus/windows/ASIOSDK2/common existiert
- öffne Jamulus.pro im Qt Creator und starte dann Kompilieren & Ausführen


## Allgemeine Anmerkungen

### Der "headless" build Schalter

Kompilieren mit dem `headless` Schalter bedeutet, dass unter den folgenden Umständen die Installation einiger abhängiger Pakete vermieden, etwas Plattenplatz gespart und/oder die Kompilierzeit beschleunigt wird:

1. Wenn Du planst, Jamulus unter Gentoo Linux laufen zu lassen, sind die einzigen Pakete, die Du für einen headless build benötigen solltest, qtcore, qtnetwork und qtxml (sowohl für das Kompilieren als auch für den Betrieb des Servers).

1. Wenn Du Jamulus unter Ubuntu/Debian betreibst, benötigst Du alle abhängigen Pakete, um die Binärdatei zu **kompilieren**. Um den fertigen headless Jamulus-Server **auszuführen**, solltest Du nur `libqt5core5a`, `libqt5network5`, `libqt5xml5` und eventuell `libqt5concurrent5` benötigen. Dies kann für die Kompilierung/Aktualisierung auf einer Maschine nützlich sein, um die Binärdatei auf einer anderen Maschine (z.B. einem Raspberry Pi) auszuführen.

1. Beachte, wenn du einen GUI Client erstellen möchtest um ihn auf einem anderen Rechner auszuführen (z.B. einem Raspberry Pi), dann brauchst du nur die Abhängigkeiten die bei [headless Server](Server-Linux#running-a-headless-server) (siehe Punkt oben) aufgeführt sind, jedoch zusätzlich _mit_ den Jack-Soundbibliotheken.
