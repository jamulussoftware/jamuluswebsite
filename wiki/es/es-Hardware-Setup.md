---
layout: wiki
title: "Configuración de Hardware"
lang: "es"
permalink: "/wiki/Hardware-Setup"
---


# Configuración de Hardware

## Información general

**Para que Jamulus se ejecute con estabilidad se recomienda utilizar un PC con un procesador de al menos 1.5GHz.**

**Usuarios de Windows**: Necesitarás instalar un driver ASIO driver. Se recomienda una tarjeta de audio con driver ASIO nativo. Consulta la [página de instalación en Windows](Installation-for-Windows) para más información.

## Ejemplos de Configuración

Normalmente, configurar el hardware se reduce a 4 puntos, aunque cada equipo es diferente.

1. Enchufa el interfaz en un puerto USB de tu ordenador
2. Cierra todos los programas y arranca Jamulus (no olvides escoger las entradas correctas en la configuración de Jamulus)
3. Enchufa tu instrumento/micrófono y tus auriculares
4. Conéctate a un servidor Jamulus y ¡a divertirse!


## Windows: Conexión interfaz de audio - ASIO4All

Este es un ejemplo de instalación de un cliente en Windows con un dispositivo de audio [Behringer U-CONTROL UCA202](https://www.amazon.com/Behringer-U-Phono-UFO202-Audiophile-Interface/dp/B002GHBYZ0){: target="_blank" rel="noopener noreferrer"}.
Las siguientes instrucciones pueden ser similares para otros dispositivos de audio.

_**El modo exacto de conectar tu instrumento variará dependiendo de tu hardware.**_

#### 1. Enchufa el interfaz en un puerto USB de tu ordenador

En el futuro, siempre utiliza el mismo puerto USB para el dispositivo de audio.

**Usuarios de Windows**: Si no lo has hecho ya: descarga e instala [el driver ASIO de audio gratuito (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"}. Algunas personas han tenido éxito utilizando [este driver ASIO nativo](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip){: target="_blank" rel="noopener noreferrer"}  __actualmente no disponible__; no está listado en las páginas de producto de Behringer a fecha de abril del 2020.


#### 2. Arranca Jamulus

Configura Jamulus para utilizar la configuración de audio correcta (ver [esta excelente guía](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) de [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) en Facebook).

Asegúrate de haber apagado el botón de monitoreo en tu Behringer U-CONTROL UCA202 (de lo contrario escucharás tanto el sonido original que envías al servidor Jamulus como el sonido que vuelve del mismo, y podría ocasionar feedback).

#### 3. Enchufa tu instrumento y tus auriculares

Conecta tu instrumento a una entrada del Behringer U-CONTROL UCA202. Enchufa tus auriculares al Behringer U-CONTROL UCA202.

#### 4. Conéctate a un servidor Jamulus.

 ¡Ya está! ¡Diviértete!


## Linux: Conexión de interfaz de audio con QJackCtrl

Consulta la [guía de instalación del cliente](Installation-for-Linux#configura-jack-con-qjackctl) en Linux.

## Linux: Kernels Low Latency para Jamulus
Quizá quieras instalar [Ubuntu Studio](https://ubuntustudio.org/){: target="_blank" rel="noopener noreferrer"}, que añade otra opción en el menú de arranque para un kernel de baja latencia. La clave para una jam session online es la baja latencia entre los servidores y los clientes conectados. Si el sistema Linux arranca con un kernel de baja latencia esto tiene un impacto positivo en tus sesiones de Jamulus.


## Apuntes sobre las entradas

- Si quieres conectar 2 o más fuentes de audio (por ej. voz + sinte + guitarra), es importante tener en cuenta que actualmente Jamulus solo acepta 2 canales de entrada (L/R). Por lo tanto, el hardware utilizado debe proporcionar una salida mezclada a estéreo a Jamulus.
- Generalmente los dispositivos de audio producen una señal mezclada en su salida analógica, pero señales separadas (1 por fuente) en su salida digital (USB/Firewire/Thunderbolt).
- Generalmente las mesas de mezclas solo producen señales mezcladas en su salida analógica.
- Generalmente las mesas de mezclas con USB/Firewire/Thunderbolt producen señales mezcladas en su salida **analógica** Y TAMBIÉN señales separadas solo (no una señal mezclada) en su salida **digital**.
- Algunas mesas de mezclas con USB/Firewire/Thunderbolt enviarán **solo** una señal mezclada a la salida **digital** (mesas pequeñas/económicas), o si no también AÑADEN una señal mezclada a las señales separadas de la salida digital.

_(Gracias a [pcar75](https://github.com/pcar75) por esta información)_

## Otros ejemplos

**Este vídeo documenta una [sesión jam en directo](https://youtu.be/c8838jS2g3U).** Utilizo una tarjeta de audio USB Lexicon Omega en un Mac Mini del 2009. Mis compañeros de grupo utilizan todos Windows 10 y tienen tarjetas de audio Behringer, por ejemplo el Behringer Xenyx 1204USB. Mi conexión a internet tiene 10 Mbps de bajada / 1 Mbps de subida mediante conexión DSL.

**El usuario de Jamulus [Andrew Evans](https://sourceforge.net/u/belvario/profile/)**: Con todos los compañeros de grupo en la misma ciudad (pero con 2 ISPs diferentes) y un tiempo ping de 20 ms estables, ejecutando el servidor en un ordenador Windows por separado y el cliente en un Macbook Pro. Los demás músicos con Macbook Air. Todos con conexión Ethernet por cable a sus routers/gateways. Utilizamos WhatsApp video para vernos (con el audio apagado - ¡pero es divertido ver lo atrás que queda el audio de Whatsapp con respecto a Jamulus!)

## ¿Tienes problemas?

Consulta el [FAQ de Resolución de Problemas con el Cliente](Client-Troubleshooting)
