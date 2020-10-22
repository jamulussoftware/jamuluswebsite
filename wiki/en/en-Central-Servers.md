---
layout: wiki
title: "Central Servers"
lang: "en"
permalink: "/wiki/Central-Servers"
---

# Public Server Registration

As of May 2020, in order to minimise the problem of exceeding the server limit, we have created genre-based Central Servers (each with a current limit of 150 servers). 

When you start a public server, you will see a message saying whether your server has been successfully listed or not. If you leave your server running, it will re-try its attempts to register until a free slot becomes available.  

## Headless servers

As of Jamulus v3.5.4, you will need to set central (genre) server manually using the `--centralserver` (`-e`) option as follows:

| Genre |   Server address           |
|-----------|------------------|
|**All/Any** |`jamulusallgenres.fischvolk.de:22224`    |
|**Rock**|`jamulusrock.fischvolk.de:22424`|
|**Jazz**|`jamulusjazz.fischvolk.de:22324`|
|**Classical/Folk/Choir**|`jamulusclassical.fischvolk.de:22524`|
|Default _(deprecated as of Jamulus v3.5.4)_|`jamulus.fischvolk.de:22124`|
