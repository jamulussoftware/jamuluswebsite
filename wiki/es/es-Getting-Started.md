---
layout: wiki
title: "Cómo Empezar"
lang: "es"
permalink: "/wiki/Getting-Started"
---

# Cómo Empezar con Jamulus

## Necesitarás

1. **Un ordenador** con **Windows 10**, **macOS** (**MacOS X** El Capitan v10.11 o superior), o **Linux**.
1. **Una conexión a internet por cable** (no utilices Wi-Fi, ocasionará problemas de sonido). La mayoría de las conexiones de banda ancha funcionarán bien[^1].
1. **Auriculares por cable - no altavoces** para evitar eco o retroalimentación y minimizar el retardo[^2].

## Maximiza calidad, minimiza retardo

### 1. Minimiza el tráfico de internet y cierra todos los programas en tu PC

Intenta asegurarte de que no haya nada en tu ordenador o en tu red (como vídeo en streaming) compitiendo con Jamulus cuando lo estés utilizando.

### 2. Utiliza un interfaz de audio/micrófono externo, no el dispositivo interno de sonido

Recomendamos encarecidamente ‒ aunque puedes empezar sin él ‒ que utilices un interfaz de audio (un dispositivo al que conectas tu micrófono/instrumento y que se conecta a tu PC mediante, por ejemplo, USB) para disfrutar una mejor calidad de sonido con menor latencia en Jamulus. También puedes utilizar un micrófono USB. Ver [hardware recomendado](#hardware-recomendado).

### 3. Conéctate a los servidores con el ping más bajo

Los servidores de la lista con 15 ms o menos te darán la mejor posibilidad de diversión (aunque hay otras cosas que también afectan al rendimiento). Valores por encima de eso darán resultados más dudosos.

Ahora que tienes lo básico, vayamos allá:

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Instalación en Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Instalación en macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Para usuarios de Linux</a>
</div>

También - [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Ejecuta Jamulus en cualquier ordenador utilizando un pendrive (solo sistemas de 64-bits). ¡Comprueba tu hardware y lo configura todo sin tener que hacer nada!

## Hardware recomendado

Ver [la lista de hardware comprobado](Sound-Devices) y [Configuración de Hardware](Hardware-Setup).

## Otras guías
* [Esta excelente guía](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} de [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) también merece un vistazo.

## ¿Tienes problemas? ¿No puedes mantener el tiempo?

**¡SOLO.ESCUCHA.LA.SEÑAL.DEL.SERVIDOR!**

O dicho de otra manera, **no** escuches tu señal directa.

Obviamente esto es difícil para cantantes y a la hora de tocar algunos instrumentos acústicos, pero aunque tu conexión sea buena, si no escuchas tu **propia señal que vuelve del servidor**, tu sincronización **sufrirá**. _(Para que quede claro: esto no tiene nada que ver con los controles de "mute" en Jamulus.)_

Se puede encontrar más información sobre cómo evitar escucharte a ti mismo (y ayuda con otros problemas) en la [sección de FAQ sobre la Resolución de Problemas](Client-Troubleshooting) (_aún en construcción_)

## Cómo funciona Jamulus (en general)

**Así es cómo millones de personas utilizan Jamulus para tocar, cantar y enseñar música con otras personas en tiempo real, por todo el mundo:**

![Overview](https://user-images.githubusercontent.com/4263412/97573060-78d17780-19e9-11eb-94dd-7fd991650e37.png)
_Jamulus funciona bajo el principio del cliente/servidor. El audio de todos se envía a un servidor, se mezcla y se procesa allí. Después, el audio es enviado a cada cliente. Si un servidor es público y está registrado en un servidor central, su información será emitida a todos los clientes._

## Notas
[^1]: [Detalles al completo aquí](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. Si tienes 10Mbits de bajada y 1Mbps de subida, es poco probable que tengas problemas de ancho de banda.
[^2]: Los auriculares Bluetooth normalmente tienen demasiada latencia. Esa es una razón por la que se necesitan auriculares por cable. Sobre todo si cantas o tocas instrumentos acústicos, para asegurarte de que mantienes el tiempo con los demás, utiliza solo auriculares (ver la [nota sobre esto](Getting-Started#tienes-problemas-no-puedes-mantener-el-tiempo) para más información).
