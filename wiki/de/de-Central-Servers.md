---
layout: wiki
title: "Zentrale Server"
lang: "de"
permalink: "/wiki/Central-Servers"
---

{% include breadcrumb.html root="Mehr" branch1="Server einrichten" branch1-url="Running-a-Server" %}

# Öffentliche Zentrale Server

Da jeder Zentralserver ein Limit von 150 Servern hat, musst du einen Zentralserver aussuchen, auf dem du deinen Server registrieren willst. Suche dir ein Genre aus, wenn du möchtest, dass eher Musiker eines bestimmten Genres auf deinem Server spielen (Musiker können deinen Server in ihrer Genre Liste sehen).

Wenn du deinen Server im öffentlichen Modus startest, wird dir angezeigt, ob dein Server erfolgreich registriert werden konnte, oder nicht. Sollte das nicht der Fall sein du aber deinen Server nicht stoppst, wird er immer wieder versuchen sich zu registrieren, bis ein freier Slot verfügbar ist.  

## Headless Server

Setze den zentralen (Genre-)Server in der Kommandozeile mit der Option `--centralserver` (`-e`) wie folgt:

| Genre |   Server address           |
|-----------|------------------|
|**Alle Genres 1** |`anygenre1.jamulus.io:22124`    |
|**Alle Genres 2** |`anygenre2.jamulus.io:22224`|
|**Alle Genres 3** |`anygenre3.jamulus.io:22624`|
|**Genre Rock** |`rock.jamulus.io:22424`|
|**Genre Jazz** |`jazz.jamulus.io:22324`|
|**Genre Klassik/Folk** |`classical.jamulus.io:22524`|
|**Genre Chor/Barbershop** |`choral.jamulus.io:22724`|
