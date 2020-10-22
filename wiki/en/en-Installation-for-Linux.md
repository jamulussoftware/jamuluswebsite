---
layout: wiki
title: "Installation for Linux"
lang: "en"
permalink: "/wiki/Installation-for-Linux"
---


# Installation for Linux
Make sure you read the [Getting Started](Getting-Started) page.

**Right now, we don't provide official packages for Jamulus**

There is a list of unofficial [packages for different distributions here](https://github.com/corrados/jamulus/issues/223#issue-619038918). You can also use an [all-in-one script](Linux-Client-Install-Script) if you want. 

Meanwhile, compiling the sources is quite easy: 

## Get Jamulus sources

1. Open up a terminal window (command line - `CTRL+ALT+t` on Ubuntu and related distros)
1. Download and unzip the sources for the latest release:
~~~
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
~~~


## Install dependencies

First, update your package list (e.g. on Debian based distributions with `sudo apt-get update`).

On **Ubuntu-based** distributions 18.04+, and on Debian 9 or 10:

`sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev`

On **Debian** 11 (bullseye) or later, and Raspberry Pi Raspbian Buster release or later:

`sudo apt-get install build-essential qtdeclarative5-dev  qt5-default qttools5-dev-tools libjack-jackd2-dev` 

On **Fedora**:

`sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel`

### Qjackctl: Optional, but recommended

[QjackCtl](https://qjackctl.sourceforge.io) is a utility to help you set up the Jack audio server (installed as part of the dependencies above). Install it via e.g.

`sudo apt-get install qjackctl`

You may also wish to consider using a [low-latency kernel]( https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (eg. for Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`).

## Compile this bad boy

Now `cd` into the jamulus sources directory you downloaded:

```shell
cd jamulus-latest
```
Now compile the sources with the following commands (the last `make` may take several minutes to run):

~~~
qmake Jamulus.pro
make clean
make
sudo make install
~~~


## Set up your sound card

### Configure Jack with QJackCtl
Jamulus clients need [Jack](https://jackaudio.org/) to run, but you need to configure that first. The recommended method is to use `QjackCtl`. 
1. Open the **command shell** e.g. with Crtl-Alt-T and 
1. execute the command `qjackctl` you will see the **Jack Audio Connection Kit**
1. Check or adapt the **settings**  in `QjackCtl` - especially select your audio input device in the `qjackctl` settings (see settings below) 
1. Start Jack by pressing the **Start-Button** 
You can `Stop` Jack after Quitting Jamulus)

**Settings for Jack Audio Connection Kit**

The exact settings for Jack will depend on what your audio interface/sound card is capable of. 

Configure Jack in `qjackctl` in Settings and do the following:

1. Set the audio **Interface** to the one you want (there may be several in the list)
1. Set the **Sample Rate to 48000**
1. Set the **Frames/Period to 128** and Periods/Buffer at 2 at first
1. Restart Jack to take any new settings

### Start Jamulus
1. Open the command shell e.g. with Crtl-Alt-T and 
1. Execute the command `Jamulus` (with a capital 'J') and you will start the Jamulus Client

Jamulus puts itself into `/usr/local/bin`. You can now delete the sources directory you compiled from. 

If you get problems with sound breaking up (in particular XRUN errors reported by Jack/QJackCtl) try setting bigger values (eg 256 frames or 3 periods) in step 3 above, or lower ones (eg 64 frames) for better performance. See the [troubleshooting page](Client-Troubleshooting) otherwise.

## All installed?
Have a look at [Hardware Setup](Hardware-Setup).
For detailed information on using Jamulus, please see the [help manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

***

## To update your installation to a new release

Download the new sources as per [Get Jamulus](Installation-for-Linux#get-jamulus-sources) and repeat just the [compilation instructions](Installation-for-Linux#compile-this-bad-boy) as if for a new installation above.

## Notes for geeks

* The "make clean" is essential to remove the automatically generated Qt files which are present in the .tar.gz file and may not match the Qt version you are using.

* To use an external shared OPUS library instead of the built-in use qmake `"CONFIG+=opus_shared_lib" Jamulus.pro`.

* To use this file configure the software with `qmake "CONFIG+=noupcasename" Jamulus.pro` to make sure the output target name of this software is jamulus instead of Jamulus.

* Users of Raspberry Pi: You may want to compile the client on another machine and run the binary on the Raspberry Pi. In which case, the only libraries you need to run it are those for a [headless server](Server---Linux#running-a-headless-server) build, but _with_ the Jack sound packages. Especially have a look at the footnote for the headless build.

* As of version 3.5.3, Jamulus is no longer compatible with Qt4.
