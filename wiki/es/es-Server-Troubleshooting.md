---
layout: wiki
title: "Server Troubleshooting"
lang: "es"
permalink: "/wiki/Server-Troubleshooting"
---

# Resolución de Problemas

## Servidores - Públicos

### ¿Por qué no aparece mi servidor en la lista? ¿Por qué no se registra?

Si se ha registrado correctamente (lo puedes [ver aquí](https://explorer.jamulus.io/)) y tú o los demás músicos no pueden ver el servidor, quizá tengas que esperar, o iniciar el cliente con la opción `--showallservers` e intentar conectar desde ahí ([ver esta página](Command-Line-Options) sobre cómo arrancar tu cliente con una opción de configuración).

Si ves un mensaje diciendo que el servidor está completo, por favor [lee esta nota](Central-Servers) sobre Servidores Centrales.

Puedes verificar que tu servidor aparece en la lista del género relevante [comprobándolo aquí](https://explorer.jamulus.io/).

## Servidores - Privados

### Estoy ejecutando mi cliente en la misma máquina/red que mi servidor pero no me puedo conectar a él

Conecta tu cliente a `127.0.0.1` (o `localhost` si eso te funciona). Si estás ejecutando el cliente en una máquina distinta a la del servidor pero en la misma red, conéctate a la dirección de _red local_ del servidor. No te conectes con la dirección pública (WAN) del servidor.

### ¿Qué dirección debo dar a la gente para que se conecten a mi servidor?

Tiene que ser tu dirección IP **pública** (encuéntrala con [Google](https://www.google.com/search?q=whatsmyip)). Conecta tu **propio** cliente Jamulus a la dirección IP **local** de tu servidor (127.0.0.1 si está en la misma máquina que tu cliente). Ten en cuenta que tu dirección IP pública puede cambiar - ver la nota sobre "DNS dinámica" en [esta guía](Running-a-Private-Server).

### ¿Qué números de puerto puedo utilizar?

Utiliza los puertos UDP predeterminados. El puerto predeterminado en concreto está documentado por la [línea de comandos](Command-Line-Options). En el momento de escribir esta documentación el número del puerto es **22124**.

### Un servidor privado ¿es un servidor directo, sin contacto con el Servidor Central de Jamulus?

Sí. Lee sobre [Tipos de Servidor](Choosing-a-Server-Type)

### ¿Puedo convertir mi servidor privado en uno público?

Sí. Simplemente activa la casilla de "Mi Servidor es Público" en la ventana del servidor y rellena los datos. Recuerda que tampoco tienes por qué validar puertos si tu servidor es público.

### **_Linux Headless_**: He creado un servidor pero se está registrando con el Servidor Central y no quiero que lo haga.

Para habilitar un servidor privado, no utilices la opción `--centralserver` (`-e`) cuando arranques tu servidor desde la línea de comandos.

### Nadie se puede conectar a mi servidor - pero yo me puedo conectar localmente

Algunos operadores de internet utilizan técnicas como [Address plus Port (A+P)](https://en.wikipedia.org/wiki/Address_plus_Port) o [Carrier-grade NAT (CGN)](https://en.wikipedia.org/wiki/Carrier-grade_NAT) para preservar espacios de direcciones. Esto hace que sea imposible ejecutar servicios como Jamulus en casa (y puede ocasionar que no veas listas de servidores en tu cliente o que te falten [algunos servidores específicos](https://sourceforge.net/p/llcon/discussion/server/thread/f72b293af0/)).

Para detectar si el problema está causado por CGN, ve a la pantalla de configuración de tu router (192.168.X.X) y consulta la página de WAN Status. Si tu dirección listada de IPv4 no concuerda con la dirección que ves [aquí](https://ifconfig.me), entonces puede que este CGN esté activado. O si experimentas problemas como no poder [conectarte a servidores o una lista de servidores vacía](https://sourceforge.net/p/llcon/discussion/533517/thread/b3eea395c4/) esto también puede indicar que el problema reside en tu operador de internet.

Para arreglar el problema: si estás ejecutando un servidor público, prueba la [validación de puertos](Running-a-Private-Server#validación-de-puertos). Si estás ejecutando un servidor privado y ya has validado puertos, contacta con el soporte de tu operador y pide que te eliminen del CGN y te asignen una dirección WAN IP real porque quieres operar un servidor. Si el problema no es CGN, quizá tengas que pedir a tu operador que te asigne una dirección WAN IP (o una fija para evitar el uso de DDNS, si es posible). Si nada de esto funciona, considera utilizar una plataforma en la nube (algunos proveedores ofrecen periodos gratuitos de prueba).
