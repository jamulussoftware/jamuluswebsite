---
layout: wiki
title: "Uso de Múltiples Interfaces"
lang: "es"
permalink: "/wiki/Running-Jamulus-with-Multiple-Audio-Interfaces"
---


# Uso de Múltiples Interfaces de Audio

Es posible ejecutar Jamulus con múltiples interfaces de audio en los tres sistemas operativos. Esto es útil cuando necesitamos sacar el audio de un instrumento a través de una tarjeta de audio externa para una latencia mínima, y usar el micrófono del ordenador para la comunicación.


### Windows

En Windows, la mejor opción para utilizar varias interfaces con Jamulus a la vez es con una combinación de JACK Audio Connection Kit con VoiceMeeter. Se puede conseguir solo con VoiceMeeter, pero en mi caso introduce latencia indeseada y no da soporte al tamaño de buffer de 64 correctamente, produciendo ruido en mis auriculares.

**Requisitos:**
* [JACK para Windows](https://jackaudio.org/downloads/);
* [Voicemeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (cualquier versión sirve).

**Pasos:**
1. [Instala y configura JACK en Windows](https://jackaudio.org/faq/jack_on_windows.html) - Asegúrate de elegir tu mejor interfaz de audio en la configuración y también añade `-r 48000 -p <tamaño de buffer deseado>` para asegurarse de que JACK produce audio en la tasa de muestreo adecuada para Jamulus (48,000Hz). Si el buffer es demasiado bajo para tu hardware, tendrás que cambiarlo a un valor más alto;
2. Instala y abre Voicemeeter;
3. Abre el acceso directo de Jack PortAudio, Jack Control y Jamulus;
4. En Voicemeeter, ve a HARDWARE OUT y en el menú desplegable A1, selecciona JackRouter. En Hardware Input 1 selecciona el micrófono de tu ordenador. Puedes hacer que el micrófono tenga la menor latencia posible yendo a _Menu > System Settings/Options..._ y activando _WDM Input Exclusive Mode_ (si escuchas crujidos al hablar, desactívalo) y cambiando _Engine Mode_ a _Swift_;
5. Asegúrate de que el Hardware Input donde has seleccionado tu micrófono envía sonido a través de A1 activando el botón correspondiente al lado del fader;
6. En Jamulus, en Configuración, selecciona JackRouter como tu Dispositivo de Audio;
7. En Jack Control, si haces clic en el botón de _Conectar_, deberías ver ahora tres dispositivos: portaudio (tu interfaz de audio externo), voicemeeter y Jamulus. Si Jamulus no aparece, intenta conectar y desconectar de cualquier servidor para activarlo;
8. Para probar si funciona, en Jack Control conecta los puertos de salida de portaudio y voicemeeter a los de entrada de Jamulus; luego conecta los puertos de salida de Jamulus a los de entrada de portaudio (se presupone que utilizarás el interfaz de audio externo para escuchar, si no puedes usar voicemeeter para redireccionar el sonido a otro dispositivo, lo cual no está cubierto por esta guía). Conéctate a un servidor en Jamulus y pruébalo hablando al micrófono y tocando el instrumento. Si todo ha ido bien deberías oírte;
9. Para hacer permanentes las conexiones de JACK, en Jack Control, abre el _Patchbay_, añade todas las entradas y salidas disponibles (Añadir... > Seleccionar cada Cliente > Haz clic en Añadir Plug hasta que no quede ninguno) y haz las conexiones que quieras hacer permanentes. Esto normalmente implica conectar tanto las salidas de _system_ y _voicemeeter_ a la entrada de _jamulus_, y la salida de _jamulus_ a la entrada de _system_. Una vez hecho, guarda el esquema de Patchbay y _Actívalo_. Ahora cada vez que arranques Jamulus y te conectes a un servidor, las conexiones en JACK deberían realizarse automáticamente.

**Extra:**

* El micrófono puede ser muteado y su volumen ajustado en VoiceMeeter. Asegúrate de jugar con el gráfico de _VOICE_ también (equalización); resulta que mi voz suena mejor si lo muevo a la mitad de _Lo_;
* Si estás utilizando VoiceMeeter Banana o Potato, puedes aplicar el Gate a tu micrófono (útil para eliminar ruidos indeseados cuando no estás hablando);
* Si configuras tu dispositivo predeterminado de reproducción bajo Windows para ser una de las entradas de VoiceMeeter, puedes dirigir audio de tu ordenador hacia JackRouter (y por tanto hacia Jamulus) activando el botón _A1_ en la entrada relevante bajo _Virtual Inputs_. Esto es útil si quieres reproducir audio a través de Jamulus (backing tracks, youtube, grabaciones, etc...)


### macOS

Los [Dispositivos Agregados](https://support.apple.com/en-us/HT202000) te permiten hacer esto. Solo asegúrate de que tu versión de Jamulus es 3.5.3 o posterior.


### Linux

En Linux, es posible conectar dispositivos adicionales a JACK utilizando alsa_in.

**Requisitos:**

* QJackCtl
* alsa

**Pasos:**
1. Sigue [este tutorial](https://www.penguinproducer.com/Blog/2011/11/using-multiple-devices-with-jack/) para conectar el interfaz deseado a JACK utilizando alsa_in.
2. Jamulus debería conectar el interfaz configurado a JACK automáticamente; se pueden realizar ajustes mediante el botón _Conectar_.
3. Conecta el dispositivo configurado en el paso 1 a la entrada de Jamulus.
4. Utiliza Patchbay tal como se describe en la sección sobre Windows para hacer que las conexiones sean permanentes.

