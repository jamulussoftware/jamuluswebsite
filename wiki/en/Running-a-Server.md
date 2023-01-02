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

**No**. You don't need to run a Server. You can use the Servers listed by the built-in Directories and use Jamulus without running a Server yourself. You can also use an unlisted server if you know its internet address. Or you can use a third party hosting service such as [melomax](https://melomax.live/jamulus-hosting/) or [KOORD](https://koord.live/). There's probably a Server nearby that you and your friends can use at low enough latency for most needs.

Using a public server might introduce you to strangers. If you want an undisturbed session, you can use the soloing technique described on the [Tips and Tricks page](Tips-Tricks-More#have-an-undisturbed-session-on-any-server). You won't hear strangers who connect to the Server, but they can hear you if they wish.

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
* You must set up port forwarding on your router to run an [Unregistered Server](Unregistered-Servers) at home. This should not be necessary when running a Registered Server in most cases. However, some home networks can require port forwarding for a Registered Server.
* Jamulus offers limited IPv6 support that you can turn on for a Client or Server from the command line.

---

## Installation

Most people run Jamulus on a 3rd party/cloud host as a "headless" Server (no video display or keyboard) on **hardware without audio** running Linux. You can also run a Server in a [**desktop environment**](#servers-on-the-desktop).

To run a headless server on Linux, the following steps assume you are familiar with the command line and Debian/Ubuntu or similar distribution that uses systemd. 

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

## Server Modes

Servers can be run in one of three modes (either at home or on a 3rd party host), depending on your needs.

### Unregistered mode

This is the default when starting a Server for the first time. Unregistered Servers are not listed by Directories, so only musicians who know your Server's address can connect to it. 

**For information about running an Unregistered Server [see this guide](Unregistered-Servers).**

<figure>
	<img src="{% include img/en-screenshots/diagram-unreg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Unregistered Server">
</figure>

### Registered mode

In this mode your Server will appear in the server list supplied by a Directory. Jamulus Clients come with a list of Directories built-in. If you register your Server with one of these, anyone can discover and connect to it.

Alternatively, you can list your Server on a Custom Directory (see below).  Clients will only find your Server if they enter the Custom Directory's internet address.

Note that Directories can only register up to 150 Servers. If you see a message that says you cannot register your Server because the Directory is full, you can try registering on a different Directory. 

<figure>
	<img src="{% include img/en-screenshots/diagram-reg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Registered Server">
</figure>

### Directory mode

If you want to run a number of Servers, possibly also behind a firewall or on a LAN, you may want to run your Server as a Directory. Examples include online events, music associations, sectional rehearsals or music lessons for schools.

For information, [see the Directories guide](Directories).

---

## Configuration options

Depending on your operating system and how you are running the server, you can set Server options and make them persistent between reloads by following these steps:

**For Linux headless** (Debian/Ubuntu using systemd) 

Add your desired command line options to the `ExecStart` line in the systemd service file by running `sudo systemctl edit --full jamulus-headless` (You will need to reload or restart for the changes to take effect. See [Installation](#installation))

**For the GUI** (all platforms)

Any settings made using the graphical interface will be stored in the `Jamulusserver.ini` file. (Do **not** edit this file by hand!) However, some options are not available in the GUI and need to be set using the command line. For more information, see [Servers on the desktop](#servers-on-the-desktop)

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

**Note:** Semicolon and newline characters are not allowed in `name` and `city` values.

##### `-L or --licence` 
Show an agreement window before users can connect.  The text of the agreement to be shown should be supplied as the `--welcomemessage` (see below).

##### `-w or --welcomemessage` 
A "welcome message" to display in the Client chat window on connect. Can be given as a string or filename, and can contain HTML.

##### `--serverpublicip` 
The public IP address of the Server if connecting to a Directory behind the same NAT. See [the Directories guide](Directories) for further information.

##### `--directoryfile` 
_Directories only:_ Remember registered Servers even if the Directory is restarted. See [the Directories guide](Directories) for further information.

##### `-f or --listfilter` 
_Directories only:_ Allowlist Servers registering on the Server. See [the Directories guide](Directories) for further information.

---

### General Server options
These options can be used regardless of which mode your server is running in (although some may not be relevant for Directories).

##### `-d or --discononquit` 
Normally, when a Server is stopped or restarted, any Clients that have not pressed their **Disconnect** buttons will automatically re-establish the connection when the Server returns. This option forces Clients to manually re-establish their connections to the Server in this scenario.

##### `-F or --fastupdate` 
Reduces latency if Clients connect with **Enable Small Network Buffers** option. Requires faster CPU to avoid dropouts, and more bandwidth to enabled Clients.

##### `-l or --log` 
Enable logging, set path and file name

##### `-m or --htmlstatus` 
Enable HTML status file, set path and file name

**Note:** This feature is deprecated, and may disappear in a future release.

##### `-P or --delaypan` 
Start with delay panning enabled. This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal “volume” panning.

##### `-s` or `--server`
Start Jamulus in Server mode

##### `--serverbindip` 
Specify the IP address the Jamulus process will bind to. 

Normally, Jamulus will listen on all IP addresses on the host machine.  Where the host has multiple network addresses, this option allows one of the addresses to be chosen.

##### `-T or --multithreading` 
Use multithreading to make better use of multi-core CPUs. This setting may help the Server support more Clients. See also `--numchannels`

##### `-u or --numchannels` 
Maximum number of channels (Clients)

##### `-z or --startminimized` 
Start the Jamulus Server graphical user interface in the minimized window state.

### Other options

{% include_relative Include-Shared-Commands.md %}

---

## Recording

##### `-R or --recording` 
Set server recording directory. By default, the Server will record when a session is active. 

**Note:** You will need to save recordings to a path _outside_ of the jamulus home directory, or remove `ProtectHome=true` from your systemd unit file, but be aware that doing could be a security risk.

Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

**Note:** When your Server is recording, Clients display a red banner message that the session is being recorded.

##### `--norecord` 
Set server not to record by default when recording is configured.


### Controlling Recording

Recording starts once the first person connects to the Server, and stops when the last person leaves. 

If the Server receives a SIGUSR1 signal during a recording, it will start a new recording in a new directory. SIGUSR2 will toggle recording on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `jamulusTogglerec.service`).

To turn recording on or off (depending on the current state):

~~~
 [Unit]
 Description=Toggle recording state of Jamulus Server
 Requisite=Jamulus-Server

 [Service]
 Type=oneshot
 ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

To start a new recording:

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

Jamulus can run in Server mode in the graphical environment of your home computer. This gives you a graphical user interface to control most of the settings. To do this, first [install Jamulus](Getting-Started) for your platform, the do one of the following:

* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu. If you want the Server to start automatically when you start Windows, check the box for this option.

* **macOS users** - Double-click the "Jamulus Server" icon in Applications.

* **Linux users** - Launch the "Jamulus Server" shortcut. Or you can open a terminal window (`CTRL+ALT+t` on Debian and related distros), type `jamulus -s` and hit return.

While most common functions in Jamulus can be set using the GUI, others can only be set using options given in a terminal window when the server is launched. Exactly how you do this will depend on your operating system.

For example on Windows, to use a specific settings file, right-click on the Jamulus shortcut and choose **Properties** > **Target**. Add the necessary arguments to Jamulus.exe:

 `"C:\Program Files\Jamulus\Jamulus.exe" --serverbindip 192.168.0.100`

For macOS, start a Terminal window and run Jamulus with the desired options like this:

 `/Applications/Jamulus.app/Contents/MacOS/Jamulus --serverbindip 192.168.0.100`

**Note** Command line options will set the Server’s defaults at startup. You can override them while the Server is running using their corresponding GUI controls.

### The Server status icon

When a Server is running in GUI mode, the operating system will show an icon in the system tray or status area that indicates whether the Server has connections:  

<figure><img src="{% include img/en-screenshots/server-inactive.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is empty

<figure><img src="{% include img/en-screenshots/server-active.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is occupied

---

## Backing up the Server

{% include_relative Include-Backing-Up.md %}

- Headless Servers do not use `.ini` files. All configuration is given as command line options. If you are running a server in GUI mode, after reading any command line options on start, it will store its configuration in the `Jamululsserver.ini` file.

## Troubleshooting

If you are having other problems, [see this guide](Server-Troubleshooting).
