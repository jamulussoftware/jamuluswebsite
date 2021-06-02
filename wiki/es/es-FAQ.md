---
lang: es
layout: wiki
permalink: /wiki/FAQ
title: FAQ
---

Jamulus FAQ

Esto es un resumen de dudas comunes. Para problemas comunes y sus soluciones, ver la página de [Resolución de problemas](/wiki/Client-Troubleshooting).


### ¿Hay un metrónomo, sincronización o alguna otra manera de mantener el tiempo?

No. Los usuarios de un servidor Jamulus simplemente tocan juntos en tiempo real como si estuvieran en persona. Si quieres una señal de tiempo, entonces hay soluciones de metrónomos compartidos en Internet que puedes probar, pero probablemente sea mejor minimizar la latencia para que nadie tenga un retardo total de más de unos 30-50 ms.

### ¿Cómo sé si puedo unirme a un servidor? ¿Hay normas?

En general, si alguien monta un servidor público, entonces [por definición](/wiki/Choosing-a-Server-Type) aceptan que cualquiera puede utilizarlo. Jamulus no tiene protección con contraseña ni otros mecanismos de autenticación. SIn embargo, algunos servidores pueden establecer políticas en el mensaje de bienvenida que verá en la ventana del chat.

También puedes montar un servidor privado en Jamulus y dar tu dirección a otras personas para que se conecten. Echa un vistazo a [esta página para más información](/wiki/Running-a-Server).

### ¿Por qué no debería utilizar dispositivos inalámbricos?

El que puedas o no tocar manteniendo el tiempo con otras personas depende principalmente de cuánta latencia (retardo) tienes en tu señal de audio. En general, un retardo total mayor de 50 ms hace que sea difícil tocar en sincronización a menos que entrenes para hacerlo. Algunos músicos dicen que pueden tocar sincronizados con retardos de hasta 70 ms, tocando por delante del ritmo. Pero mucho más que eso se vuelve demasiado difícil, a menos que la sincronización no sea un factor importante para la música.

Por tanto tiene sentido minimizar cualquier fuente de retardo u otros problemas con la señal. Inluso la Wi-Fi rápida suele ser demasiado variable para usarla durante periodos largos con Jamulus, y los auriculares y micrófonos Bluetooth suelen introducir latencias de hasta 50 ms o más.

### ¿Por qué no debería escuchar mi propia señal?

Por la misma razón por la que necesitas minimizar el retardo de tu señal para tocar en sincronización, tienes que asegurarte de que tocas escuchando el audio que oyen los demás. Para más información sobre esto, y modos de probar tu configuración para asegurarte de que obedeces la “Regla de Oro” [ver aquí](/wiki/Client-Troubleshooting#todos-suenan-bien-pero-es-difícil-tocar-todos-juntos-manteniendo-el-tiempo).

Por supuesto, si tocas un instrumento acústico o cantas, va a ser difícil excluir tu sonido "local". Pero debes al menos intentar hacerlo, por ejemplo utilizando auriculares cerrados con el volumen subido para tapar tu propio sonido. Esto te permitirá concentrarte en la mezcla que vuelve del servidor.

### ¿Necesito una conexión rápida de Internet?

Para la mayoría con banda ancha normal (por ej. 10 Mbit/s de bajada y 1 Mbit/s de subida) no habrá problemas. Para los que ejecutan servidores en casa, dependiendo de cuánta gente se conecta a él, podrías tener problemas si tu ancho de banda de subida es menor de unos 5 Mbit/s. [Más información sobre requisitos de red aquí](/wiki/Network-Requirements).

### ¿Necesito ejecutar un servidor?

No. Si solo tienes intención de conectarte a los servidores de otros, lo único que necesitas es un cliente. [Lee esto si crees que debes ejecutar tu propio servidor](/wiki/Running-a-Server).

¿Cómo funciona Jamulus (en general)?

<img src="{{site.url}}/assets/img/es-screenshots/diagram-overview.png" loading="lazy" alt="Diagrama mostrando cómo funciona Jamulus">


Jamulus funciona bajo el principio del cliente/servidor. El audio de todos se envía a un servidor, donde se procesa. Después, el audio se envía de vuelta a cada cliente. Si un servidor es público y está registrado en un servidor de directorio, su información será emitida a todos los clientes.

### ¿Por qué Jamulus no ofrece soporte para vídeo?

El soporte para vídeo añade mucha complejidad. Puedes utilizar otro software como Jitsi o Zoom si quieres ver a otros mientras tocas (o para tener un "público"), pero el vídeo irá bastante por detrás del audio de Jamulus.
