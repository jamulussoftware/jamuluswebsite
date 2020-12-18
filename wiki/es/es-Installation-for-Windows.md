---
layout: wiki
title: "Instalación en Windows"
lang: "es"
permalink: "/wiki/Installation-for-Windows"
---

# Instalación en Windows
Asegúrate de leer la página de [Cómo Empezar](Getting-Started).
1. **Descarga e instala un driver ASIO**. Se recomienda usar una tarjeta de audio con driver ASIO nativo. Si no tienes (sobre todo las tarjetas internas), instala [este driver ASIO gratuito (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} antes de instalar Jamulus.
1. [Descarga e instala Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer"}. Si te aparece una notificación de aviso de SmartScreen, haz clic en "Más info" y "Ejecutar de todas formas" para instalar Jamulus. Esto es necesario ya que aún no pagamos para la firma de código.
1. **Ejecuta Jamulus**. Ahora deberías de poder utilizar Jamulus igual que cualquier otra aplicación.
1. **Configura tu tarjeta de sonido**. Una vez hecho, tienes que configurar tu hardware de audio. Mira cómo configurar ASIO4All si es lo que vas a utilizar ([consulta abajo](#configurar-asio4all)), y luego la [Configuración de Hardware](Hardware-Setup).

También puedes [compilar tu propio archivo binario](Compiling) si así lo deseas.

***

## Configurar ASIO4All
*La mayoría de las tarjetas de audio internas requieren este driver. ASIO4All no se recomienda si tu interfaz de audio tiene su propio driver ASIO, puesto que este último podría proporcionar mejor latencia.*

Para ASIO4ALL, quizá necesites experimentar un poco para encontrar la configuración adecuada ya que cada ordenador es un poco diferente. Configura tu tarjeta mientras estés en conexión con un servidor para escuchar tu instrumento o tu voz y comprobar que todo está bien configurado.

Antes de empezar con Jamulus:
1. **Cierra todas las aplicaciones** (sobre todo aquellas que podrían acceder a tu tarjeta de sonido como tu navegador/reproductor de audio) ya que Jamulus necesita acceso exclusivo a tu tarjeta de audio. 
1. Si el audio no funciona directamente, asegúrate de que solo **están activadas** las **entradas/salidas correctas** en ASIO4ALL. Todo lo demás debería estar apagado. Esto se puede hacer como sigue:

### Cómo configurar las entradas de ASIO4All (Guía)

1. Abre la ventana de Configuración de Jamulus
1. Ve a _"ASIO Settings"_
1. Activa _advanced view_ en ASIO4All (haz clic en el icono de la herramienta abajo a la derecha)
1. Activa solamente la tarjeta de audio que quieres utilizar haciendo clic en el botón al lado de su nombre
1. Abre las entradas de tu tarjeta de audio haciendo clic en el _icono de plus_ al lado de esta tarjeta.
1. Ahora activa/desactiva las entradas/salidas correctas en la lista bajo tu tarjeta de audio y desactiva todo lo demás

**Consejo:** Muchas tarjetas internas se denominan Realtek High Definition Audio, Conexant o similar. En cuanto a las entradas/salidas: a menudo los auriculares y los altavoces están etiquetados como 'output' y los micrófonos como 'input' o 'capture'. 'Stereo Mix' normalmente no es la entrada/salida que buscas, por tanto puedes desactivarlo si lo ves.

### ¿Tienes problemas con la configuración de ASIO4All?

Si nada funciona, primero prueba a**reiniciar Jamulus y/o tu PC**.
Después trata de **configurar de nuevo las entradas/salidas**. Las entradas/salidas activadas y accesibles muestran un botón on/off iluminado y un botón de play. Si ves una cruz roja o un símbolo amarillo, quizá tengas que cerrar otras aplicaciones como tu navegador, Zoom, ...

Mírate [este vídeo](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} de @trombonepizza que ofrece más información detallada sobre la configuración de ASIO4All.

Información oficial y más detallada sobre cómo configurar ASIO4All se encuentra en la sección [ASIO4All FAQs en la página web de ASIO4All](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} y en el manual de ASIO4All. Normalmente se encuentra en tu escritorio o en la carpeta donde se instala el archivo binario de ASIO4All (normalmente `C:\Archivos de Programa (x86)\ASIO4ALL v2\`).

## ¿Todo instalado?

Jamulus ha sido instalado y ahora puede utilizarse. Puedes echar un vistazo a la

[página de Iniciación a Jamulus](Onboarding){: .button}
