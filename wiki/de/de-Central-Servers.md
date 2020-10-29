---
layout: wiki
title: "Zentrale Server"
lang: "de"
permalink: "/wiki/Central-Servers"
---

# Registrierung : Öffentliche Server

Um das Problem der Überschreitung des Serverlimits auf ein Minimum zu reduzieren, haben wir ab Mai 2020 genrebasierte zentrale Server eingeführt (mit einer derzeitigen Begrenzung auf jeweils 150 Server).

Wenn Sie einen öffentlichen Server starten, sehen Sie eine Meldung, ob Ihr Server erfolgreich gelistet wurde oder nicht. Wenn Sie Ihren Server laufen lassen, wird er seine Registrierungsversuche wiederholen, bis ein freier Slot verfügbar wird.  

## Headless Server

Ab Jamulus v3.5.4 müssen Sie den zentralen (Genre-)Server manuell mit der Option `--centralserver` (`-e`) wie folgt einstellen:

| Genre |   Server address           |
|-----------|------------------|
|**All/Any** |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**|`jamulusrock.fischvolk.de:22424`|
|**Jazz**|`jamulusjazz.fischvolk.de:22324`|
|**Klassik/Folklore/Chor**|`jamulusclassical.fischvolk.de:22524`|
|Default _(veraltet seit Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`|
