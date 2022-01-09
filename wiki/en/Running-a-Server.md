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



## Do I need to run a server?

The short answer is **no**. For various reasons, you should try to use other people's servers, at least at first while getting your sound set up with the Jamulus client.

Note that you can have a "private" session with other people on a Server by simply soloing each other. You will then not be able to hear anyone else if they enter your server (note that this does not stop them from using the chat function, or seeing your profile information).

If you do decide to run a server, please read the following. Setting up a server is easy, however it is better to know the theory first:

### Speed and latency

Many people attribute problems to the server that are in fact problems with the _client_. Much depends on the clients' hard/software setup, the networks that _they_ are on, and whether they are sticking to [Rule Number One](Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

**_The capability of the server itself (and the network it's on) is NOT the main determinant of the quality of a Jamulus session!_**

If you plan to be playing regularly with the same people, **you are strongly advised** to first make sure that each member of the group is set up to use Jamulus properly. Do this by finding a Public Server with a reasonable ping time for all of you (20 ms or less perhaps), all connect to that and work to fix any individual issues (verifying that they can [follow Rule Number One](Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together) in particular). Use the solo technique above to prevent being interrupted if needed.

Once any issues with musicians have been solved in this way, you can then investigate hosting your own server either at home or on a cloud host such as Amazon, which may result in better latency than servers run at home. For example, [see this guide](https://www.facebook.com/notes/jamulus-worldjam/howto-idiots-guide-to-installing-or-upgrading-a-jamulus-server-on-amazon-aws-lig/818091045662521/) for using AWS Lightsail, by Jamulus user [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) (_Facebook_)

### Bandwidth – do you have enough?

Unless you plan on hosting more than about 5 players on a slower-speed home connection (eg 10 Mbit/s down and 1 Mbit/s up), then you are unlikely to run out of bandwidth. You can read more about network requirements at different quality settings later in this document.

### In general

- Consider using a cloud host to get better ping times if you're having problems

- Any server should have at least 1.6GHz CPU frequency and 1GB RAM

- Running a server may require you to adjust any firewalls running on or outside of your machine or cloud host.

- Running an Uregistered Server at home will require you to [port forward](#running-an-unregistered-server) on your router. When running a Registered Server, port forwarding should not be necessary in most cases, but it's advisable to do so because some networks may not work properly with Jamulus in its default mode.

- Jamulus only has limited IPv6 support which needs to be enabled with a command line argument on the client and server. There are plans to expand IPv6 support.

# Server Types

You can run your server in different ways (either at home or on a 3rd party host):

### 1. Registered 

Your server will be listed in a Directory. By default, Jamulus has a list of Public Directories that clients can connect to. If you register with one of these, anyone can then discover and connect to your server. 

<figure>
	<img src="{% include img/en-screenshots/diagram-reg-server.inc %}" loading="lazy" alt="Diagram of connections between clients within a Jamulus Registered Server">
<figcaption>How Registered Servers work</figcaption>
</figure>

### 2. Unregistered 

This is the default when starting a server for the first time. Unregistered Servers are not listed by Directories, so only musicians who know your server's address to will be able to connect to it. This is useful because Jamulus does not let you control who can connect to a server.

<figure>
	<img src="{% include img/en-screenshots/diagram-unreg-server.inc %}" loading="lazy" alt="Diagram of connections between clients within a Jamulus Unregistered Server">
	<figcaption>How Unregistered Servers work</figcaption>
</figure>

### 3. Custom Directory

If you want to run a number of Servers, possibly also behind a firewall or on a LAN, you may want to run your server as a Directory. Examples include online events, music associations, sectional rehearsals or music lessons for schools.

To view servers listed by a Custom Directory, musicians must enter its address in their client’s "Custom Directory Server" settings field.  They will then see a Connection Setup list which is generated by your Directory. Custom Directories otherwise work for clients in the same way as Public Directories.

Up to 150 servers can then register with your Directory by setting your Directory address in their `--directoryserver` option at startup.

To run a server as a Directory, it should be configured with `--directoryserver` (that is, making itself the Directory to query for servers). When running a server with the GUI, select "Custom" from the Directory drop-down list. 

#### Points to note about Directories

- If you want to control which servers can register with your Directory, you can enable a whitelist with the `--listfilter` command line option. See the section on command line options later in this document.

- When running a Directory behind a NAT firewall on a private network, use the `--serverpublicip` option to specify the public IP address of the server(s) being listed by your Directory if those servers are on the same LAN / with the same public IP as the Directory. This is necessary to allow clients on the public Internet to connect to them via NAT. Note that for the servers using this option, you will still need proper port forwarding in your router/firewall.


# Bandwidth use

## Audio bandwidth

The audio settings have an impact on the required network bandwidth. The table below summarises network requirements with respect to the configuration of:
* Channels : stereo/mono
* Quality : high/medium/low
* Audio buffer duration : 2.67 ms, 5.33 ms, 10.67 ms, 21.33 ms

With the following units
* ms : milliseconds
* Kbit/s : Kilo-bits per second (Reminder : 1 Mbit/s = 1024 Kbit/s, 1 KByte/s = 8 Kbit/s)
* Mbit/s : Mega-bits per second

| Channels  | Quality | Bandwidth (for buffer : 2.67 ms) |  Bandwidth (for buffer : 5.33 ms) | Bandwidth (for buffer : 10.67 ms) | Bandwidth (for buffer : 21.33 ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Stereo    | High   | 894 Kbit/s | 657 Kbit/s | 541 Kbit/s | 483 Kbit/s |
| Stereo    | Medium | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s |
| Stereo    | Low    | 606 Kbit/s | 372 Kbit/s | 256 Kbit/s | 198 Kbit/s |
| Mono      | High   | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s 8|
| Mono      | Medium | 594 Kbit/s | 366 Kbit/s | 250 Kbit/s | 192 Kbit/s |
| Mono      | Low    | 534 Kbit/s | 306 Kbit/s | 190 Kbit/s | 132 Kbit/s |

## Network bandwidth

There is one upstream (musician sending to the server) and one downstream (server sending back the mix to the musician)
<figure>
	<img src="{% include img/en-screenshots/bandwidth-diagram.inc %}" loading="lazy" alt="A diagram of Jamulus network bandwidths from different audio qualities ranging from low to high">
<figcaption>Calculate bandwidth use </figcaption>
</figure>

Note also that mean ADSL2 transfer rate is 10 Mbit/s for downstream and 1 Mbit/s for upstream. The actual performance depends on distance to the provider, which may [theoretically range from 24 Mbit/s at 0.3 km to 1.5 Mbit/s at 5.2 km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) for download rate.



# Starting a server


* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu.

* **macOS users** - Double-click the "Jamulus Server" icon in Applications (assuming you put the files from the install there as per [these instructions](Installation-for-Macintosh)).

* **Linux users** - Open a terminal window (`CTRL+ALT+t` on Ubuntu and related distros) and type `jamulus -s`. Hit return and you should see the server control window. You can stop the server by closing the server window, or by using `CTRL+C` in the terminal. _(To run a headless server [read this guide](Server-Linux))_


## Server Setup

<figure><img src="{% include img/en-screenshots/server-window-setup.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of the Jamulus server setup window"></figure>

### The Directory list 

**None**: By default, you will not be connected to a directory and will be running in unregistered mode. [Read these instructions](#running-an-unregistered-server) to have other people connect to your server in this mode.

**Genre**: To allow other people to see your server on one of the built-in public directories, select your desired genre directory. You should see a confirmation message saying whether your server has registered successfully. If not, and you leave your server running, it will keep trying to register until a free slot becomes available.  

**Custom**: This sets your server to be a directory on which other servers can be listed. Note that when setting this mode, you may want also to specify the location of server list file (See "Options" below) unless you want to disconnect all listed servers when restarting Jamulus.

### My Server Info

When running as a registered server this displays the server's name, city and country so that other users can easily identify it in the directory listing.

### Chat Welcome Message

The text entered here appears to all users when they join the server (the chat window will open automatically for them).

## Options


<figure><img src="{% include img/en-screenshots/server-window-options.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of Jamulus server window options"></figure>

### Recording Directory

This sets the path to where server's recording will be stored. With this path set, the "Enable Jam Recoder" function in the Server Setup tab will make recording start once the first person connects to the server, and stops when the last person leaves. Use the "New Recording" button to create a new sub-directory in which the recordings will be stored from then on. Note that Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

**Note**: When your server is recording, clients will display a message that recording is on.

### Custom Directory Server Address

Leave this field empty unless you need to list your server on a [Custom Directory](#3-directory)

### Server List Filename

If you are running your server as a Directory and need to restart it for any reason (for example when rebooting the host), servers connected to it will be disconnected until they re-register. This does not mean that clients connected to those servers will be disconnected, but does mean that new clients will be not able to see servers listed by your directory until those servers reconnect. To enable the list of registered servers to persist between restarts, specify the location and name of a file that the directory can read and write to here.  

### Delay panning

This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal "volume" panning. 

### Start Minimised

**Windows users** - If you want the server to start automatically on system start, enable the corresponding check box.



# Running an Unregistered Server

It is highly recommended to test your server on a **Public Directory** first so as to narrow down any subsequent problems in unregistered mode.

### Port forwarding 

If you are running a server on your home network, people from outside will not be able to see things inside it. So if you want to operate a Jamulus server, you need to open a hole in your router to let Jamulus clients connect to it.

**The default port for the current version of Jamulus is UDP (not TCP) port 22124.**

The exact setup of port forwarding differs for every router. For help see [portforward.com](https://portforward.com).

Once you have your router set up, you can get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip). Give this address to your friends so they can connect to your server (_but see also the note on dynamic DNS below_). You yourself have to connect to your own computer instead, since your computer runs the server. Therefore **only you** need to connect to `127.0.0.1`.

## Dynamic DNS and why you will probably need it

Most domestic Internet connections will change their IP address after a period (hours, days or weeks). To make it easier for people to connect to you, you may therefore also want set up a dynamic DNS address. You can do this on [the machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) that you are running the Jamulus server on, or preferably your router [may support it](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Note also that your home router may also change the IP address of the machine that you are running your server on. In which case you may need either to give that machine a static IP in the router's DHCP configuration, or simply port forward to all the addresses in your LAN.

# Running a headless Linux server

Those wishing to run a server on a Linux cloud or other third party hosting platform should [read this guide](Server-Linux).

# Backing up the server

_Note that headless servers do not use `.ini` files. All configuration is given as command line options._

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

**Note**: Command line options will set the server's defaults at startup. You can override them with their corresponding GUI controls while the server is running.

{% include_relative Include-Server-Commands.md %}

{% include_relative Include-Shared-Commands.md %}

{% include_relative Include-QOS-Windows.md %}


# Troubleshooting

Various problems can arise when setting up servers, and we generally ecourage people to use other people's (public) servers at first to isolate any issues that may in fact be due to client configuration.

If you are having problems, [see this guide](Server-Troubleshooting).
