---
layout: wiki
title: "Installation for Linux"
lang: "en"
permalink: "/wiki/Installation-for-Linux"
---

# Installation for Linux
Make sure you read the [Getting Started](Getting-Started) page.

## Jamulus packages

Although we don't provide official packages, you might find Jamulus in the package manager of your distro. Have a look at this table:

[![Packaging status](https://repology.org/badge/vertical-allrepos/jamulus.svg)](https://repology.org/project/jamulus/versions)

There is also list of unofficial [packages for different distributions here](https://github.com/corrados/jamulus/issues/223){: target="_blank" rel="noopener noreferrer"}. If you don't find it in your package manager, you need to compile Jamulus from source. That's quite easy:

## Get Jamulus sources

1. Open up a terminal window (command line - `CTRL+ALT+T` on Ubuntu and related distros)
1. Download and unzip the sources for the latest release:
```shell
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


## Install dependencies

First, update your package list (e.g. on Debian based distributions with `sudo apt-get update`).

On **Ubuntu-based** distributions 18.04+, **Debian** 9+ or 10 and Raspberry Pi Raspbian Buster release or later:

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

On **Fedora**:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus libQt5Concurrent5 jack-audio-connection-kit-devel
```

### QjackCtl: Optional, but recommended

[QjackCtl](https://qjackctl.sourceforge.io) is a utility to help you set up the Jack audio server (installed as part of the dependencies above). Install it via e.g.

```shell
sudo apt-get install qjackctl
```

You may also wish to consider using a [low-latency kernel](https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (eg. for Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`).

## Compile this bad boy

Now `cd` into the jamulus sources directory you downloaded:

```shell
cd jamulus-latest
```
Now compile the sources with the following commands (the last `make` may take several minutes to run):

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```

## Set up your sound card

### Configure JACK with QjackCtl
Jamulus clients need [JACK](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"} to run, but you need to configure that first. The recommended method is to use `QjackCtl`.
1. Open the command shell e.g. with Ctrl-Alt-T and
1. Execute the command `qjackctl` you will see the **Jack Audio Connection Kit**
2. Configure your audio interface as follows (the exact settings for JACK will depend on what your audio interface/sound card is capable of):

- Set the audio **Interface** to the one you want (there may be several in the list)
- Set the **Sample Rate to 48000**
- Set the **Frames/Period to 128** and Periods/Buffer at 2 at first

Restart JACK to take any new settings

### Start Jamulus

Open Jamulus e.g. via your command shell. If you use the shell, execute the command `Jamulus` (with a capital 'J') which starts the Jamulus Client

Jamulus puts itself into `/usr/local/bin`. You can now delete the sources directory you compiled from.

If you get problems with sound breaking up (in particular XRUN errors reported by JACK/QjackCtl) try setting bigger values (e.g. 256 frames or 3 periods) in step 3 above. Lower ones (e.g. 64 frames) could bring better performance but maybe more sound problems. See the [troubleshooting page](Client-Troubleshooting) otherwise.

## All installed?

Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Onboarding){: .button}

## To update your installation to a new release

Download the new sources as per [Get Jamulus](Installation-for-Linux#get-jamulus-sources) and repeat just the [compilation instructions](Installation-for-Linux#compile-this-bad-boy) as if for a new installation above.

## Notes for geeks

* The "make clean" is essential to remove the automatically generated Qt files which are present in the .tar.gz file and may not match the Qt version you are using.

* To use an external shared OPUS library instead of the built-in use qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* To use this file configure the software with `qmake "CONFIG+=noupcasename" Jamulus.pro` to make sure the output target name of this software is **j**amulus instead of **J**amulus.

* Users of Raspberry Pi: You may want to compile the client on another machine and run the binary on the Raspberry Pi. In which case, the only libraries you need to run it are those for a [headless server](Server-Linux#running-a-headless-server) build, but _with_ the JACK sound packages. Especially have a look at the footnote for the headless build.

* As of version 3.5.3, Jamulus is no longer compatible with Qt4.
