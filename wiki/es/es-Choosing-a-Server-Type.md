---
layout: wiki
title: "Elegir un Tipo de Servidor"
lang: "es"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Tipos de servidor

Puedes ejecutar tu servidor en uno de tres "modos" (bien en casa o en un host de terceros):

### 1. Público
Tu servidor aparecerá en la lista del [servidor central](Central-Servers) que los clientes utilizan por defecto. Los músicos ya pueden ver y conectarse a tu servidor. No es necesario ejecutarlo como un servidor público ya que muchas otras personas ya los están ejecutando. Simplemente conéctate a uno con latencia baja y empieza a tocar.

![PublicServer](https://user-images.githubusercontent.com/70917001/94502850-6fcb6b80-01db-11eb-9b0a-b3ca4a9bcc34.png
)

Este modo se activa con la casilla de "Mi Servidor es Público" y (opcionalmente) rellenando los campos de información sobre tu servidor.

Cuando se ejecuta sin GUI ("headless"), lo siguiente configuraría un servidor público:

~~~
Jamulus --nogui --server \
        --centralserver géneroServidor:puerto \
        --serverinfo "nombreDeTuServidor;tuCiudad;[ID País]"
~~~

**Nota**: **No** es necesario abrir puertos ni realizar ninguna configuración del router para habilitar un servidor público.

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.


### 2. Privado
Este tipo de servidor no figurará en una lista de servidores central. Debes proporcionar a los músicos la dirección de tu servidor para que puedan conectar sus clientes. Ver también [Ejecutar un Servidor Privado](Running-a-Private-Server) para ver lo necesario para que otros se conecten a él.

![PrivateServer](https://user-images.githubusercontent.com/70917001/94502827-66420380-01db-11eb-94df-dbe3985d3665.png)

Este modo se habilita desactivando "Mi Servidor es Público".

Cuando se ejecuta sin GUI ("headless"), lo siguiente configuraría un servidor privado:

```shell
Jamulus --nogui --server
```

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.

### 3. Central
Configurar tu servidor como un Servidor Central solo necesita hacerse en circunstancias especiales (por ej. para eventos online o asociaciones musicales). La mayoría de las personas pueden ignorar este tipo.

Para ver servidores listados por un servidor central personalizado, los músicos deben introducir la dirección en el campo "Servidor Central Personalizado" de su cliente. Verán entonces una lista en Configuración de Conexión que es generada por ese servidor central.

Los operadores de servidores convencionales también pueden registrarse con tu servidor central personalizado para que los suyos aparezcan en tu lista de servidores, estableciéndolo con la opción de `--centralserver`.

Para ejecutar un servidor como central, se debe configurar con `--centralserver localhost` (esto es, se especifica como el servidor central que recibe consultas).

Si quieres controlar qué servidores pueden registrarse con tu servidor central, puedes habilitar una lista blanca con la opción de línea de comandos `--listfilter`. Ver la [página de opciones de la línea de comandos](Command-Line-Options) para más información sobre esta característica.

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.
