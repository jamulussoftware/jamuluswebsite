---
layout: post
title: "Server Installation – Raspberry Pi"
heading: "Install Jamulus Server on a Raspberry Pi"
author: "fredsiva"
lang: "en"
---

This guide shows you how to install Jamulus on a Raspberry Pi.
<!--more-->

## Server Installation - Raspberry Pi

Since there are no official armhf .deb files yet, you'll need to compile Jamulus for your Pi from source.

**_Please ensure you have read the [server overview](/wiki/Running-a-Server)_**

_Jamulus has been tested on a Raspberry Pi 4 2Gb by Jamulus user [SIVA Frédéric](https://sourceforge.net/u/fredsiva/profile/)_

1. Install Raspbian Buster (allow [VNC](https://www.raspberrypi.org/documentation/remote-access/vnc/) and [SSH](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md) for comfort, but will ultimately run without VNC for higher speed)

1. Edit [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/) to enable boot without HDMI by adding `hdmi_force_hotplug=0`

1. [Compile Jamulus for Linux](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md).

This will build Jamulus and put it in `/usr/local/bin/Jamulus` (note the capital `J`).

Connect Raspberry Pi with Ethernet cable to your router.

If you are running a server, test by starting with the `--server` option, and watch GUI on VNC (or HDMI). When running as a client, you should see the GUI start.

`Jamulus -s`

If all is well, run in your chosen [server mode](/wiki/Choosing-a-Server-Type) as follows (or use systemd unit script provided in the [Linux guide](/wiki/Server-Linux#create-a-start-script)), for example a public server:

`sudo chrt 99 ionice -c1 nice -n -20 Jamulus -s -n -e [yourCentralServer] -o "yourServerName;yourCity;[country ID]"&`

**Please also see this [important note on Directory Servers](/wiki/Directory-Servers).**

See also [Command Line Options](/wiki/Command-Line-Options) for other parameters you can set.

### To upgrade Jamulus

Stop the server and simply obtainin the sources and compile as above.

If you want to install a specific release, you can do the following using git (where `[RELEASE]` is a release ID such as r3_5_8). See the [official tagged releases](https://github.com/jamulussoftware/jamulus/releases).

First, `cd` inside the directory in which the Jamulus sources were unpacked/downloaded, then use the following commands:

```
git pull
git checkout [RELEASE]
```

Then compile the sources as per a new install. Start Jamulus back up.
