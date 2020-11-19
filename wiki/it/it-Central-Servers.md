---
layout: wiki
title: "Central Servers"
lang: "it"
permalink: "/wiki/Central-Servers"
---

# Registrare un Server Pubblico

A partire da maggio 2020, per ridurre al minimo il rischio di sovraccaricare il server centrale, abbiamo creato diversi server basati sul genere musicale (ciascuno con un limite attuale di 150 server).

Quando avvii un server pubblico, vedrai un messaggio che ti conferma se il tuo server è stato inserito nell'elenco correttamente o meno. Se lasci il tuo server in esecuzione, tenterà di registrarsi finché non sarà disponibile uno slot libero.

## Headless servers (Senza GUI)

A partire da Jamulus v3.5.4, sarà necessario impostare manualmente l'indirizzo del server centrale (con le informazioni sul genere) utilizzando l'opzione  `--centralserver` (`-e`) come riportato di seguito:

| Genre |   Server address           |
|-----------|------------------|
|**All/Any** |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**|`jamulusrock.fischvolk.de:22424`|
|**Jazz**|`jamulusjazz.fischvolk.de:22324`|
|**Classical/Folk/Choir**|`jamulusclassical.fischvolk.de:22524`|
|Default _(in disuso a partire da Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`|
