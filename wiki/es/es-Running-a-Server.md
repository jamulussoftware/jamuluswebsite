---
layout: wiki
title: "Ejecutar un Servidor"
lang: "es"
permalink: "/wiki/Running-a-Server"
---

# Ejecutar un Servidor

## ¿Necesito ejecutar un servidor para utilizar Jamulus?

NO.
{: .doubletextsize .red }


Puedes simplemente escoger otro servidor de la lista y utilizarlo.

**¿No quieres interrupciones de extraños?** Una vez que tú y tus compañeros/as se hayan conectado a un servidor público, pulsa el botón de "solo" de cada músico con quien quieres tocar. Aquellos para quienes no actives este botón verán un icono de "silenciado" en tu canal. Y no les escucharás.

## Eso suena demasiado fácil.

Si realmente quieres operar un servidor, es **muy importante** que leas y entiendas qué tipo de servidor quieres operar.

<div class="fx-row fx-row-start-xs button-container">
  <a href="Choosing-a-Server-Type" class="button fx-col-100-xs" target="_blank" rel="noopener noreferrer">Lee sobre otros tipos de servidor</a>
</div>

... y luego vuelve aquí.

### Velocidad y latencia

**_La capacidad del servidor en sí (y de la red en la que opera) NO es el factor más determinante para la calidad de una sesión con Jamulus_**

Mucha gente atribuye problemas al servidor que en realidad son problemas con el _cliente_. Mucho depende del [hardware](Hardware-Setup) del cliente, las redes en las que _operan_, y su adherencia a la [Regla Número Uno](Getting-Started#tienes-problemas-no-puedes-mantener-el-tiempo). Por tanto, no hay ninguna garantía de que conseguirás una latencia más baja o un rendimiento superior ejecutando tu propio servidor.

Si tienes intención de tocar regularmente con las mismas personas, **se recomienda encarecidamente** que primero os aseguréis de que cada miembro del grupo tiene la configuración adecuada para utilizar Jamulus. Haz esto buscando un servidor público con un tiempo de ping razonablemente bajo para todos (20 ms o menos quizá), os conectáis todos allí y trabajáis para solucionar cualquier problema individual (verificando que pueden seguir la [Regla Número Uno](Getting-Started#tienes-problemas-no-puedes-mantener-el-tiempo) en particular). Utiliza la técnica descrita arriba de usar el botón de "solo" para impedir interrupciones si es necesario.

Una vez se haya solucionado cualquier problema que puedan tener los músicos, ahora puedes investigar sobre cómo ejecutar tu propio servidor en casa o en un host en la nube como Amazon, que puede resultar en una major latencia que con servidores ejecutados en casa. Por ejemplo, [ver esta guía](https://www.facebook.com/notes/jamulus-worldjam/howto-idiots-guide-to-installing-or-upgrading-a-jamulus-server-on-amazon-aws-lig/818091045662521/) para utilizar AWS Lightsail por parte del usuario de Jamulus [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) (_Facebook_)

### Ancho de banda - ¿tienes suficiente?

En una jam típica puede haber 4 personas, para lo que necesitarías 200 Kbit/s * 4 = 800 Kbit/s (0,8 Mbit/s) de subida y bajada. Así que si tienes 10 Mbit/s de bajada y 1 Mbit/s de subida de banda ancha, **puede ser que te empiece a escasear el ancho de banda si se une una quinta persona**, sobre todo si otros músicos eligen configuraciones que aumentan su uso. Quizá quieras [comprobar que tienes velocidad suficiente](https://fast.com) para ello. [Lee más sobre el uso de ancho de banda](Network-Requirements) con diferentes configuraciones de calidad.

### En general

- Considera el uso de un host en la nube para conseguir mejores tiempos de ping si tienes problemas

- Cualquier servidor debería de tener una frecuencia de procesador de 1,6 GHz y 1 GB de RAM

- Ejecutar un servidor puede requerir que configures cortafuegos operando en tu ordenador o host en la nube, o externos.

- Ejecutar un **servidor privado en casa** (pero no uno público) requerirá que [redirecciones puertos](Running-a-Private-Server) en tu router.

- Actualmente Jamulus no da soporte para IPv6


## ¿Todo bien? ¡A configurar!
<div class="fx-row fx-row-start-xs button-container">
    <a href="Server-Win-Mac" class="button fx-col-100-xs">Para usuarios de Windows o macOS</a>
    <a href="Server-Linux" class="button fx-col-100-xs">Para usuarios de Linux</a>
</div>

Si quieres ejecutar un servidor en un Raspberry Pi, echa un vistazo a la [guía para Raspberry Pi](/kb/2020/03/28/Server-Rpi.html) de fredsiva.

Los operadores de servidores también pueden descargarse [este conjunto de herramientas útiles](https://github.com/jamulussoftware/jamulus/tree/master/tools) del repositorio de Jamulus (clona el repositorio de Git y ejecuta `git submodule update --init`).

## ¿Experimentando problemas?

Consulta el [FAQ de Resolución de Problemas con el Servidor](Server-Troubleshooting)
