---
layout: wiki
title: "Zentrale Server"
lang: "de"
permalink: "/wiki/Central-Servers"
---

# Öffentliche Zentrale Server

Um das Problem der Überschreitung des Serverlimits zu reduzieren, haben wir ab Mai 2020 genrebasierte zentrale Server eingeführt (mit einer derzeitigen Begrenzung auf jeweils 150 Server).

Wenn du deinen Server im öffentlichen Modus startest, wird im Server angezeigt, ob dein Server erfolgreich registriert werden konnte, oder nicht. Wenn du deinen Server nicht stoppst, wird er immer wieder versuchen sich zu registrieren, bis ein freier Slot verfügbar ist.  

## Headless Server

Ab Jamulus v3.5.4 musst du den zentralen (Genre-)Server in der Kommandozeile manuell mit der Option `--centralserver` (`-e`) setzen. Das sind die offiziellen zentralen Server:

| Genre |   Server address           |
|-----------|------------------|
|**All/Any** |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**|`jamulusrock.fischvolk.de:22424`|
|**Jazz**|`jamulusjazz.fischvolk.de:22324`|
|**Klassik/Folklore/Chor**|`jamulusclassical.fischvolk.de:22524`|
|Default _(veraltet seit Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`|
