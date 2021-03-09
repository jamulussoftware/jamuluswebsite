---
layout: wiki
title: "Mithelfen"
lang: "de"
permalink: "/wiki/Contribution"
---

# Bei Jamulus mithelfen

## Jamulus Software
* Wenn du Code beisteuern willst oder einen Feature Request hast, [eröffne ein Issue auf GitHub](https://github.com/jamulussoftware/jamulus/issues/) (bevorzugt) oder [poste deine Idee im Forum](https://github.com/jamulussoftware/jamulus/discussions), damit wir deine Idee erst diskutieren können. Danach kannst du einen Pull Request eröffnen. Lies dir am Besten erst einmal das [manifesto for contributions](https://github.com/jamulussoftware/jamulus/discussions/915) von Volker Fischer (Hauptentwickler) und die [CONTRIBUTING Datei](https://github.com/jamulussoftware/jamulus/blob/master/CONTRIBUTING.md) durch.

Mehr (englische) Informationen findest du im  [Jamulus GitHub repo](https://github.com/corrados/jamulus).

## Jamulus Website
* Wenn du einen Fehler, oder eine veraltete Information (egal in welcher Sprache) findest, bitte öffne einen [GitHub Issue auf Englisch hier](https://github.com/jamulussoftware/jamuluswebsite/issues).
* Wenn dir irgendeine Information fehlt oder ein Eintrag verbessert werden sollte, poste deine Idee (auf Englisch) [im Forum](https://github.com/jamulussoftware/jamulus/discussions), damit wir es mit dir diskutieren können.

Schau dir die [CONTRIBUTING-Datei](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md) für die Website und das [Website GitHub repo](https://github.com/jamulussoftware/jamuluswebsite) für weitere Informationen an.


### Ich kenne GitHub nicht. Was muss ich wissen?

**Der folgende Inhalt bezieht sich nur auf die Dokumentation auf jamulus.io, nicht auf die Jamulus Software!**

Wenn du dich mit Pull Requests, Commits, etc. nicht auskennst, eröffne einfach ein „Issue“. Wir werden uns dann um deine Änderungen kümmern. Wenn du die Änderungen selbst durchführen willst und einen Pull Request öffnest, folge dieser Anleitung:

1. Forke das Repo (es gibt einen Fork-Button oben rechts auf der GitHub-Seite)
2. Entscheide, in welchen Zweig („Branch“) du deine Änderungen commitest, also wo du deine Änderung anwenden willst. (Faustregel: alles, was eventuell übersetzt werden muss, sollte in den `changes` Branch gehen, Tippfehler sollten in den `release` Branch gehen; mehr Informationen findest du in der [CONTRIBUTING Datei](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md)). Erstelle auf deinem Fork einen neuen Branch aus dem Branch, den du gewählt hast
3. Verändere was du verändern möchtest
4. Wenn du die Änderungen lokal gemacht hast, pushe den neuen Branch in dein Repository
5. Eröffne einen Pull Request, beschreibe kurz was du geändert hast und verlinke den Issue, das du geöffnet hast
6. Warte auf ein Review und ein Merge

**Hinweis (für git):** *Merge deine Veränderungen nicht in deinen lokalen `changes` Branch*, sondern halte ihn nur durch einen Pull vom entfernten Jamulus Website Repository synchron. Erstelle einen neuen Branch für deine vorgeschlagenen Änderungen.
Wenn der `changes` Branch geändert wird, bevor du deine Veränderungen einreichst, halte den lokalen `changes` Branch durch Pull vom offiziellen Zweig synchron, führe den lokalen `changes` Zweig in deinen Arbeitszweig zusammen (merge), löse Konflikte auf, pushe deine Änderungen und erstelle den Pull Request.
