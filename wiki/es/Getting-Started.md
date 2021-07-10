---
lang: es
layout: wiki
permalink: /wiki/Getting-Started
title: Configuración
---

# Configuración - cómo empezar con Jamulus

Para obtener el mejor resultado con Jamulus, como mínimo necesitarás:

1. **Una conexión a internet por cable** (no utilices Wi-Fi - ver las [FAQ](/wiki/FAQ#por-qué-no-debería-utilizar-dispositivos-inalámbricos)).
1. **Auriculares por cable** (no de Bluetooth o altavoces - ver las [FAQ](/wiki/FAQ#por-qué-no-debería-utilizar-dispositivos-inalámbricos))
1. **Un dispositivo de audio, tarjeta de sonido y/o micrófono decente** ([consulta esta lista](/kb/2021/01/05/Jamulus-Sound-Devices.html) para ver ejemplos)

Si tienes alguna duda, por favor consulta las [Discussions](https://github.com/jamulussoftware/jamulus/discussions)

## Instalación

To get Jamulus working with your operating system, please follow the installation guide for your platform:

<div class="fx-row fx-row-start-xs button-container">
    <a href="Installation-for-Windows" class="button fx-col-100-xs">Windows</a>
    <a href="Installation-for-Macintosh" class="button fx-col-100-xs">macOS</a>
    <a href= "Installation-for-Linux" class="button fx-col-100-xs">Linux</a>
</div>

Y por ahora, cierra todas las demás aplicaciones. Es mejor empezar con lo simple primero.

## Hardware Setup

If you use external audio hardware, plug that in before you start Jamulus. If you haven't configured your hardware, please see the installation guides mentioned above.

## Ventana principal de Jamulus

Cuando abras Jamulus, verás una ventana con este aspecto:

<figure>
  <img src="{{site.url}}/assets/img/es-screenshots/main-screen-default.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>La ventana principal antes de conectarte a un servidor</figcaption>
</figure>


## Configurar un perfil

Primero muestra a los demás quién eres. Haz clic en “Ver” (barra superior) > “Mi Perfil…” Ahora verás esto:

<figure>
  <img src="{{site.url}}/assets/img/es-screenshots/settings-profile.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Muestra quién eres</figcaption>
</figure>


Rellena al menos “Alias/Nombre” y cierra la ventana.

## Conectarse a un servidor y comprobar tu sonido

Antes de conectarte a un servidor **no** deberías de poder escucharte. Escuchar tu sonido desde Jamulus (y no tu audio directo) se denomina “La Regla de Oro” y te permite tocar en sincronización con otras personas ([ver las FAQ](/wiki/FAQ#por-qué-no-debería-escuchar-mi-propia-señal)).

**Antes de tocar con otros, recomendamos que te conectes a un servidor vacío para probar tu configuración**, y asegurarte de que escuchas la señal que vuelve del servidor (si es posible) y no tu audio directo.

Ahora usa el botón de “Conectar” en la ventana principal de Jamulus para unirte a un servidor. Se abrirá una ventana:

<figure>
  <img src="{{site.url}}/assets/img/es-screenshots/connection-setup-window.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Conéctate a un servidor</figcaption>
</figure>

The most important thing about servers is their “ping time”. The bigger the number, the harder it will be to play in time with others. Usually, you would select a server with a ping of less than 50ms if you can.

Once connected to a server, make sure you can hear yourself OK and fix any input volume or other problems. You can have a look at the [troubleshooting page](/wiki/Client-Troubleshooting) for common problems. And of course, check that you are also able to obey [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

## Tocar por primera vez

Con el sonido configurado, ya puedes empezar. Cuando te conectas a un servidor (quizá quieras seleccionar un género de la lista), los faders que ves a la derecha son tu mezcla personal. Todo lo que cambies aquí cambiará lo que escuchas, pero no afectará a nadie más. Si bajas un fader, ese canal bajará de volumen, y si lo subes, el volumen de ese canal aumentará - para tí.

<figure>
  <img src="{{site.url}}/assets/img/es-screenshots/main-screen-medium.png" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>La ventana principal cuando te conectas a un servidor</figcaption>
</figure>

Si no quieres que otros escuchen tu audio, haz clic en el botón de “Silenciarme Yo”, que impedirá que tu audio sea enviado a otras personas. No podrán saber que lo has hecho. Pero si ves un icono de "silenciado" sobre un fader, significa que esa persona no te escucha porque ha silenciado tu canal en su mezcla.

Ten en cuenta que puedes utilizar el Chat en cualquier momento para mensajear a otras personas mientras estés en conexión. El mensaje de bienvenida en el chat puede también establecer alguna directriz de utilización.

Se puede encontrar más información sobre el uso de Jamulus en el [Manual de Software](/wiki/Software-Manual).

## Resolución de Problemas

¿Tienes problemas con el audio? ¿No ves los servidores, o algún otro problema? Echa un vistazo a la [Página de resolución de problemas](/wiki/Client-Troubleshooting), o pregunta sin problemas en [Discussions](https://github.com/jamulussoftware/jamulus/discussions).
