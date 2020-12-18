---
layout: wiki
title: "Running a Private Server"
lang: "es"
permalink: "/wiki/Running-a-Private-Server"
---

# Ejecutar un Servidor Privado

**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**

Esta guía presupone que vas a ejecutar un servidor privado en tu red doméstica, pero algunos de los problemas de aquí también podrían ser aplicables a aquellos ejecutándolo en hosts en la nube (por ej. Amazon EC2).

Se recomienda que pruebes a ejecutar tu servidor en **modo público primero** para así acotar cualquier problema posterior en modo privado.

## Operar un servidor privado tras un router doméstico
### Validación de puertos
Para operar un servidor privado, necesitas habilitar el redireccionamiento de puertos en tu router. _(Si tienes curiosidad sobre por qué hay que hacer esto para los servidores privados pero no para los públicos, consulta [esta nota](#nota-para-frikis).)_

Normalmente, las personas de fuera de tu red doméstica no pueden ver lo que sucede dentro de ella. Por tanto, si quieres operar un servidor Jamulus en casa, tienes que abrir una puerta en tu router para dejar que clientes de Jamulus puedan conectarse a él.

**El puerto por defecto para la versión actual de Jamulus es el puerto UDP (no TCP) 22124.**

La configuración exacta del redireccionamiento de puertos difiere para cada router. Aquí hay un ejemplo de esta configuración en un router Linksys:

![Linksysportforwarding](https://user-images.githubusercontent.com/4561747/97542495-bc62bc00-19be-11eb-8e54-b6e906e676f6.jpg)

Para más ayuda ver [portforward.com](https://portforward.com).

Una vez configurado el router, puedes obtener tu dirección IP (WAN) externa por ejemplo [usando Google](https://www.google.com/search?q=what+is+my+ip). Dales esta dirección a tus amigos/as para que puedan conectarse a tu servidor (_pero también lee la nota sobre DNS dinámica abajo_). Tú tienes que conectarte a tu propio ordenador, puesto que tu ordenador es el que ejecuta el servidor. Por tanto, **solo tú** tienes que conectarte a `127.0.0.1`.

### Puntos a tener en cuenta

* No necesitas abrir un rango de puertos como muestra el ejemplo de arriba si solo vas a abrir una instancia del servidor Jamulus en tu ordenador.

* Si utilizas un puerto distinto al que se usa por defecto (22124) tienes que escribir el número del puerto detrás del nombre del servidor o la dirección IP, separado por dos puntos, en el cliente de Jamulus (por ej.: jamulus.dyndns.org:22120).

* Ver también esta excelente [guía sobre la operación de un servidor privado](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) de [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) en Facebook (inglés).

## DNS dinámica y por qué es probable que lo necesites

La mayoría de las conexiones domésticas a internet cambian su dirección IP tras un periodo de tiempo (horas, días o semanas). Por tanto, para facilitar que las personas se puedan conectar a ti, probablemente quieras establecer una dirección DNS dinámica. Puedes hacer esto en [el ordenador](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) en el cual ejecutas el servidor Jamulus, o preferiblemente en tu router [si es compatible](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Nótese también que tu router doméstico puede cambiar la dirección IP del ordenador en el que ejecutas tu servidor. En este caso, tienes que darle a ese ordenador una IP estática en la configuración DHCP del router, o simplemente abre los puertos a todas las direcciones en tu red local.

## Nota para frikis

Una de las muchas características de Jamulus que lo hacen orgásmicamente maravilloso es que puedes montar un servidor en segundos. ¿Pero los servidores públicos por qué no necesitan la validación de puertos?

Normalmente, los cortafuegos NAT impiden las peticiones externas desde fuera de la red local. El tráfico entrante solo es posible para paquetes _relacionados con una petición saliente_ (estrictamente hablando, paquetes de "relación" y "establecimiento" con una conexión inicial saliente). En modo público, cuando un servidor Jamulus se conecta a un Servidor Central, inicia una conexión saliente. De ahí en adelante, el Servidor Central envía "pings" de conexión (establecimiento/relación; no pings ICMP) a ese servidor a intervalos regulares para mantener abierto(s) el/los puerto(s) relevantes en el router/cortafuegos.

Sin embargo, en modo privado los clientes tienen que _iniciar_ conexiones a la red del servidor. Los cortafuegos NAT impiden esto, por lo que tienes que decirles que permitan peticiones de conexión entrantes en el puerto que Jamulus utiliza, mediante el redireccionamiento de puertos.



