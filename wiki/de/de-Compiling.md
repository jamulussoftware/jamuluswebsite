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

### Benötigte Software
* Ein Compiler wie [Visual Studio](https://visualstudio.microsoft.com) (Du brauchst nur [Build Tools 2017 oder 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16), aber du kannst auch die komplette IDE herunterladen und installieren [Visual Studio Download Seite](https://visualstudio.microsoft.com/downloads/))
* [Qt](https://www.qt.io/download)
    * Nutze die kostenlose Open Source Version (Lizenziert unter der GPLv2-Lizenz für Open Source Entwicklung
    * Um herauszufinden, welche Qt-Version du brauchst, schau in der [qt-installer-windows.qs](https://github.com/jamulussoftware/jamulus/blob/master/windows/qt-installer-windows.qs) Datei nach: unter INSTALL_COMPONENTS siehst du z.B. `qt.qt5.[version]`, 5123 wäre version 5.12.3.
    * Wähle die Komponenten während der Installation aus: Öffne den Qt-Abschnitt, suche nach der passenden Version, z.B., **Qt 5.12.3**, und wähle die Compiler components für deinen Compiler, z.B., `MSVC 2017 32-bit/64-bit` für Visual Studio 2019, aus
* [ASIO SDK Dateien](https://new.steinberg.net/de/developers/)


### Downloade den Jamulus Quellcode
Lade den Quellcode z.B. mit git oder per [zip Download](https://github.com/jamulussoftware/jamulus/archive/master.zip) aus der [Jamulus Repo](https://github.com/jamulussoftware/jamulus) herunter. Stelle sicher, dass **keine** Leerzeichen im Pfad sind, in den du den `jamulus` Ordner verschiebst, da ansonsten der Jamulus Installer nicht korrekt erstellt werden kann. (Wenn du weißt, wie man diesen Fehler einfach lösen kann, schreib einfach im [issue #864](https://github.com/jamulussoftware/jamulus/issues/864) auf der Jamulus Repository).

### Mit Installer kompilieren

Die meisten Nutzer werden diese Methode nutzen wollen.

1. Öffne PowerShell
1. Navigiere in den `jamulus` Ordner
1. Um unsignierte Scripts ausführen zu können, klicke mit der rechten Maustaste auf das `windows\deploy_windows.ps1` Skript, wähle Eigenschaften aus und erlaube dem Script, dass es ausgeführt werden darf. Du kannst auch `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell ausführen. (Du kannst das nach dem Ausführen des Scripts auch rückgängig machen. Mehr Informationen findest du auf der [Microsoft PowerShell Dokumentationsseite](https://docs.microsoft.com/de-de/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.1)).
1. Setze die $QtCompile32 und $QtCompile64 Variablen.
1. Führe das Script in PowerShell aus `.\windows\deploy_windows.ps1 C:\Qt\QtVersion`.
1. Jetzt kannst du den Jamulus installer im `.\deploy` Ordner finden.

### Nur kompilieren

1. Erstelle einen Ordner im `\windows` Ordner mit dem Namen ASIOSDK2.
1. Lade die [ASIOSDK](https://www.steinberg.net/asiosdk) herunter, öffne den Ordner auf der ersten Ebene in der .zip Datei und kopiere den Inhalt nach `[\pfad\zum\jamulus\code]\windows\ASIOSDK2`, sodass z.B. `[\pfad\zum\jamulus\code]\windows\ASIOSDK2\common` existiert.
1. Öffne Jamulus.pro im Qt Creator, konfiguriere das Projekt mit dem Default kit, dann klicke auf Compile & run


## Allgemeine Anmerkungen

### Der "headless" build Flag

Kompilieren mit dem `headless` Flag kann unter folgenden Umständen die Installation einiger abhängiger Pakete vermeiden, was etwas Speicherplatz spart und eventuell die Kompilierzeit beschleunigt:

1. Wenn du Jamulus unter Gentoo Linux ausführen willst, sind die einzigen Pakete, die du für einen headless build brauchst, `qtcore`, `qtnetwork`, `qtconcurrent` und `qtxml` (sowohl für das Kompilieren als auch für den Betrieb des Servers).

1. Wenn du Jamulus unter Ubuntu/Debian nutzt, benötigst du zwar alle Pakete um die Binärdatei zu **kompilieren**; um den fertigen headless Jamulus-Server **auszuführen**, brauchst du aber nur `libqt5core5a`, `libqt5network5`, `libqt5xml5` und eventuell `libqt5concurrent5`. Wenn du das Jamulus Binary auf eine andere Maschine (wie z.B. einen Raspberry Pi) kopierst, brauchst du auch nur diese Pakete.

1. Wenn du einen GUI Client erstellen möchtest um ihn auf einem anderen Rechner auszuführen (z.B. einem Raspberry Pi), dann brauchst du nur die Abhängigkeiten des [headless Servers](Server-Linux#running-a-headless-server) (siehe Punkt oben) und zusätzlich die JACK-Soundbibliotheken.
