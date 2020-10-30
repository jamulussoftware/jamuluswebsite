---
layout: wiki
title: "Sinte de Software en Jamulus"
lang: "es"
permalink: "/wiki/Software-Synth"
---

# Sinte de Software en Jamulus

## Linux
Desarrollaremos el concepto de tocar un sinte de software en Linux como ejemplo y lo transferiremos a los demás sistemas operativos (por ej. Windows, MacOSX).
* **(Sintetizador de Órgano Hammond)** Como ejemplo vamos a utilizar el sinte de código abierto [setBfree](https://github.com/pantherb/setBfree), que es un emulador de órgano Hammond que tiene salida por JACK en Linux.
* **(Teclado MIDI)** El teclado MIDI se utiliza para generar las notas, que son transmitidas a través de un interfaz USB-MIDI al sistema Linux y el sintetizador [setBfree](https://github.com/pantherb/setBfree) genera el tono correspondiente a la tecla pulsada. En general, el teclado MIDI puede ser reemplazado por un controlador MIDI de viento, que hace lo mismo pero el tono depende de cómo el músico sopla aire al controlador de viento digital.
* **(Conexión a Jamulus)** Podrás escuchar la salida de audio de tu sistema de Linux en tus altavoces, pero la salida de audio no se puede utilizar como la entrada para la sesión de Jamulus. Así que el siguiente paso es conectar la salida de audio al cliente de Jamulus (con QJackCtl).

### Información general sobre ALSA, JACK y MIDI
Primero vamos a explicar algunos conceptos básicos en Linux para utilizar MIDI y Audio juntos.
* ALSA es la base para la conexión al hardware; por ejemplo la tarjeta de sonido y el controlador MIDI para el teclado.
* JACK se apoya en ALSA y utiliza ALSA para la salida de audio. Proporciona un entorno adecuado para la producción de audio en Linux.
* Sintetizadores como el [emulador de örgano Hammond setBfree](https://github.com/pantherb/setBfree) se conectan a JACK for audio outputpara la salida de audio.
* Jamulus se conecta a JACK.

### Requisitos para Utilizar Sintes de Software en Jamulus con Linux
Para la conexión MIDI de ALSA2JACK (`a2jmidid`) es necesario instalar el paquete a2j. En este ejemplo utilizamos además el emulador de órgano Hammond `setBfree`. Reemplaza `setBfree` con tu sintetizador favorito en Linux. Ambos paquetes, `a2jmidid` y `setbfree` se pueden instalar con el gestor de paquetes, o por ejemplo en Ubuntu/Mint con los comandos `apt-get`:
```shell
    sudo apt-get install a2jmidid
    sudo apt-get install setbfree
```

### Conectar ALSA, JACK y MIDI para un Sinte y Jamulus
Ahora veremos el flujo de trabajo para utilizar toda la infraestructura en Jamulus.
* **(Instalación de Jamulus y JACK)** Utiliza el [script de instalación](https://github.com/corrados/jamulus/wiki/Linux-Client-Install-Script) para Jamulus en Linux o [instala Jamulus siguiendo las instrucciones de la wiki](https://github.com/corrados/jamulus/wiki/Installation-for-Linux). Con esta instalación tenemos JACK y QJackCtl instalados para Jamulus.
* **(ALSA a JACK - MIDI)** Ahora tenemos que crear una conexión de ALSA a JACK para enrutar la entrada MIDI del teclado al [Emulador de Hammond setBfree](https://github.com/pantherb/setBfree).
   * ***(Línea de Comandos: `qjackctl`)*** Para este paso puedes arrancar JACK-Control (QJackCtl) desde la línea de comandos con `qjackctl`,
   * ***(Línea de Comandos: `a2jmidid -e`)*** Luego lanza el conector ALSA2JACK MIDI con el comando: `a2jmidid -e`. Mientras se ejecute este conector en la terminal, la interfaz de conexión `a2j` estará visible en `QJackCtl`.
   * ***(QJackCtl: `ALSA-MIDI`)*** Conecta tu USB MIDI como entrada a `MIDI through` en la pestaña ALSA-MIDI de QJackCtl. Ahora los eventos MIDI de tu teclado llegarán a JACK y están listos para conectar.
   * ***(Arranca el Sinte)*** Arranca el Sintetizador Hammond también desde la línea de comandos con `setBfree`. Verás la interfaz gráfica de `setBfree` (ver http://setbfree.org/gui_3d). Pulsa con el ratón en el teclado del órgano para ver si el sinte genera un sonido de órgano en tus altavoces.
   * ***(QJackCtl: `JACK-MIDI`)*** Ahora podemos conectar `a2j` en JACK-MIDI como entrada al sinte `setBfree`, que genera el sonido como salida para cada pulsación del teclado. Ten en cuenta que puedes conectar sintes si están arrancados y visibles para QJackCtl. Así que los puedes conectar después de arrancar el [Emulador de Hammond setBfree](https://github.com/pantherb/setBfree), esto es, conectar `a2j` a `setBfree` si también ves el Sintetizador de Hammond SetBFree en QJackCtl.
   * ***(Probar Sinte de Software con Teclado MIDI)*** Si tienes altavoces conectados a tu ordenador Linux podrás escuchar el sonido del Hammond emulado cuando pulses las teclas de tu teclado MIDI. Si solo quieres tocar el sinte de software con tu teclado ya puedes hacerlo a partir de ahora. El único paso que queda es conectar el audio a Jamulus.
* **(Sinte a Jamulus - Audio)** En el paso anterior conectamos las señales MIDI de tu teclado a la entrada MIDI de JACK utilizando la conexión a2j - MIDI through. AHora crea una conexión de audio en JACK (esto es, el sonido generado del sinte Hammond). Conectamos la salida del [Emulador de Hammond setBfree](https://github.com/pantherb/setBfree) a Jamulus. Por tanto Jamulus debe estar arrancado para que también estén visibles sus conexiones de audio de Jamulus en QJackCtl. Ahora ouedes conectar la salida del [Emulador de Hammond setBfree](https://github.com/pantherb/setBfree) a la entrada de audio de Jamulus en JACK.

En general `QJackCtrl` se utiliza para operaciones similares, como por ejemplo enchufar los instrumentos en una mezcladora y la mezcladora a un amplificador - y de nuevo el amplificador a los altavoces. Diviértete con otros sintes de Código Abierto como QSynth o [ZynAddSubFX](https://sourceforge.net/projects/zynaddsubfx/) que se pueden instalar en tu sistema Linux y/o utilizar en LMMS.

¡Que te diviertas tocando tu sinte con Jamulus!
