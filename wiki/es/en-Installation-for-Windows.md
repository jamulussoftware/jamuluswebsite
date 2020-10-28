---
layout: wiki
title: "Instalación en Windows"
lang: "es"
permalink: "/wiki/Installation-for-Windows"
---

# Installation for Windows
Asegúrate de leer la página de [Cómo Empezar](Getting-Started) page.
1. **Descarga e instala un driver ASIO**. Se recomienda usar una tarjeta de audio con driver ASIO nativo. Si no tienes (sobre todo las tarjetas internas), instala [este driver ASIO gratuito (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} antes de instalar Jamulus.
1. **Descarga e instala Jamulus** desde la [página del proyecto Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Si te aparece una notificación de aviso, haz clic en "Más info" y "Ejecutar de todas formas" para instalar Jamulus.
1. **Configura tu tarjeta de sonido**. Una vez hecho, tienes que configurar tu hardware de audio. Mira cómo configurar ASIO4All si es lo que vas a utilizar (consulta abajo), y luego la [Configuración de Hardware](Hardware-Setup).

También puedes [compilar tu propio archivo binario](Compiling) si así lo deseas.

***

## Configurar ASIO4All
*ASIO4All no se recomienda si tu interfaz de audio tiene su propio driver ASIO, puesto que este último podría proporcionar mejor latencia.*

Primero **cierra todas las aplicaciones** (sobre todo aquellos que podrían acceder a tu tarjeta de sonido) para minimizar conflictos. Si el audio no funciona directamente, asegúrate de que solo **están activadas** las **entradas/salidas correctas** en su panel de control.
Puede que tengas que experimentar un poco para encontrar las correctas porque cada ordenador es diferente. Haz esto estando conectado a un servidor para escuchar tu voz o instrumento y comprueba que todo está bien configurado.

### Cómo configurar las entradas de ASIO4All (Guía)

1. Abre la ventana de Configuración de Jamulus
1. Ve a _"ASIO Settings"_
1. Activa _advanced view_ en ASIO4All (haz clic en el icono de la herramienta abajo a la derecha)
1. Abre las entradas de tu tarjeta de audio haciendo clic en el _icono de plus_ al lado del nombre de la tarjeta.
1. Ahora activa/desactiva las entradas/salidas correctas

Muchas tarjetas internas se denominan Realtek High Definition Audio, Conexant o similar.
A menudo los auriculares y los altavoces están etiquetados como 'output' y los micrófonos como 'input'.

### ¿Tienes problemas con la configuración de ASIO4All?

Aunque ASIO4All puede funcionar sin hacer nada, también es posible que tengas problemas con su configuración.

Si nada funciona, primero prueba a**reiniciar Jamulus y/o tu PC**.
Después trata de **configurar de nuevo las entradas/salidas**. Las entradas/salidas activadas y accesibles muestran un botón on/off iluminado y un botón de play. Si ves una cruz roja o un símbolo amarillo, quizá tengas que cerrar otras aplicaciones como tu navegador, Zoom, ...

Mírate [este vídeo](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} de @trombonepizza que ofrece más información detallada sobre la configuración de ASIO4All.

Información oficial y más detallada sobre cómo configurar ASIO4All se encuentra en la sección [ASIO4All FAQs en la página web de ASIO4All](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} y en el manual de ASIO4All. Normalmente se encuentra en tu escritorio o en la carpeta donde se instala el archivo binario de ASIO4All (normalmente `C:\Program Files (x86)\ASIO4ALL v2\`).

## ¿Todo instalado?
Jamulus ha sido instalado y ahora puede utilizarse. Si no has configurado tu equipo de audio, consulta la [Hardware Setup](Hardware-Setup).

Para información detallada sobre la utilización de Jamulus, por favor consulta el [Manual de Ayuda](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).
