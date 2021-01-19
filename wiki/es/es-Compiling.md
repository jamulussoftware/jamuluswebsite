---
layout: wiki
title: "Compilación"
lang: "es"
permalink: "/wiki/Compiling"
---

# Compilar Jamulus de las Fuentes

## Linux

Por favor consulta la [página de instalación del cliente](Installation-for-Linux) o estas instrucciones si deseas [compilar un servidor 'headless'](Server-Linux#ejecutar-un-servidor-headless)

## macOS
No necesitas compilar Jamulus para macOS ya que proporcionamos binarios oficiales, pero si de verdad quieres hacerlo, sigue las siguientes instrucciones.
### Requisitos

1. Instala XCode
1. Instala Qt como sigue

```shell
brew install qt5
brew link qt5 --force
```

### Compila el proyecto

#### Genera el archivo de Proyecto XCode
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Genera los objetivos y la configuración en la consola
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
esto llevará a
```shell
Targets:
    Jamulus
    Qt Preprocess

Build Configurations:
    Debug
    Release

If no build configuration is specified and -scheme is not passed then "Release" is used.

Schemes:
    Jamulus
```

#### Compila el proyecto

```shell
xcodebuild build
```

Generará el archivo y lo hará disponible en ./Release/Jamulus.app


## Windows
No necesitas compilar Jamulus para Windows ya que proporcionamos binarios oficiales, pero si de verdad quieres hacerlo, sigue las siguientes instrucciones.

**Software necesario**: [QT](https://www.qt.io/download), un compilador como Visual Studio, archivos de desarrollo de ASIO

- obtén el código fuente de Jamulus, por ej. de git o una descarga del zip desde el repositorio de Jamulus
- copia los archivos de desarrollo de [ASIO](https://www.steinberg.net/de/company/developer.html) al directorio `[\ruta\a\jamulus\source]\windows` para que, por ejemplo, se cree el directorio `[\ruta\a\jamulus\source]\ASIOSDK2\common`
- abre Jamulus.pro en Qt Creator, compílalo y ejecútalo


## Notas generales

### El indicador de compilación "headless"

Compilar con el indicador `headless` significa que puedes evitar instalar algunas de las dependencias bajo las siguientes circunstancias:

1. Si tienes pensado ejecutar Jamulus en Gentoo Linux, los únicos paquetes que deberías necesitar para la operación headless son `qtcore`, `qtnetwork`, `qtconcurrent` y `qtxml` (tanto para compilar como para ejecutar el servidor).

1. Si estás ejecutando Jamulus en Ubuntu/Debian, necesitarás todas las dependencias para **compilar** el archivo binario, pero para **ejecutar** el servidor headless resultante solo deberías necesitar `libqt5core5a`, `libqt5network5`, `libqt5xml5` y probablemente `libqt5concurrent5`. Esto puede ser útil para ejecutar el binario en otra máquina (un Raspberry Pi, por ejemplo).

1. Ten en cuenta que si quieres compilar un cliente con GUI en una máquina y ejecutarlo en otro (por ej. un Raspberry Pi) solo necesitas las dependencias listadas para un [servidor "headless"](Server-Linux#ejecutar-un-servidor-headless) (ver punto anterior), solo que _con_ las librerías de audio de JACK.
