---
lang: es
layout: wiki
permalink: /wiki/Installation-for-Windows
title: 'Instalación en Windows'
---

{% include breadcrumb.html root="Utilización de Jamulus" branch1="Cómo Empezar" branch1-url="Getting-Started" %}

# Instalación en Windows

Asegúrate de haber leído la página de [Cómo Empezar](Getting-Started).
1. **Descarga e instala un driver ASIO**. Se recomienda usar una tarjeta de audio con driver ASIO nativo. Si no tienes una tarjeta de audio externa, probablemente tendrás que instalar un driver genérico como ASIO4ALL. Para más información, baja a la sección sobre [ASIO](#asio).
1. [Descarga Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
 **Mirror 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Instala Jamulus**: Haz doble-clic en el instalador para ejecutarlo. Si ves un aviso de SmartScreen, haz clic en "Más info" y "Ejecutar de todas formas" para instalar Jamulus. (Si descargaste una versión nueva de Jamulus y eres de las primeras personas en descargarlo, Jamulus no entrará en la lista blanca de SmartScreen aún. No pagamos para la firma de código).
1. **Ejecuta Jamulus**. Ahora deberías de poder usar Jamulus como cualquier otra aplicación.
1. **Set up your sound card**. When you're done, you need to set up your audio hardware. Have a look at how to set up ASIO4ALL below, if you're using that.

***

## ASIO

Jamulus utiliza [ASIO](https://en.wikipedia.org/wiki/Audio_Stream_Input/Output) para proporcionar la menor latencia.
* Si tienes una tarjeta de sonido/interfaz de audio externa, utiliza su driver ASIO oficial (normalmente ofrecen la mejor calidad).
* Si no tienes una tarjeta externa, probablemente no tendrás instalado un driver ASIO. Por tanto, deberás instalar uno genérico como ASIO4ALL:

Puedes probar dos versiones de ASIO4ALL. ASIO4ALL v2.14 incluye una actualización para un bug que puede hacer fallar otras funcionalidades.

[ASIO4ALL v2.15 Beta 2 Descarga](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta2_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Descarga](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[Web ASIO4ALL](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### Configurar ASIO4ALL

*No se recomienda ASIO4ALL si tu tarjeta de sonido/interfaz de audio tiene su propio driver ASIO, puesto que este último podría proporcionar mejor latencia.*

For ASIO4ALL, you may or may not need to experiment a bit depending on your sound hardware. If everything works out of the box, you don't need to do anything.

**Tip:** Set up your sound card while you're [connected to a server](Getting-Started#connecting-to-a-server-and-testing-your-sound) to hear your instrument or voice and check if everything is correctly set up; but first read on.


Antes de empezar con Jamulus:
1. **Close all applications** (especially those which could access your sound card like your browser/media player). ASIO4ALL needs exclusive access to your sound card which means that other programs will not be able to use audio if ASIO4ALL and Jamulus are running.
1. Si el audio de Jamulus no funciona directamente, asegúrate de que solo **las entradas/salidas correctas** en ASIO4ALL **están activadas**. Todo lo demás debería estar apagado. Busca [configuraciones funcionales de ASIO4ALL en la lista comunitaria](/kb/2021/03/20/ASIO4ALL-Examples.html) para tu configuración o hazlo manualmente si no encuentras la tuya:

### Cómo configurar las entradas de ASIO4ALL (Guía)

1. Abre la ventana de Configuración de Jamulus
1. Ve a _"Configuración Driver"_ (la columna a la izquierda; directamente debajo de la selección de driver)
1. Activa _advanced view_ en ASIO4ALL (haz clic en el icono de la herramienta abajo a la derecha)
1. Activa solamente la tarjeta de audio que quieres utilizar haciendo clic en el botón al lado de su nombre
1. Abre las entradas/salidas de tu tarjeta de audio haciendo clic en el _icono de plus_ al lado de esta tarjeta
1. Ahora activa/desactiva las entradas/salidas correctas en la lista bajo tu tarjeta de audio y desactiva todo lo demás. Puedes mover el ratón sobre las entradas/salidas para ver qué es cada una y si soportan la tasa de muestreo de Jamulus que es de 48 kHz (calidad DVD).

**Consejos:**
1. Muchas tarjetas internas se denominan Realtek High Definition Audio, Conexant o similar.
1. A menudo los auriculares y los altavoces están etiquetados como 'output' y los micrófonos como 'input' o 'capture'.
1. Stereo Mix/Stereo Input is usually not the input/output you're looking for. Therefore, switch it off if you see it.

### ¿Tienes problemas con la configuración de ASIO4ALL?

Si nada funciona, primero prueba a reiniciar Jamulus y/o tu PC para cerrar procesos que puedan estar accediendo a tu tarjeta de sonido.

Después, *configura de nuevo las entradas/salidas*. Las entradas/salidas activadas y accesibles muestran un botón on/off iluminado y un botón de play. Si en su lugar ves una cruz roja o un símbolo amarillo, cierra otras aplicaciones que puedan estar accediendo a tu tarjeta de sonido (por ej. navegador, Zoom, etc.).

Mírate [este vídeo](https://youtu.be/_GzOsitVgLI) de [trombonepizza](https://github.com/trombonepizza) que ofrece más información detallada sobre la configuración de ASIO4ALL.

Official and further information about how to configure ASIO4ALL is documented in the official [ASIO4ALL FAQs on the ASIO4ALL website](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"}.

## ¿Todo instalado?

Jamulus ha sido instalado y puede utilizarse. Ahora puedes echar un vistazo a la

[página de configuración de Jamulus](Getting-Started){: .button}
