---
layout: wiki
title: "Running a Server"
lang: "en"
permalink: "/wiki/Running-a-Server"
---

# Server Administration Manual
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

## Do I need to run a Server?

**No**. You can use the Servers listed by the built in Directories and use Jamulus without running a Server yourself. Or you can use a third party hosting service such as [melomax](https://melomax.live/jamulus-hosting/) or [KOORD](https://koord.live/). 

If you just want an undisturbed session, use the soloing technique described on the [Tips and Tricks page](Tips-Tricks-More#have-an-undisturbed-session-on-any-server). 

---

## Requirements

### Speed and latency

**_The capability of the Server itself (and the network it's on) is NOT the main determinant of the quality of a Jamulus session!_**

Usually, problems are on the _Client_ side and should be fixed there. Have a look at the [Troubleshooting page](/wiki/Client-Troubleshooting) if needed.

However, various problems can also arise when setting up Servers - especially when run on a low-bandwidth home connection. It's usually fine to have less than 5 players on a slower-speed home connection (eg 10 Mbit/s down and 1 Mbit/s up). You can read more about network requirements at [different quality settings here](Server-Bandwidth).

Consider using a cloud host, not your home internet connection, to get better ping times if you're having problems.

### General notes

* Any Server should have at least 1.6GHz CPU frequency and 1GB RAM
* Running a Server may require you to adjust any firewalls running on or outside of your machine or cloud host.
* Running an [Unregistered Server](Unregistered-Servers) at home will require you to port forward on your router. This should not be necessary when running a Registered Server, in most cases, but it's advisable to do so because some networks may not work properly with Jamulus in its default mode.
* Jamulus only has limited IPv6 support which needs to be enabled with a command line argument on the Client and Server. (There are plans to expand IPv6 support.)

---

## Installation

Most people run Jamulus on a 3rd party/cloud host as a "pure" Server (also known as "headless") on **hardware without audio** running Linux. You can also run a Server in a [**desktop environment**](#servers-on-the-desktop).

To run a headless server on Linux, the following steps assume you are familiar with the command line and Debian/Ubuntu or similar distribution using systemd. 

If you want to run a Server on a **Raspberry Pi** (or a different armhf/arm64 debian-based device), you will need to download the [latest armhf .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless-armhf }}) or [latest arm64 .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless-arm64 }}) depending on your CPU - not the default `amd64` ones for use on Intel/AMD machines.

1. Download the [latest headless (amd64) .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }}) (or for Raspberry Pi etc. as above)
1. Make sure you have a current list of standard packages: `sudo apt update`
1. Install the Jamulus package for your architecture, for example: 

	`sudo apt install ./{{ site.download_file_names.deb-headless }}`

1. Enable the headless Server process: 

	`sudo systemctl enable jamulus-headless`

1. Add your desired [command line options](Running-a-Server#configuration) to the `ExecStart` line in the systemd service file (by default you will be running an Unregistered Server):

	`sudo systemctl edit --full jamulus-headless`

1. Reload the systemd files and restart the headless Server:

	`sudo systemctl daemon-reload && systemctl restart jamulus-headless` 

_To upgrade your Server, just repeat the steps above._

_To amend your Server configuration, just repeat the last two steps above._

---

## Server Types

Servers can be run in one of three modes (either at home or on a 3rd party host), depending on your needs.

### 1. Unregistered

This is the default when starting a Server for the first time. Unregistered Servers are not listed by Directories, so only musicians who know your Server's address to will be able to connect to it. This is useful because Jamulus does not let you control who can connect to a Server.

**For information about running an Unregistered Server [see this guide](Unregistered-Servers).**

<figure>
	<img src="{% include img/en-screenshots/diagram-unreg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Unregistered Server">
</figure>

### 2. Registered

In this mode your Server will be included in the server list supplied by a Directory. Jamulus has a list of built-in Directories that Clients can know, and if you register your Server with one of these, anyone can then discover and connect to it.

You can also have your Server listed by a Custom Directory (see below), if that better meets your requirements.  Clients can then only see your Server if they also know the Custom Directory.

Note that Directories can only register up to 150 Servers. If you see a message that says you cannot register your Server becuase the Directory is full, you can try registering on another. For a list of all public Directories and the Servers on them, see [explorer.jamulus.io](https://explorer.jamulus.io).

<figure>
	<img src="{% include img/en-screenshots/diagram-reg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Registered Server">
</figure>

### 3. Directory

If you want to run a number of Servers, possibly also behind a firewall or on a LAN, you may want to run your Server as a Directory. Examples include online events, music associations, sectional rehearsals or music lessons for schools.

For information, [see the Directories guide](Directories).

---

## Configuration options

Depending on your operating system and how you are running the server, you can set Server options and make them persistent between reloads as follows:

**Linux headless mode** (Debian/Ubuntu using systemd) 

Add your desired command line options to the `ExecStart` line in the systemd service file by running `sudo systemctl edit --full jamulus-headless`

**GUI mode** (all platforms)

Any settings made using the graphical interface will be stored in the `Jamulusserver.ini` file (do not attempt to edit this file by hand). However, some options are not available via the GUI and need to be set via the command line. For more information, see [Servers on the desktop](#servers-on-the-desktop)

---

### Server mode-related options

##### `-e or --directoryserver` 

Required for a [Registered Server](Running-a-Server#2-registered). Also required to run Jamulus as a [Directory](Directories). 

This option takes the format:

`--directoryserver hostname:port` where `hostname` is the Genre Directory host name and `port` is its port number.

To register with one of the Directories built into the Jamulus Client, replace `hostname:port` with one of the following options:

| Genre |   `hostname:port`  |
|-----------|------------------|
|**Any Genre 1** |`anygenre1.jamulus.io:22124`|
|**Any Genre 2** |`anygenre2.jamulus.io:22224`|
|**Any Genre 3** |`anygenre3.jamulus.io:22624`|
|**Genre Rock** |`rock.jamulus.io:22424`|
|**Genre Jazz** |`jazz.jamulus.io:22324`|
|**Genre Classical/Folk** |`classical.jamulus.io:22524`|
|**Genre Choral/Barbershop** |`choral.jamulus.io:22724`|


##### `-o or --serverinfo` 

When registering your Server with a Directory, this lets you supply a server name and location details so that users can then search for these values from their Client.

This option takes the format: 

`[name];[city];[country as two-letter ISO country code]`

See [two-letter ISO country codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)

Note that semicolon and newline characters are not allowed in `name` and `city` values.

##### `-L or --licence` 
Show an agreement window before users can connect

##### `-w or --welcomemessage` 
Welcome message on connect. Can be given as a string or filename, and can contain HTML.

##### `--serverpublicip` 
The public IP address of the Server if connecting to a Directory behind the same NAT. See [the Directories guide](Directories) for further information.

##### `--directoryfile` 
_Directories only:_ Remember registered Servers even if the Directory is restarted. See [the Directories guide](Directories) for further information.

##### `-f or --listfilter` 
_Directories only:_ Whitelist Servers registering on the Server. See [the Directories guide](Directories) for further information.

---

### General Server options
These options can be used regardless of which mode your server is running in (although some may not be relevant for Directories).

##### `-d or --discononquit` 
Normally, when a Server is stopped or restarted, any Clients that have not used their “Disconnect” buttons will re-establish connection when the Server comes back up again. Using this option forces Clients to manually re-establish their connections to the Server.

##### `-F or --fastupdate` 
Reduces latency if Clients connect with “Enable Small Network Buffers” option. Requires faster CPU to avoid dropouts, and more bandwidth to enabled Clients.

##### `-l or --log` 
Enable logging, set path and file name

##### `-m or --htmlstatus` 
Enable HTML status file, set path and file name

##### `-P or --delaypan` 
Start with delay panning enabled.This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal “volume” panning.

##### `-s` or `--server`
Start Jamulus in Server mode

##### `--serverbindip` 
Specify the IP address the Jamulus process will bind to

##### `-T or --multithreading` 
Use multithreading to make better use of multi-core CPUs to support more Clients

##### `-u or --numchannels` 
Maximum number of channels (Clients)

##### `-z or --startminimized` 
Start the graphicial user interface minimized

---

## Other options

{% include_relative Include-Shared-Commands.md %}

---

## Recording

##### `-R or --recording` 
Set server recording directory; Server will record when a session is active by default. 

**Note:** You will need to save recordings to a path _outside_ of the jamulus home Directory, or remove `ProtectHome=true` from your systemd unit file (be aware that doing so is however a potential security risk).

Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

Note that when your Server is recording, Clients will display a message that recording is on.

##### `--norecord` 
Set server not to record by default when recording is configured.


### Controlling Recording

Recording starts once the first person connects to the Server, and stops when the last person leaves. 

If the Server receives a SIGUSR1 signal during a recording, it will start a new recording in a new Directory. SIGUSR2 will toggle recording on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `jamulusTogglerec.service`).

For turning recording on or off (depending on the current state):

~~~
 [Unit]
 Description=Toggle recording state of Jamulus Server
 Requisite=Jamulus-Server

 [Service]
 Type=oneshot
 ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

For starting a new recording:

~~~
 [Unit]
 Description=Start a new recording on Jamulus Server
 Requisite=Jamulus-Server

 [Service]
 Type=oneshot
 ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note: The Jamulus service name in the `ExecStart` line needs to be the same as the `.service` file name you created when setting systemd to control your Jamulus Server. So in this example it would be `Jamulus-Server.service`_

Run `sudo systemctl daemon-reload` to register them for first use.

Now you can run these with the `systemctl` command, for example:

`sudo systemctl start jamulusTogglerec` 

You can see the result of these commands if you run `systemctl status jamulus`, or by viewing the logs.

---

## Servers on the desktop

Jamulus can be run in Server mode from the desktop. This gives you a graphical user interface to control most of the settings. To do this, first [install Jamulus](Getting-Started) for your platform, the do one of the following:

* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu. If you want the Server to start automatically on system start, enable the corresponding check box.

* **macOS users** - Double-click the "Jamulus Server" icon in Applications.

* **Linux users** - Launch the "Jamulus Server" shortcut. Or you can open a terminal window (`CTRL+ALT+t` on Debian and related distros), type `jamulus -s` and hit return.

While most common functions in Jamulus can be set using the GUI, others can only be set using options given in a terminal window when the server is launched. Exactly how you do this will depend on your operating system.

For example on Windows, to use a specific settings file, right-click on the Jamulus shortcut and choose **Properties** > **Target**. Add the necessary arguments to Jamulus.exe:

 `"C:\Program Files\Jamulus\Jamulus.exe" --serverbindip 192.168.0.100`

For macOS, start a Terminal window and run Jamulus with the desired options like this:

 `/Applications/Jamulus.app/Contents/MacOS/Jamulus --serverbindip 192.168.0.100`

**Note** Command line options will set the Server’s defaults at startup. You can override them with their corresponding GUI controls while the Server is running.

### The Server status icon

When a Server is running in GUI mode, the operating system will show an icon in the system tray or status area that indicates whether the Server is active:  

<figure><img src="{% include img/en-screenshots/server-inactive.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is empty

<figure><img src="{% include img/en-screenshots/server-active.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is occupied

---

## Backing up the Server

{% include_relative Include-Backing-Up.md %}

- Headless Servers do not use `.ini` files. All configuration is given as command line options. If you are running a server in GUI mode, it will store its configuration (after reading any command line options on start) in the file `Jamululsserver.ini`

## Troubleshooting

If you are having other problems, [see this guide](Server-Troubleshooting).
