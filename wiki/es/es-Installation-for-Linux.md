---
layout: wiki
title: "Instalación en Linux"
lang: "es"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Utilización de Jamulus" branch1="Cómo Empezar" branch1-url="Getting-Started" %}

# Instalación en Linux
Asegúrate de leer la página de [Cómo Empezar](Getting-Started).

## Paquetes de Jamulus

Aunque no ofrecemos paquetes oficiales para cada distribución de Linux, puede que encuentres Jamulus en el gestor de paquetes de tu distribución. Echa un vistazo a esta tabla:

[![Packaging status](https://repology.org/badge/vertical-allrepos/jamulus.svg)](https://repology.org/project/jamulus/versions)


También hay una list no oficial de [paquetes para diferentes distribuciones aquí](https://github.com/jamulussoftware/jamulus/discussions/914).

### Flatpak

Jamulus se encuentra disponible como [Flatpak](https://flatpak.org/) de [Flathub aquí](https://flathub.org/apps/details/io.jamulus.Jamulus). Necesitarás configurar pipewire para utilizar el flatpak de Jamulus.

### Debian y Ubuntu
Puedes instalar Jamulus de [buster-backports](https://packages.debian.org/de/buster-backports/jamulus) o - si utilizas amd64 **Debian**/**Ubuntu** - puedes probar los paquetes .deb compilados con GitHub Actions:

1. Descarga el [último archivo .deb]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Actualiza apt: `sudo apt-get update`
1. Instala el paquete: `sudo apt install /path/to/{{ site.download_file_names.deb-gui }}`.
1. Puesto que Jamulus necesita el servidor JACK, también debes instalarlo. Recomendamos el uso de `QjackCtl` para configurar JACK. Puedes instalarlo con `sudo apt-get install qjackctl`

Después, deberás consultar el paso de "[configurar tu tarjeta de sonido](#set-up-your-sound-card)" de esta página.

**Nota** Jamulus (con GUI) también se [incluye en Debian Bullseye (testing)](https://packages.debian.org/bullseye/jamulus) gracias a [mirabilos](https://github.com/mirabilos). Si ya utilizas Bullseye, simplemente instala Jamulus con `sudo apt-get install jamulus`.

---

Si no puedes utilizar ninguna de las opciones de arriba, deberás compilarlo de las fuentes:

## Compilar de las fuentes

### Obtén las fuentes de Jamulus

1. Abre una terminal (línea de comandos - `CTRL+ALT+t` en Ubuntu y distros relacionadas)
1. Descarga y descomprime las fuentes para la última versión:
```shell
wget https://github.com/jamulussoftware/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


### Instala las dependencias

Primero actualiza la lista de paquetes (por ej. en distribuciones basadas en Debian con `sudo apt-get update`).

En distros basadas en **Ubuntu**  18.04+, **Debian** 9+ o 10 y Raspberry Pi Raspbian Buster o superior:

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev 
```

En **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus libQt5Concurrent5 jack-audio-connection-kit-devel
```

### QjackCtl: Opcional, pero recomendado

[QjackCtl](https://qjackctl.sourceforge.io) es una utilidad para ayudarte a configurar JACK (instalado como parte de las dependencias mencionadas arriba). Instálalo por ej. con

```shell
sudo apt-get install qjackctl
```

También puedes plantearte usar un [kernel low-latency](https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (por ej. para Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`).

### Compílalo

Ahora `cd` a la carpeta de las fuentes de Jamulus que has descargado:

```shell
cd jamulus-latest
```
A continuación compila las fuentes con los siguientes comandos (el último `make` puede tardar varios minutos):

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```
**Nota** La versión compilada de Jamulus se instala en `/usr/local/bin`.

Ahora ya puedes eliminar el directorio de las fuentes donde lo has compilado.

---

## Configura tu tarjeta de sonido

### Configura JACK con QjackCtl
Los clientes de Jamulus necesitan [JACK](https://jackaudio.org/) para funcionar, pero hay que configurarlo primero. El método recomendado es utilizar `QjackCtl`.
1. Abre la terminal por ej. con Crtl-Alt-T y
1. Ejecuta el comando `qjackctl`. Se abrirá la aplicación **Qt JACK Control**
2. Configura tu interfaz de audio como sigue (la configuración exacta de JACK dependerá de lo que es capaz tu interfaz/tarjeta de audio):

- Elige el **Interfaz** que quieres utilizar (puede haber varios en la lista)
- Establece la **Frecuencia de Muestreo en 48000**
- Establece los **Cuadros/Periodo en 128** y Periodos/Buffer en 2 para empezar

Reinicia JACK para que surta efecto la nueva configuración

### Arranca Jamulus

Desde la terminal, ejecuta el comando `jamulus`, o si lo has compilado de las fuentes `Jamulus` (con 'J' mayúscula). Esto arrancará el cliente de Jamulus.

Jamulus se instala en `/usr/local/bin`. Ahora puedes eliminar la carpeta de las fuentes si quieres.

Si tienes problemas con cortes de sonido (en particular errores de XRUN mostrados por JACK/QjackCtl) prueba con valores más altos (por ej. 256 cuadros o 3 periodos). Valores más bajos (por ej. 64 cuadros) pueden ofrecer un mejor rendimiento pero también quizá más problemas con el audio. Ver la [página de resolución de problemas](Client-Troubleshooting).

## ¿Todo instalado?
Jamulus ha sido instalado y ahora puede utilizarse. Ahora puedes echar un vistazo a la

[página de Iniciación a Jamulus](Onboarding){: .button}

## Para actualizar tu instalación a una nueva versión

Descarga las nuevas fuentes como en [Obtén Jamulus](Installation-for-Linux#obtén-las-fuentes-de-jamulus) y repite solamente las [instrucciones de compilación](Installation-for-Linux#compílalo) como si fuera una nueva instalación o instala el nuevo paquete .deb si fue lo que utilizaste.

## Nota para frikis

* El comando "make clean" es esencial para eliminar los archivos de Qt generados automáticamente los cuales están presentes en el archivo .tar.gz y que quizá no concuerden con la versión de Qt que estás utilizando.

* Para utilizar una librería compartida de OPUS en lugar del que viene integrado usa qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* Para utilizar este archivo configura el software con `qmake "CONFIG+=noupcasename" Jamulus.pro` para asegurarte de que el nombre de destino de este software es **j**amulus en lugar de **J**amulus.

* Usuarios de Raspberry Pi: Quizá quieras compilar el cliente en otra máquina y ejecutar el archivo binario en el Raspberry Pi. En este caso, las únicas librerías que necesitas para ejecutarlo son aquellos necesarios para la compilación de un [servidor "headless"](Server-Linux#ejecutar-un-servidor-headless) pero _con_ las librerías de audio para JACK. Sobre todo lee el pie de página sobre la compilación "headless".

* A partir de la versión 3.5.3, Jamulus ya no es compatible con Qt4.
