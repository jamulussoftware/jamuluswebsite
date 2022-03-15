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

The short answer is **no**. For various reasons, you should try to use Servers listed by the built in Directories, at least at first while getting your sound set up with the Jamulus Client. You may also be able to use a Server hosted by a third party. Doing so will save you the trouble of setting one up yourself.  

Note that you can have a "private" session with other people on a Server by simply soloing each other. You will then not be able to hear anyone else if they enter your Server (note that this does not stop them from hearing you, using the chat function, or seeing your profile information).

If you decide you cannot use any of the Servers listed by the built in Directories, you may be able to use a Server (either Registered in a Custom Directory, or Unregistered - see [Server Types](#server-types)) hosted by a third party. Doing so will save you the trouble of setting one up yourself.

While setting up a Server isn't difficult, it's a good idea to read the following backround information to avoid some problems:

### Speed and latency

Many people attribute problems to the Server that are in fact problems with the _Client_. Much depends on the Clients' hard/software setup, the networks that _they_ are on, and whether they are sticking to [Rule Number One](Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

**_The capability of the Server itself (and the network it's on) is NOT the main determinant of the quality of a Jamulus session!_**

If you plan to be playing regularly with the same people, **you are strongly advised** to first make sure that each member of the group is set up to use Jamulus properly. Do this by finding a Public Server with a reasonable ping time for all of you (20 ms or less perhaps), all connect to that and work to fix any individual issues (verifying that they can [follow Rule Number One](Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together) in particular). Use the solo technique above to prevent being interrupted if needed.

Once any issues with musicians have been solved in this way, you can then investigate hosting your own Server either at home or on a cloud host such as Amazon, which may result in better latency than Servers run at home.

### Bandwidth – do you have enough?

Unless you plan on hosting more than about 5 players on a slower-speed home connection (eg 10 Mbit/s down and 1 Mbit/s up), then you are unlikely to run out of bandwidth. You can read more about network requirements at [different quality settings here](Server-Bandwidth).

### In general

- Consider using a cloud host to get better ping times if you're having problems

- Any Server should have at least 1.6GHz CPU frequency and 1GB RAM

- Running a Server may require you to adjust any firewalls running on or outside of your machine or cloud host.

- Running an Uregistered Server at home will require you to [port forward](#running-an-unregistered-server) on your router. When running a Registered Server, port forwarding should not be necessary in most cases, but it's advisable to do so because some networks may not work properly with Jamulus in its default mode.

- Jamulus only has limited IPv6 support which needs to be enabled with a command line argument on the Client and Server. There are plans to expand IPv6 support.

# Server Types

You can run your Server in different ways (either at home or on a 3rd party host):

### 1. Registered

Your Server will be listed in a Directory. By default, Jamulus has a list of Public Directories that Clients can connect to. If you register with one of these, anyone can then discover and connect to your Server. You can also have your Server listed on a Custom Directory, if that better meets your needs. 

<figure>
	<img src="{% include img/en-screenshots/diagram-reg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Registered Server">
<figcaption>How Registered Servers work</figcaption>
</figure>

### 2. Unregistered

This is the default when starting a Server for the first time. Unregistered Servers are not listed by Directories, so only musicians who know your Server's address to will be able to connect to it. This is useful because Jamulus does not let you control who can connect to a Server.

<figure>
	<img src="{% include img/en-screenshots/diagram-unreg-server.inc %}" loading="lazy" alt="Diagram of connections between Clients within a Jamulus Unregistered Server">
	<figcaption>How Unregistered Servers work</figcaption>
</figure>

### 3. Custom Directory

If you want to run a number of Servers, possibly also behind a firewall or on a LAN, you may want to run your Server as a Directory. Examples include online events, music associations, sectional rehearsals or music lessons for schools.

To run a Custom Directory [read this guide](Custom-Directories)


# Installing and running a Server 

Most people run Jamulus as a "pure" Server on **hardware without audio** (e.g. on a 3rd party/cloud host) running Linux. The following guide assumes you are familiar with the command line and Debian/Ubuntu or similar distribution using systemd. To run a server on Windows or on the desktop with a graphical user interface, [see this section](#servers-on-the-desktop).  

If you want to run a Server on a Raspberry Pi, you will need to [compile from source](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md). See also this [guide for Raspberry Pi](/kb/2020/03/28/Server-Rpi.html) maintained by Jamulus user fredsiva. 

### Installation

1. Download the [latest headless .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }})
1. Update apt to make sure you have a current list of standard packages: `sudo apt update`
1. Install the Jamulus package: `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Enable the headless Server process via systemd: `sudo systemctl enable jamulus-headless`
1. Add your desired [command line options](Running-a-Server#command-line-options) to the `ExecStart` line in the systemd service file in `/lib/systemd/system/jamulus-headless.service` (By default you will be running an Unregistered Server).
1. Reload the systemd files `sudo systemctl daemon-reload` and restart the headless Server: `sudo systemctl restart jamulus-headless`
1. Check all is well with `systemctl status jamulus-headless` (hit `q` to get back to the command prompt).

### Configuration

You can control Jamulus with the `systemctl` command. For example, to stop the Server cleanly:

`sudo systemctl stop jamulus-headless`

#### Running in Registered mode

The following minimum setup is required to [run a Registered Server](Running-a-Server#server-types):

~~~
jamulus --nogui --server \
        --directoryserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Note**: Semicolon and newline characters are not allowed in `yourServerName` and `yourCity` within the `--serverinfo` argument

To register with one of the Directories built into the Jamulus Client, replace `genreServer:port` in the example above with one of the following options:


| Genre |   Server Address           |
|-----------|------------------|
|**Any Genre 1** |`anygenre1.jamulus.io:22124`|
|**Any Genre 2** |`anygenre2.jamulus.io:22224`|
|**Any Genre 3** |`anygenre3.jamulus.io:22624`|
|**Genre Rock** |`rock.jamulus.io:22424`|
|**Genre Jazz** |`jazz.jamulus.io:22324`|
|**Genre Classical/Folk** |`classical.jamulus.io:22524`|
|**Genre Choral/Barbershop** |`choral.jamulus.io:22724`|

You can also specify a [Custom Directory](#3-custom-directory) in the same way from the command line, providing the Server Address in the same format.

#### Running as a Directory

If you wish to run a [Custom Directory](Running-a-Server#3-custom-directory) please see [this guide](Custom-Directories).

### Maintenance

#### Upgrading

To upgrade your Server to a newer version, simply download a new .deb and [re-install as step 3](#installation).

#### Viewing The Logs

Jamulus will log to the system log file if you left the `StandardOutput=journal` setting in the unit file. 

To view the log, use `journalctl` (to exit press Ctrl-C). For example, to read the system log file, filtered for the Jamulus service:

`journalctl -f -u jamulus-headless`

#### Recording

When using the recording function with the `-R` command line option, if the Server receives a SIGUSR1 signal during a recording, it will start a new recording in a new Directory. SIGUSR2 will toggle recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `newRecording-Jamulus-server.service`).

**Note:** You will need to save recordings to a path _outside_ of the jamulus home Directory, or remove `ProtectHome=true` from your systemd unit file (be aware that doing so is however a potential security risk).

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

`sudo systemctl start jamulusTogglerec` (assuming you named your unit file `jamulusTogglerec.service`)

You can see the result of these commands if you run `systemctl status jamulus`, or by viewing the logs.

### Making a Server status page

With the `-m` command line argument, Server statistics can be generated to be put on a web page.

Here is an example php script using the Server status file to display the current Server status on a html page (assuming the following command line argument to be used: `-m /var/www/stat1.dat`):

~~~
<?php
function loadserverstat ( $statfilename )
{
   $datei = fopen ( $statfilename, "r" );
   while ( !feof ( $datei ) )
   {
          $buffer = fgets ( $datei, 4096 );
          echo $buffer;
   }
   fclose($datei);
}
?>
<?php loadserverstat ( "stat1.dat" ); ?>
~~~


# Servers on the desktop

Jamulus can be configured to run in Server mode on the desktop. This gives you a graphical user interface to control most of the settings. 

* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu.

* **macOS users** - Double-click the "Jamulus Server" icon in Applications (assuming you put the files from the install there as per [these instructions](Installation-for-Macintosh)).

* **Linux users** - Launch the "Jamulus Server" shortcut. Or you can open a terminal window (`CTRL+ALT+t` on Debian and related distros), type `jamulus -s` and hit return. _(To run a headless Server [read this guide](#installing-and-running-a-server))_


## Server Setup

<figure><img src="{% include img/en-screenshots/server-window-setup.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of the Jamulus Server setup window"></figure>

### The Directory list

**None**: By default, you will not be connected to a Directory and will be running in unregistered mode. [Read these instructions](#running-an-unregistered-server) to have other people connect to your Server in this mode.

**Genre**: To allow other people to see your Server on one of the built-in Public Directories, select your desired genre Directory. You should see a confirmation message saying whether your Server has registered successfully. If not, and you leave your Server running, it will keep trying to register until a free slot becomes available.  

**Custom**: This allows you to specify a custom directory on which to be listed. See the "Options" tab for the Custom Directory server address you want to use.

To run your Server _as_ a Directory, you need to set the Custom Directory server address as `localhost` or `127.0.0.1` and set the "Genre" to "Custom". [Read this guide](Custom-Directories) for further details.

### My Server Info

When running as a registered Server this displays the Server's name, city and country so that other users can easily identify it in the Directory listing.

### Chat Welcome Message

The text entered here appears to all users when they join the Server (the chat window will open automatically for them). HTML is also supported.

## Options

<figure><img src="{% include img/en-screenshots/server-window-options.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of Jamulus Server window options"></figure>

### Recording Directory

This sets the path to where the Server's recordings will be stored. With this path set, the "Enable Jam Recoder" function in the Server Setup tab will make recording start once the first person connects to the Server, and stops when the last person leaves. Use the "New Recording" button to create a new sub-directory in which the recordings will be stored from then on. Note that Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

**Note**: When your Server is recording, Clients will display a message that recording is on.

### Directory Server Address

Leave this field empty unless you need to list your Server on a [Custom Directory](#3-custom-directory) or run a Directory.

### Server List Filename

Leave this field empty unless you need to run your Server as a [Directory](#3-custom-directory). When in use, this holds the list of registered Servers whilst restarting the Directory. This prevents the server list appearing "empty" until the Servers re-register.

### Delay panning

This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal "volume" panning. 

### Start Minimised

**Windows users** - If you want the Server to start automatically on system start, enable the corresponding check box.

### Server status icon

When the Server is running, the operating system will show an icon in the system tray or status area to represent whether the Server is active:  

<figure><img src="{% include img/en-screenshots/server-inactive.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is empty

<figure><img src="{% include img/en-screenshots/server-active.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is occupied


# Running an Unregistered Server

It is highly recommended to test your Server on a **Public Directory** first so as to narrow down any subsequent problems in unregistered mode.

### Port forwarding

If you are running a Server on your home network, people from outside will not be able to see things inside it. So if you want to operate a Jamulus Server, you need to open a hole in your router's firewall to let Jamulus Clients connect to it.

**The default port for the current version of Jamulus is UDP (not TCP) port 22124.**

The exact setup of port forwarding differs for every router. For help see [portforward.com](https://portforward.com).

Once you have your router set up, you can get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip). Give this address to your friends so they can connect to your Server (_but see also the note on dynamic DNS below_). You yourself should connect using the local network (LAN) address of the machine the Server is running on. If you are running a Client on the same machine as your Server, that would be `localhost` or `127.0.0.1`. 

## Dynamic DNS and why you will probably need it

Most domestic Internet connections will change their IP address after a period (hours, days or weeks). To make it easier for people to connect to you, you may therefore also want set up a dynamic DNS address. You can do this on [the machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) that you are running the Jamulus Server on, or preferably your router [may support it](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Note also that your home router may also change the IP address of the machine that you are running your Server on. In which case you may need to give that machine a static IP in the router's DHCP configuration.

# Backing up the Server

_Note that headless Servers do not use `.ini` files. All configuration is given as command line options._

{% include_relative Include-Backing-Up.md %}

# Command line options

Most common functions in Jamulus can be set using the GUI, but these and others can also be set using options given in a terminal window. Exactly how you do this will depend on your operating system.

For example on Windows, to use a specific settings file, right-click on the Jamulus shortcut and choose "Properties" > Target. Add the necessary arguments to Jamulus.exe:

```shell
 "C:\Program Files\Jamulus\Jamulus.exe" --serverbindip 192.168.0.100
```

For macOS, start a Terminal window and run Jamulus with the desired options like this:

```shell
 /Applications/Jamulus.app/Contents/MacOS/Jamulus --serverbindip 192.168.0.100
```

**Note**: Command line options will set the Server's defaults at startup. You can override them with their corresponding GUI controls while the Server is running.

{% include_relative Include-Server-Commands.md %}

{% include_relative Include-Shared-Commands.md %}


# Troubleshooting

Various problems can arise when setting up Servers, and we generally encourage people to use other people's (public) Servers at first to isolate any issues that may in fact be due to Client configuration.

If you are having problems, [see this guide](Server-Troubleshooting).
