---
layout: wiki
title: "Servidores Centrales"
lang: "es"
permalink: "/wiki/Central-Servers"
---

# Registro de Servidor Público

A fecha de Mayo 2020, para minimizar el problema de sobrepasar el límite del número de servidores, hemos creado Servidores Centrales organizados por género (cada uno con un límite de 150 servidores).

Cuando arrancas un servidor público, verás un mensaje informando sobre si tu servidor se ha registrado con éxito o no. Si lo dejas arrancado, volverá a intentar registrarse hasta haya un hueco libre.

## Servidores 'Headless'

A partir de Jamulus v3.5.4, necesitarás configurar el servidor central (por género) manualmente utilizando la opción `--centralserver` (`-e`) como se muestra a continuación:

| Género | Dirección Servidor |
|-----------|------------------|
| **Todos/Cualquiera** | `jamulusallgenres.fischvolk.de:22224` |
| **Rock** | `jamulusrock.fischvolk.de:22424` |
| **Jazz** | `jamulusjazz.fischvolk.de:22324` |
| **Clásica/Folk/Coro** | `jamulusclassical.fischvolk.de:22524` |
| Predeterminado _(obsoleto a partir de Jamulus v3.5.4)_ | `jamulus.fischvolk.de:22124` |
