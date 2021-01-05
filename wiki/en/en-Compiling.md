---
layout: wiki
title: "Compiling"
lang: "en"
permalink: "/wiki/Compiling"
---

# Compiling Jamulus from Source

## Linux

Please refer to the [client installation page](Installation-for-Linux) or these instructions if you wish to [compile a headless server](Server-Linux#running-a-headless-server)

## macOS
You don't need to compile Jamulus for macOS since we provide official binaries, but if you really want to, follow the instructions below.
### Requirements

1. Install XCode
1. Install Qt as follow

```shell
brew install qt5
brew link qt5 --force
```

### Build project

#### Generate XCode Project file
```shell
qmake -spec macx-xcode Jamulus.pro
```

#### Print build targets and configuration in console
```shell
xcodebuild -list -project Jamulus.xcodeproj
```
will prompt
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

#### Build the project

```shell
xcodebuild build
```

Will build the file and make it available in `./Release/Jamulus.app`


## Windows
You don't need to compile Jamulus for Windows since we provide official binaries, but if you really want to, follow the instructions below.

**Required software**: [Qt](https://www.qt.io/download), a compiler like Visual Studio ([Build Tools 2017 or 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16) recommended), [ASIO development files](https://www.steinberg.net/en/company/developers.html)

Get the Jamulus source code e.g. via git or [zip download](https://github.com/corrados/jamulus/archive/master.zip) from the [Jamulus repo](https://github.com/corrados/jamulus). Make sure that there are **no** spaces in the directory you move the `jamulus` directory to since it might break the Jamulus installer (if you know how to fix this issue, please open an issue on the Jamulus repo to tell us how).

### Compiling and building installer

Most users will probably want to use this method:

1. Open PowerShell
1. Navigate to the `jamulus` directory
1. To allow unsigned scripts, run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`. You can also revert this after having run this script. For more information see the [Microsoft PowerShell documentation page](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy)
1. Edit the $QtCompile32 and $QtCompile64 variables
1. Run the Jamulus compilation and installer script: `.\windows\deploy_windows.ps1 C:\Qt\QtVersion`. 
1. You can now find the Jamulus installer in the `.\deploy` directory

### Compiling only

1. Get and copy the [ASIOSDK](https://www.steinberg.net/de/company/developer.html) development files in `[\path\to\jamulus\source]\windows` directory so that, e.g., the
  directory `[\path\to\jamulus\source]\ASIOSDK2\common` exists
1. Open Jamulus.pro in Qt Creator then compile & run

## General notes

### The "headless" build flag

Compiling with the `headless` flag means you can avoid installing some of the dependent packages, save some disk space and/or speed up your build time under the following circumstances:

1. If you plan to run Jamulus on Gentoo Linux, the only packages you should need for a headless build are `qtcore`, `qtnetwork`, `qtconcurrent` and `qtxml` (both for building and running the server).

1. If you are running Jamulus on Ubuntu/Debian, you will need all dependent packages to **compile** the binary, but to **run** the resulting headless Jamulus server you should only need `libqt5core5a`, `libqt5network5`, `libqt5xml5` and probably `libqt5concurrent5`. This may be useful for compiling/upgrading on one machine to run the binary on another (a Raspberry Pi, for example).

1. Note that if you want to compile a GUI client on one machine and run it on another (e.g. a Raspberry Pi) you only need the dependencies listed for a [headless server](Server-Linux#running-a-headless-server) (see point above), only _with_ the JACK sound libraries.
