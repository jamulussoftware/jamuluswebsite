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

### Software necesario
* Un compilador como [Visual Studio](https://visualstudio.microsoft.com) (Solo necesitas [Build Tools 2017 o 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16) pero también puedes optar por descargar e instalar el IDE completo de [la página de descargas de Visual Studio](https://visualstudio.microsoft.com/downloads/))
* [Qt](https://www.qt.io/download)
* Utiliza la licencia libre GPLv2 para desarrollo de código abierto
* Para determinar qué versión de Qt necesitas, comprueba [qt-installer-windows.qs](https://github.com/jamulussoftware/jamulus/blob/master/windows/qt-installer-windows.qs): bajo INSTALL_COMPONENTS verás `qt.qt5.[version]`, por ej., 5123 significa versión 5.12.3.
* Selecciona Componentes durante la instalación: Expande la sección Qt, encuentra la versión correspondiente, por ej., **Qt 5.12.3**, y añade los componentes de compilador para tu compilador, por ej., `MSVC 2017 32-bit/64-bit` para Visual Studio 2019
* [Archivos de desarrollo de ASIO](https://www.steinberg.net/en/company/developer.html)

### Descarga el código fuente de Jamulus
Obtén el código fuente de Jamulus, por ej. de git o [descarga el zip](https://github.com/jamulussoftware/jamulus/archive/master.zip) desde el [repositorio de Jamulus](https://github.com/jamulussoftware/jamulus).

### Compilar y construir el instalador

La mayoría de usuarios probablemente querrán utilizar este método:

1. Abre PowerShell
1. Navega al directorio `jamulus`
1. Para permitir scripts sin firma, haz clic derecho en el script `windows\deploy_windows.ps1`, selecciona propiedades y permite la ejecución de este script. También puedes ejecutar `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`. (Puedes revertir esto tras ejecutar el script. Para más información ver la [página de documentación de Microsoft PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)).
1. Edita las variables $QtCompile32 y $QtCompile64.
1. Ejecuta el script de compilación e instalación en PowerShell: `.\windows\deploy_windows.ps1 C:\Qt\QtVersion`.
1. Ahora puedes encontrar el instalador de Jamulus en el directorio `.\deploy`.

### Solo compilación

1. Crea una carpeta bajo `\windows` llamada ASIOSDK2
1. Descarga [ASIOSDK](https://www.steinberg.net/asiosdk), abre la carpeta raiz del archivo .zip y copia el contenido a `[\ruta\a\jamulus\source]\windows\ASIOSDK2` para que, por ejemplo, exista el directorio `[\ruta\a\jamulus\source]\windows\ASIOSDK2\common`
1. Abre Jamulus.pro en Qt Creator, configura el proyecto con un kit por defecto, luego compílalo y ejecútalo


## Notas generales

### El indicador de compilación "headless"

Compilar con el indicador `headless` significa que puedes evitar instalar algunas de las dependencias bajo las siguientes circunstancias:

1. Si tienes pensado ejecutar Jamulus en Gentoo Linux, los únicos paquetes que deberías necesitar para la operación headless son `qtcore`, `qtnetwork`, `qtconcurrent` y `qtxml` (tanto para compilar como para ejecutar el servidor).

1. Si estás ejecutando Jamulus en Ubuntu/Debian, necesitarás todas las dependencias para **compilar** el archivo binario, pero para **ejecutar** el servidor headless resultante solo deberías necesitar `libqt5core5a`, `libqt5network5`, `libqt5xml5` y probablemente `libqt5concurrent5`. Esto puede ser útil para ejecutar el binario en otra máquina (un Raspberry Pi, por ejemplo).

1. Ten en cuenta que si quieres compilar un cliente con GUI en una máquina y ejecutarlo en otro (por ej. un Raspberry Pi) solo necesitas las dependencias listadas para un [servidor "headless"](Server-Linux#ejecutar-un-servidor-headless) (ver punto anterior), solo que _con_ las librerías de audio de JACK.
