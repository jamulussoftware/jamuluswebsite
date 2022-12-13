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

**No**. You can use the Servers listed by the built in Directories and use Jamulus without running a Server or choose a third party hosting service. If you just want an undisturbed session, use the [soloing technique described on the Tips and Tricks page](Tips-Tricks-More#have-an-undisturbed-session-on-any-server). If you decide you cannot use any of the Servers listed by the built in Directories, you may be able to use a Server (either Registered in a Custom Directory, or Unregistered - see [Server Types](#server-types)) hosted by a third party. Doing so will save you the trouble of setting one up yourself.

## Basic requirements

While setting up a Server isn't difficult, it's a good idea to read the following background information to avoid some problems:

### Speed and latency

**_The capability of the Server itself (and the network it's on) is NOT the main determinant of the quality of a Jamulus session!_**

Usually, problems are on the _Client_ side and should be fixed there. Have a look at the [Troubleshooting page](/wiki/Client-Troubleshooting) if needed.

However, various problems can also arise when setting up Servers - especially when run on a low-bandwidth home connection. It's usually fine to have less than 5 players on a slower-speed home connection (eg 10 Mbit/s down and 1 Mbit/s up). You can read more about network requirements at [different quality settings here](Server-Bandwidth).

Consider using a cloud host, not your home internet connection, to get better ping times if you're having problems.


### General notes

* Any Server should have at least 1.6GHz CPU frequency and 1GB RAM
* Running a Server may require you to adjust any firewalls running on or outside of your machine or cloud host.
* Running an Unregistered Server at home will require you to [port forward](#port-forwarding) on your router. When running a Registered Server, port forwarding should not be necessary in most cases, but it's advisable to do so because some networks may not work properly with Jamulus in its default mode.
* Jamulus only has limited IPv6 support which needs to be enabled with a command line argument on the Client and Server. (There are plans to expand IPv6 support.)

## Server Types

You can run your Server in different ways (either at home or on a 3rd party host):

### 1. Registered

Your Server will be listed in a Directory. By default, Jamulus has a list of built-in Directories that Clients can connect to. If you register with one of these, anyone can then discover and connect to your Server. You can also have your Server listed on a Custom Directory, if that better meets your needs.

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

If you are running an unregistered server behind a home internet connection, you might need to enable [port forwarding](#port-forwarding) as described below.

### 3. Directory

If you want to run a number of Servers, possibly also behind a firewall or on a LAN, you may want to run your Server as a Directory. Examples include online events, music associations, sectional rehearsals or music lessons for schools.

To run a Directory [read this guide](Directories)


## Installation and Configuration

Most people run Jamulus as a "pure" Server on **hardware without audio** (e.g. on a 3rd party/cloud host) running Linux. The following steps assume you are familiar with the command line and Debian/Ubuntu or similar distribution using systemd. To run a server on Windows or on the desktop with a graphical user interface, [see this section](#servers-on-the-desktop).  

If you want to run a Server on a Raspberry Pi (or a different armhf/arm64 debian-based device), you will need to download the `.deb` files for 32 bit `armhf` or 64 bit `arm64`, not the default `amd64` ones you'd use on an Intel/AMD based machine.


### Installation

1. Download the [latest headless (amd64) .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }}) or, if you use a Raspberry Pi etc. download the [latest armhf .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless-armhf }}) or the [latest arm64 .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless-arm64 }})
1. Update apt to make sure you have a current list of standard packages: `sudo apt update`
1. Install the Jamulus package: `sudo apt install ./{{ site.download_file_names.deb-headless }}` or for RasPi etc. armhf: `sudo apt install ./{{ site.download_file_names.deb-headless-armhf }}`; arm64: `sudo apt install ./{{ site.download_file_names.deb-headless-arm64 }}`
1. Enable the headless Server process via systemd: `sudo systemctl enable jamulus-headless`
1. Add your desired [command line options](Running-a-Server#command-line-options) to the `ExecStart` line in the systemd service file by running `sudo systemctl edit --full jamulus-headless` (By default you will be running an Unregistered Server).
1. Reload the systemd files `sudo systemctl daemon-reload` and restart the headless Server: `sudo systemctl restart jamulus-headless`
1. Check all is well with `systemctl status jamulus-headless` (hit `q` to get back to the command prompt).

You can control Jamulus with the `systemctl` command. For example, to stop the Server cleanly:

`sudo systemctl stop jamulus-headless`

_To upgrade your Server, just repeat the steps above._

### Configuration

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

You can also specify a [Directory](#3-directory) in the same way from the command line, providing the Server Address in the same format.

#### Running as a Directory

If you wish to run a [Directory](Running-a-Server#3-directory) please see [this guide](Directories).

### Maintenance

#### Viewing The Logs

Jamulus will log to the system log file if you left the `StandardOutput=journal` setting in the unit file.

To view the log, use `journalctl` (to exit press Ctrl-C). For example, to read the system log file, filtered for the Jamulus service:

`journalctl -f -u jamulus-headless`

#### Controlling Recording

When using the recording function with the `-R` command line option, if the Server receives a SIGUSR1 signal during a recording, it will start a new recording in a new Directory. SIGUSR2 will recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `jamulusTogglerec.service`).

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


## Servers on the desktop

Jamulus can be run in Server mode from the desktop. This gives you a graphical user interface to control most of the settings.

* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu.
* **macOS users** - Double-click the "Jamulus Server" icon in Applications (assuming you put the files from the install there as per [these instructions](Installation-for-Macintosh)).
* **Linux users** - Launch the "Jamulus Server" shortcut. Or you can open a terminal window (`CTRL+ALT+t` on Debian and related distros), type `jamulus -s` and hit return.


## Server Setup

<figure><img src="{% include img/en-screenshots/server-window-setup.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of the Jamulus Server setup window"></figure>

### The Directory list

**None**: By default, you will not be connected to a Directory and will be running in unregistered mode. [Read these instructions](#running-an-unregistered-server) to have other people connect to your Server in this mode.

**Genre**: To allow other people to see your Server on one of the Directories built into the Client, select your desired genre Directory. You should see a confirmation message saying whether your Server has registered successfully. If not, and you leave your Server running, it will keep trying to register until a free slot becomes available.

**Custom**: This allows you to specify a custom directory on which to be listed. See the "Options" tab for the Custom Directory address you want to use.

To run your Server _as_ a Directory, you need to set the Custom Directory address as `localhost` or `127.0.0.1` and set the "Genre" to "Custom". [Read this guide](Directories) for further details.

### My Server Info

When running as a Registered Server this displays the Server's name, city and country so that other users can easily identify it in the Directory listing.

### Chat Welcome Message

The text entered here appears to all users when they join the Server (the chat window will open automatically for them). HTML is also supported.

## Options

<figure><img src="{% include img/en-screenshots/server-window-options.inc %}" style="width:80%; border:5px solid grey;" loading="lazy" alt="Image of Jamulus Server window options"></figure>

### Recording Directory

This sets the path to where the Server's recordings will be stored. With this path set, the "Enable Jam Recorder" function in the Server Setup tab will make recording start once the first person connects to the Server, and stops when the last person leaves. Use the "New Recording" button to create a new sub-directory in which the recordings will be stored from then on. Note that Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

**Note**: When your Server is recording, Clients will display a message that recording is on.

### Custom Directory Address

Leave this field empty unless you need to list your Server on a [Custom Directory](#3-directory) or run a Directory.

### Server List Filename

Leave this field empty unless you need to run your Server as a [Directory](#3-directory). When in use, this holds the list of registered Servers whilst restarting the Directory. This prevents the server list appearing "empty" until the Servers re-register.

### Delay panning

This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal "volume" panning.

### Start Minimised

**Windows users** - If you want the Server to start automatically on system start, enable the corresponding check box.

### Server status icon

When the Server is running, the operating system will show an icon in the system tray or status area to represent whether the Server is active:  

<figure><img src="{% include img/en-screenshots/server-inactive.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is empty

<figure><img src="{% include img/en-screenshots/server-active.inc %}" style="float:left; margin-right:10px;" loading="lazy" alt="Image of the Jamulus Server icon"></figure> The Server is occupied

## Command line options

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

## Running an Unregistered Server

It is highly recommended to test your Server by registering it on one of the built-in Directories **first** so as to narrow down any subsequent problems in unregistered mode.

### Setting up a Server behind a home router

If you set up your server at home, you will probably need to change some settings in your router/firewall:

#### Port forwarding

People from outside your home network will not be able to see things inside it. To let external Jamulus clients connect to your server, you need to set up port forwarding in your Router's settings. The exact setup differs for every router. For help see your Router's documentation or [portforward.com](https://portforward.com).

**Note:** The default port for the current version of Jamulus is **UDP** (not TCP) port **22124**. You will usually forward the port **22124** from outside your network to the port **22124** of the machine running the Server.

**Note:** Your home router may change the IP address of the machine you're running your Server on. Depending on your router, you might need to give this machine a static IP address (often under DHCP settings of your router).

#### Getting the external IP

To allow others to connect to your Server from the internet, get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip) and give it to them.
You yourself should connect using the local network (LAN) address of the machine the Server is running on. If you are running a Client on the same machine as your Server, that would be `localhost` or `127.0.0.1`.


#### Dynamic DNS and why you will probably need it

Most domestic internet connections change their external IP address after a short period. To avoid problems with this, you might want to set up "dynamic DNS" to get a static (sub-)domain you can share with others. Please research how to do that for your specic set up. Your router might support some "dynamic DNS" providers out of the box. If this is not the case, set up a dynamic DNS client as described by the dynamic DNS provider you chose.

## DNS SRV record support

Jamulus clients support [DNS SRV records ("service" records)](https://en.wikipedia.org/wiki/SRV_record). If a Jamulus client finds an SRV record associated with the domain name given in the Connect window, it will try to connect to the endpoint host and port listed in the SRV record. This process is similar to HTTP redirection in a web browser, only it's between Jamulus clients and the DNS server. The Jamulus Server is not involved in this interaction. Jamulus Servers just listen for connections on the same port listed in the SRV record.

#### Why is this helpful?

Jamulus client can connect to a server on a non-standard port by specifying the port as part of the server address. A server administrator may want to give users a simple address without the port details, while still serving Jamulus on a non-standard port. For this case, the port information can be acquired from an SRV record.

For example, an address given in Jamulus client Connect window could look like ```jamulus.example.com```. If a DNS SRV record is found for this domain, Jamulus client will try to connect to Jamulus server on the host:port listed in the SRV record, such as ```jamulus.example.com:12345```.

If no SRV records are found on the DNS server, Jamulus client will attempt to connect to Jamulus server as specified in the connection window.

#### Creating SRV records

SRV records are created by the administrator of the domain being used to host the Jamulus server. The SRV records are added through the administration portal (or API if available) of the domain's DNS hosting service. The format of the SRV record entry can vary by DNS hosting service but will generally look something like this.

~~~
  _service._proto.name. ttl IN SRV priority weight port target
  
  # or, more specifically
  
  _jamulus._udp.example.com. 60 IN SRV 0 5 12345 jamulus.example.com
~~~

**Tip:** You can host many Jamulus Servers at different ports on one host by giving each its own SRV record.

See the documentation of your DNS provider for instructions on creating an SRV record for that provider.

#### Example use case with SRV records

This example assumes a DNS A or CNAME record resolves ```server1.example.com```, and ```server1.example.com``` has three Jamulus server instances, each listening on one of the three specified ports below.

Alternatively, server1.example.com can be a router, NAT-gateway, or load-balancer that forwards each of the ports to a backend Jamulus server (or servers).


| JAMULUS CLIENT     |  DNS SRV RECORD                                                             | JAMULUS SERVER             |
| ------------------ | --------------------------------------------------------------------------- | -------------------------- |
| rock.example.com  |  _jamulus._udp.rock.example.com 300 IN SRV 0 5 22124 server1.example.com  | server1.example.com:22124 |
| jazz.example.com  |  _jamulus._udp.jazz.example.com 300 IN SRV 0 5 22125 server1.example.com  | server1.example.com:22125 |
| blues.example.com |  _jamulus._udp.blues.example.com 300 IN SRV 0 5 22126 server1.example.com | server1.example.com:22126 |

*It's important to remember that DNS is not forwarding connections. It's simply telling Jamulus client what public host:port to connect to.*

## Backing up the Server

_Note that headless Servers do not use `.ini` files. All configuration is given as command line options._

{% include_relative Include-Backing-Up.md %}

## Troubleshooting

If you are having other problems, [see this guide](Server-Troubleshooting).
