---
layout: wiki
title: "Server Installation – Raspberry Pi"
lang: "en"
permalink: "/wiki/Server-Rpi"
---

# Server Installation - Raspberry Pi

**_Please ensure you have read the [server overview](Running-a-Server)_**

_Jamulus has been tested on a Raspberry Pi 4 2Gb by Jamulus user [SIVA Frédéric](https://sourceforge.net/u/fredsiva/profile/)_

1. Install Raspbian Buster (allow [VNC](https://www.raspberrypi.org/documentation/remote-access/vnc/) and [SSH](https://www.raspberrypi.org/documentation/remote-access/ssh/README.md) for comfort, but will ultimately run without VNC for higher speed)

1. Edit [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/) to enable boot without HDMI by adding `hdmi_force_hotplug=0`

1. [Get the sources](Installation-for-Linux#get-jamulus), install the [dependent packages](Installation-for-Linux#install-the-dependent-packages) according to the Linux client install guide **but do NOT install Jack package(s)** - you don't need them on a [headless server](https://github.com/corrados/jamulus/wiki/Server---Linux#running-a-headless-server). To run a client, install all listed dependencies.

1. Compile the source code for a server as per [these instructions](Server---Linux#compile-sources-create-a-user). Compile a client using the [default instructions](Installation-for-Linux#compile-this-bad-boy).

This will build Jamulus and put it in `/usr/local/bin/Jamulus`

Connect Raspberry Pi with Ethernet cable to your router.

If you are running a server, test by starting with the `--server` option, and watch GUI on VNC (or HDMI). When running as a client, you should see the GUI start.

`Jamulus -s`

If all is well, run in your chosen [server mode](Choosing-a-Server-Type) as follows (or use systemd unit script provided in the [Linux guide](Server---Linux#create-a-start-script)), for example a public server:

`sudo chrt 99 ionice -c1 nice -n -20 Jamulus -s -n -e [yourCentralServer] -o "yourServerName;yourCity;[country ID]"&`

**Please also see this [important note on Central Servers](Central-Servers).**

See also [Command Line Options](Command-Line-Options) for other parameters you can set.
***

### To upgrade Jamulus

Stop the server and simply repeat step 3 for obtaining the sources and installing above.

If you want to install a specific release, you can do the following using git (where `[RELEASE]` is a release ID such as r3_5_8). See the [official tagged releases](https://github.com/corrados/jamulus/releases).

First, `cd` inside the directory in which the Jamulus sources were unpacked/downloaded, then use the following commands:

~~~
git pull
git checkout [RELEASE]
~~~

Then compile the sources as per a new install. Start Jamulus back up.
