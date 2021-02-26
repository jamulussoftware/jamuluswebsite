---
layout: wiki
title: "Servidores Centrales"
lang: "es"
permalink: "/wiki/Central-Servers"
---

{% include breadcrumb.html root="Más" branch1="Ejecutar un Servidor" branch1-url="Running-a-Server" %}

# Registro de Servidor Público

Puesto que hay un límite de 150 servidores por cada servidor central, debes elegir en qué servidor central quieres publicar tu servidor. Selecciona un género si tu intención es restringir lo que se toca a ese estilo (los músicos verán tu servidor baje ese género en su lista).

Cuando arrancas un servidor público, verás un mensaje informando sobre si tu servidor se ha registrado con éxito o no. Si lo dejas arrancado, volverá a intentar registrarse hasta haya un hueco libre.

## Servidores 'Headless'

Configura el servidor central (por género) utilizando la opción `--centralserver` (`-e`) como se muestra a continuación:

| Género | Dirección Servidor |
|-----------|------------------|
|**Cualquier Género 1** |`anygenre1.jamulus.io:22124`|
|**Cualquier Género 2** |`anygenre2.jamulus.io:22224`|
|**Cualquier Género 3** |`anygenre3.jamulus.io:22624`|
|**Género Rock** |`rock.jamulus.io:22424`|
|**Género Jazz** |`jazz.jamulus.io:22324`|
|**Género Clásico/Folk** |`classical.jamulus.io:22524`|
|**Género Coral/Barbershop** |`choral.jamulus.io:22724`|
