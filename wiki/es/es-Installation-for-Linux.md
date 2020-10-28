---
layout: wiki
title: "Instalación en Linux"
lang: "es"
permalink: "/wiki/Installation-for-Linux"
---


# Instalación en Linux
Asegúrate de leer la página de [Cómo Empezar](Getting-Started).

**Ahora mismo no ofrecemos paquetes oficiales para Jamulus**

Hay una lista no oficial de [paquetes para distintas distribuciones aquí](https://github.com/corrados/jamulus/issues/223#issue-619038918){: target="_blank" rel="noopener noreferrer"}. También puedes utilizar un [script todo-en-uno](Linux-Client-Install-Script) si lo deseas.

Mientras tanto, compilar las fuentes es bastante fácil:

## Obtén las fuentes de Jamulus

1. Abre una terminal (línea de comandos - `CTRL+ALT+t` en Ubuntu y distros relacionadas)
1. Descarga y descomprime las fuentes para la última versión:
```shell
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


## Instala las dependencias

Primero actualiza la lista de paquetes (por ej. en distribuciones basadas en Debian con `sudo apt-get update`).

En distros basadas en **Ubuntu**  18.04+ y en Debian 9 o 10:

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

En **Debian** 11 (bullseye) o posteriores, y la versión de Raspberry Pi Raspbian Buster o posterior:

```shell
sudo apt-get install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

En **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel
```

### Qjackctl: Opcional, pero recomendado

[QjackCtl](https://qjackctl.sourceforge.io) es una utilidad para ayudarte a configurar Jack (instalado como parte de las dependencias mencionadas arriba). Instálalo por ej. con

```shell
sudo apt-get install qjackctl
```

También puedes plantearte usar un [kernel low-latency](https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (por ej. para Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`).

## Compílalo

Ahora `cd` a la carpeta de las fuentes de Jamulus que has descargado:

```shell
cd jamulus-latest
```
Ahora compila las fuentes con los siguientes comandos (el último `make` puede tardar varios minutos):

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```


## Configura tu tarjeta de sonido

### Configura Jack con QJackCtl
Los clientes de Jamulus necesitan [Jack](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"} para funcionar, pero hay que configurarlo primero. El método recomendado es utilizar `QjackCtl`..
1. Abre la terminal por ej. con Crtl-Alt-T y
1. Ejecuta el comando `qjackctl`. Verás la aplicación **Jack Audio Connection Kit**
2. Configura tu interfaz de audio como sigue (la configuración exacta de Jack dependerá de lo que es capaz tu interfaz/tarjeta de audio):

- Elige el **Interfaz** que quieres utilizar (puede haber varios en la lista)
- Establece la **Frecuencia de Muestreo en 48000**
- Establece los **Cuadros/Periodo en 128** y Periodos/Buffer en 2 para empezar

Reinicia Jack para que surta efecto la nueva configuración

### Arranca Jamulus
1. Abre la terminal por ej. con Crtl-Alt-T y
1. Ejecuta el comando `Jamulus` (con 'J' mayúscula) para iniciar el Cliente de Jamulus

Jamulus se instala en `/usr/local/bin`. Ahora puedes eliminar la carpeta de las fuentes si quieres.

Si tienes problemas con cortes de sonido (en particular errores de XRUN mostrados por Jack/QJackctl) prueba con valores más altos (por ej. 256 cuadros o 3 periodos) en el paso 3 anterior. Valores más bajos (por ej. 64 cuadros) pueden ofrecer un mejor rendimiento pero también quizá más problemas con el audio. Ver la [página de resolución de problemas](Client-Troubleshooting).

## ¿Todo instalado?
Mírate la [Configuración de Hardware](Hardware-Setup).
Para información detallada sobre la utilización de Jamulus, por favor consulta el [Manual de Ayuda](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).


## Para actualizar tu instalación a una nueva versión

Descarga las nuevas fuentes como en [Obtén Jamulus](Installation-for-Linux#get-jamulus-sources) y repite solamente las [instrucciones de compilación](Installation-for-Linux#compile-this-bad-boy) como si fuera una nueva instalación.

## Nota para frikis

* "make clean" es esencial para eliminar los archivos de Qt generados automáticamente los cuales están presentes en el archivo .tar.gz y que quizá no concuerden con la versión de Qt que estás utilizando.

* Para utilizar una librería compartida de OPUS en lugar del que viene integrado usa qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* Para utilizar este archivo configura el software con `qmake "CONFIG+=noupcasename" Jamulus.pro` para asegurarte de que el nombre de destino de este software es **j**amulus en lugar de **J**amulus.

* Usuarios de Raspberry Pi: Quizá quieras compilar el cliente en otra máquina y ejecutar el archivo binario en el Raspberry Pi. En este caso, las únicas librerías que necesitas para ejecutarlo son aquellos necesarios para la compilación de un [servidor "headless"](Server-Linux#running-a-headless-server) pero _con_ las librerías de audio para Jack. Sobre todo lee el pie de página sobre la compilación "headless".

* A partir de la versión 3.5.3, Jamulus ya no es compatible con Qt4.
