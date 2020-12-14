---
layout: wiki
title: "Instalación de Servidor – Raspberry Pi"
lang: "es"
permalink: "/wiki/Server-Rpi"
---

# Instalación de Servidor - Raspberry Pi

**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**

_Jamulus ha sido testado en un Raspberry Pi 4 2Gb por el usuario de Jamulus [SIVA Frédéric](https://sourceforge.net/u/fredsiva/profile/)_

1. Instala Raspbian Buster (permite [VNC](https://www.raspberrypi.org/documentation/remote-access/vnc/) y [SSH](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md) para mayor comodidad, pero en última instancia se ejecutará sin VNC para mayor velocidad)

1. Edita [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/) para habilitar el arranque sin HDMI añadiendo `hdmi_force_hotplug=0`

1. [Obtén las fuentes](Installation-for-Linux#obtén-las-fuentes-de-jamulus), instala las [dependencias](Installation-for-Linux#instala-las-dependencias) de acuerdo a la guía de instalación de Linux **pero NO instales los paquetes de JACK** - no los necesitas en un [servidor headless](Server-Linux#ejecutar-un-servidor-headless). Para ejecutar un cliente, instala todas las dependencias listadas.

1. Compila el código fuente para un servidor de acuerdo a [estas instrucciones](Server-Linux#compila-las-fuentes-crea-un-usuario). Compila un cliente utilizando las [instrucciones predeterminadas](Installation-for-Linux#compílalo).

Esto compilará Jamulus y lo instalará en `/usr/local/bin/Jamulus`

Conecta el Raspberry Pi con un cable Ethernet a tu router.

Si estás ejecutando un servidor, pruébalo arrancándolo con la opción `--server` y visualiza la interfaz gráfica mediante VNC (o HDMI). Cuando lo ejecutas como cliente, deberías de ver abrirse la interfaz gráfica.

`Jamulus -s`

Si todo ha ido bien, ejecuta en el [modo de servidor](Choosing-a-Server-Type) escogido como sigue (o utiliza el script de unidad de systemd proporcionado en la [guía para Linux](Server-Linux#crea-un-script-de-arranque)); por ejemplo un servidor público:

`sudo chrt 99 ionice -c1 nice -n -20 Jamulus -s -n -e [tuServidorCentral] -o "nombreDeTuServidor;tuCiudad;[ID país]"&`

**También consulta esta [nota importante sobre los servidores centrales](Central-Servers).**

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.
***

### Para actualizar Jamulus

Cierra el servidor y simplemente repite el paso 3 de arriba para obtener las fuentes y hacer la instalación.

Si quieres instalar una versión concreta, puedes hacer lo siguiente usando git (donde `[VERSIÓN]` es el código de la versión como r3_5_8). Ver [las versiones oficiales](https://github.com/corrados/jamulus/releases).

Primero, `cd` al directorio donde se descomprimieron/descargaron las fuentes de Jamulus, y luego usa estos comandos:

~~~
git pull
git checkout [VERSIÓN]
~~~

Luego compila las fuentes como con una instalación nueva. Arranca Jamulus de nuevo.
