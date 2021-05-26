---
lang: es
layout: wiki
permalink: /wiki/Choosing-a-Server-Type
title: 'Elegir un Tipo de Servidor'
---

{% include breadcrumb.html root="Más" branch1="Ejecutar un Servidor" branch1-url="Running-a-Server" %}

# Tipos de servidor

Puedes ejecutar tu servidor en uno de tres "modos" (bien en casa o en un host de terceros):

### 1. Público

Tu servidor aparecerá en la lista del [servidor de directorio](Directory-Servers) que los clientes utilizan por defecto. Los músicos ya pueden ver y conectarse a tu servidor. No es necesario ejecutarlo como un servidor público ya que muchas otras personas ya los están ejecutando. Simplemente conéctate a uno con latencia baja y empieza a tocar.

<figure><img src="{{site.url}}/assets/img/es-screenshots/diagram-public-server.png" loading="lazy" alt="Diagram of connections between clients within a Jamulus public server"></figure>

Este modo se activa con la casilla de "Registrar mi servidor..." y (opcionalmente) rellenando los campos de información sobre tu servidor.

Cuando se ejecuta sin GUI ("headless"), lo siguiente configuraría un servidor público:

Jamulus --nogui --server \
        --centralserver géneroServidor:puerto \
        --serverinfo "nombreDeTuServidor;tuCiudad;[ID País]"

**Nota**: **No** es necesario abrir puertos ni realizar ninguna configuración del router para habilitar un servidor público.

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.


### 2. Privado

Este tipo de servidor no figurará en una lista de servidores de directorios. Debes proporcionar a los músicos la dirección de tu servidor para que puedan conectar sus clientes. Ver también [Ejecutar un Servidor Privado](Running-a-Private-Server) para ver lo necesario para que otros se conecten a él.

<figure><img src="{{site.url}}/assets/img/en-screenshots/diagram-private-server.png" loading="lazy" alt="Diagram of connections between clients within a Jamulus private server"></figure>

Este modo se habilita desactivando "Mi Servidor es Público...".

Cuando se ejecuta sin GUI ("headless"), lo siguiente configuraría un servidor privado:

```shell Jamulus --nogui --server ```

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.

### 3. Directorio

Configurar tu servidor como un Servidor de Directorio solo necesita hacerse bajo circunstancias especiales (por ej. para eventos online o asociaciones musicales). La mayoría de las personas pueden ignorar este tipo.

Para ver servidores listados por un servidor de directorios personalizado, los músicos deben introducir la dirección en el campo "Servidor de Directorio Personalizado" de su cliente. Verán entonces una lista en Configuración de Conexión que es generada por ese directorio de servidores.

Los operadores de servidores convencionales también pueden registrarse con tu servidor de directorio personalizado para que los suyos aparezcan en tu lista de servidores, estableciéndolo con la opción de `--centralserver`. -i

Para ejecutar un servidor como Servidor de Directorio, se debe configurar con `--centralserver localhost` (esto es, se especifica como el servidor de directorio que recibe consultas).

#### Notas sobre la configuración

Si quieres controlar qué servidores pueden registrarse con tu Servidor de Directorio, puedes habilitar una lista blanca con la opción de línea de comandos `--listfilter`. Ver la [página de opciones de la línea de comandos](Command-Line-Options) para más información sobre esta característica.

Al ejecutar un Servidor de Directorio tras un cortafuegos NAT en una red privada, utiliza la opción `--serverpublicip` para especificar la dirección IP pública del/los servidor/es listados en tu Servidor de Directorio. Esto es necesario para permitir a los clientes de la Internet pública conectarse a ellos a través de NAT. Ten en cuenta que para los servidores utilizando esta opción, seguirás necesitando abrir los puertos apropiados en tu router/cortafuegos.
