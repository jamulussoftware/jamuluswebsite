---
layout: wiki
title: "Server Installation - Linux"
lang: "en"
permalink: "/wiki/Server-Linux"
---

# Server Installation - Linux


**_Please ensure you have read the [server overview](Running-a-Server)_**


## Running a server with the GUI

If you plan to run a server on your desktop machine (and you have installed the Jamulus client already), you can run it in your chosen [server mode](Choosing-a-Server-Type) by running Jamulus with the `-s` option as follows:

1. Open a terminal window (`CTRL+ALT+t` on Ubuntu and related distros).
1. Assuming Jamulus is in `/usr/local/bin`, type `Jamulus -s`

Hit return and you should see the server control window. You can stop the server by closing the server window, or by typing CTRL+C in the terminal.

**To configure the server**, please refer to [the Windows & Macintosh instructions](Server-Win-Mac).

See also [Command Line Options](Command-Line-Options) for other parameters you can set.

## Running a "headless" server

The following guide is for running Jamulus as a "pure" server on **hardware without audio** (e.g. on a 3rd party/cloud host) and assumes Ubuntu/Debian distributions using systemd. We also have instructions for [Raspberry Pi](Server-Rpi), which rock too.

* _Jamulus user [Grigory](https://sourceforge.net/u/cidnurg/profile/) maintains a **[Docker image for Jamulus](https://hub.docker.com/r/grundic/jamulus)** which you can use._


### Compile sources, create a user


1. [Get the sources](Installation-for-Linux#get-jamulus-sources), install the [dependent packages](Installation-for-Linux#install-dependencies) according to the Linux client install guide. Note that **you don't need to install the JACK package(s)** for a headless build. _If you plan to run headless on Gentoo, or are compiling under Ubuntu for use on another Ubuntu machine, [see the footnote](#what-does-the-headless-build-flag-do)._
1. Compile the sources to ignore the JACK sound library:

~~~
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
~~~

3. Move the resulting `Jamulus` binary file to a permanent location, or use `sudo make install`. You can now remove the sources directory if you wish.

**The rest of this guide assumes you are using  `/usr/local/bin/Jamulus`**

4. Create a non-privileged system user for the server to run as (will run as user _jamulus_, group _nogroup_):

`sudo adduser --system --no-create-home jamulus`

### Create a start script

Once you have decided which mode you want your server to run in, use systemd to start it up.

Create a systemd unit file that will start the server at boot time (thanks to [David Harrold](https://sourceforge.net/u/dkxl/profile/) for this).

The unit file applies high priority CPU and I/O scheduling to the server process. This is optional (and may be ignored on some hosts).

Note also that the server log entries will go to journalctl (use [journald](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs) to see it ).

**Note**: The rest of this guide assumes you are in "public" mode using the `-e` (`--centralserver`) option. This specifies which musical genre list your server will appear in. See [the list of available genres here](Central-Servers)).

~~~
[Unit]
Description=Jamulus-Server
After=network.target

[Service]
Type=simple
User=jamulus
Group=nogroup
NoNewPrivileges=true
ProtectSystem=true
ProtectHome=true
Nice=-20
IOSchedulingClass=realtime
IOSchedulingPriority=0

#### Change this to set genre, location and other parameters.
#### See [Command-Line-Options](Command-Line-Options) ####
ExecStart=/usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o "yourServerName;yourCity;[country ID]"

Restart=on-failure
RestartSec=30
StandardOutput=journal
StandardError=inherit
SyslogIdentifier=jamulus

[Install]
WantedBy=multi-user.target
~~~

Copy the unit file to `/etc/systemd/system` and give it permissions:


`sudo cp jamulus.service /etc/systemd/system/jamulus.service`

`sudo chmod 644 /etc/systemd/system/jamulus.service`


Test that it starts OK:

`sudo systemctl start jamulus`

`sudo systemctl status jamulus`


You should see something like this:

~~~
● jamulus.service
   Loaded: loaded (/lib/systemd/system/jamulus.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2020-03-26 11:52:34 GMT; 4s ago
 Main PID: 1308 (Jamulus)
    Tasks: 2 (limit: 4915)
   CGroup: /system.slice/jamulus.service
           └─1308 /usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o yourServerName;yourCity;[country ID]

Mar 26 11:52:34 oddjob systemd[1]: Started jamulus.service.
Mar 26 11:52:35 oddjob jamulus[1308]: - server mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - no GUI mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - central server: jamulus.fischvolk.de
Mar 26 11:52:35 oddjob jamulus[1308]: - server info: yourServerName;yourCity;[country ID]
Mar 26 11:52:35 oddjob jamulus[1308]: - welcome message: Thanks for connecting!
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Jamulus, Version [version]
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Internet Jam Session Software
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Under the GNU General Public License (GPL)
~~~

If all is well, enable the service to start at boot with:

`sudo systemctl enable jamulus`

You can now also control Jamulus with the `service` command. For example:

`sudo service jamulus status`

shows whether Jamulus is running OK, and the last few lines of the log (where you will see connections recorded).
Note: Press `q` to exit the service status.

### To update your installation to a new release

Download the new sources as per the [instructions above](Server-Linux#compile-sources-create-a-user) and repeat the compilation in step 2 as if for a new installation. Shut down the server, copy the Jamulus binary over the old one and start it back up.

***

See also [Command Line Options](Command-Line-Options) for other parameters you can set.

## Footnotes

### Controlling recordings

When using the [recording function](Server-Win-Mac#recording) with the `-R` [command line option](Command-Line-Options), if the server receives a SIGUSR1 signal during a recording, it will start a new recording in a new directory. SIGUSR2 will toggle recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `newRecording-Jamulus-server.service`).

For turning recording on or off (depending on the current state):

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

For starting a new recording:

~~~
[Unit]
Description=Start a new recording on Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note: The Jamulus service name in the `ExecStart` line needs to be the same as the `.service` file name you created when setting systemd to control your Jamulus server. So in this example it would be `Jamulus-Server.service`_

Run `sudo systemctl daemon-reload` to register them for first use.

Now you can run these with the `service start` command, for example:

`sudo service jamulusTogglerec start` (assuming you named your unit file `jamulusTogglerec.service`)

You can see the result of these commands if you run `service jamulus status`, or by viewing the logs.

### Viewing The Logs

Jamulus will log to the system file if you left the `StandardOutput=journal` setting in the unit file. Logging to the system log is recommended, as the system will manage the log file for you, no need to come back and purge it later, or worry about filling up your disk space.

To view the log, use `journalctl` (to exit press Ctrl-C). For example, to read the system log file, filtered for the Jamulus service:

`journalctl -u jamulus`

For today’s entries:

`journalctl -u jamulus --since today`

For the last hour:

`journalctl -u jamulus --since "1 hour ago"`

Filter the log to see connection messages for your Jamulus server:

`journalctl -u jamulus | grep connected`

Follow (show on screen) Jamulus log messages as they occur:

`journalctl -f -u jamulus`

### What does the "headless" build flag do?

Although not strictly necessary, we recommend using the `headless` flag to speed up the build process. Gentoo users may also be able to avoid installing some dependencies as a consequence. [More information here](Compiling#the-headless-build-flag).
