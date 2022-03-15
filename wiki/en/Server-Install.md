---
layout: wiki
title: "Installing a Server"
lang: "en"
permalink: "/wiki/Server-Install"
---

{% include breadcrumb.html root="Server Guide" branch1="Server Manual" branch1-url="Running-a-Server" %}

# Installing a Server

Make sure you read the [Server Manual](Running-a-Server).

Most people run Jamulus as a "pure" Server on **hardware without audio** (e.g. on a 3rd party/cloud host) running Linux. The following guide assumes you are familiar with the command line and Debian/Ubuntu or similar distribution using systemd. To run a server on the desktop with a graphical user interface, [see this section](#servers-on-the-desktop).  

If you want to run a Server on a Raspberry Pi, you will need to [compile from source](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md). See also this [guide for Raspberry Pi](/kb/2020/03/28/Server-Rpi.html) maintained by Jamulus user fredsiva.

### Installation

1. Download the [latest headless .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }})
1. Update apt to make sure you have a current list of standard packages: `sudo apt update`
1. Install the Jamulus package: `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Enable the headless Server process via systemd: `sudo systemctl enable jamulus-headless`
1. Add your desired [command line options](Running-a-Server#command-line-options) to the `ExecStart` line in the systemd service file in `/lib/systemd/system/jamulus-headless.service` (By default you will be running an Unregistered Server).
1. Reload the systemd files `sudo systemctl daemon-reload` and restart the headless Server: `sudo systemctl restart jamulus-headless`
1. Check all is well with `systemctl status jamulus-headless` (hit `q` to get back to the command prompt).

**Note**: You can upgrade your server by repeating the steps mentioned above.

### Configuration

You can control Jamulus with the `systemctl` command. For example, to stop the Server cleanly:

`sudo systemctl stop jamulus-headless`

### Running an Unregistered Server

It is highly recommended to test your Server on a **Public Directory** first so as to narrow down any subsequent problems in unregistered mode.

### Port forwarding

If you are running a Server on your home network, people from outside will not be able to see things inside it. So if you want to operate a Jamulus Server, you need to open a hole in your router's firewall to let Jamulus Clients connect to it.

**The default port for the current version of Jamulus is UDP (not TCP) port 22124.**

The exact setup of port forwarding differs for every router. For help see [portforward.com](https://portforward.com).

Once you have your router set up, you can get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip). Give this address to your friends so they can connect to your Server (_but see also the note on dynamic DNS below_). You yourself should connect using the local network (LAN) address of the machine the Server is running on. If you are running a Client on the same machine as your Server, that would be `localhost` or `127.0.0.1`.

## Dynamic DNS and why you will probably need it

Home internet connections ususally change their IP address after a short period (hours, days or weeks). To allow people to connect to you, you probably want set up a dynamic DNS address for getting a static (sub-)domain people can connect to. You can do this on [the machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) that you are running the Jamulus Server on, or preferably your router [may support it](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

**Note:** Your home router may change the IP address of the machine you're running your Server on. You may need to give that machine a static IP in the router's DHCP configuration.

#### Running in Registered mode

The following minimum setup is required to [run a Registered Server](Running-a-Server#server-types):

~~~
jamulus --nogui --server \
        --directoryserver genreServer:port \
        --serverinfo "<insertServerName>;<insertCity>;[country ID]"
~~~

**Note**: Semicolon and newline characters are not allowed in `<insertServerName>` and `<insertCity>` within the `--serverinfo` argument

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

## Servers on the desktop

Jamulus can be configured to run in Server mode on the desktop. This gives you a graphical user interface to control most of the settings.

* **Windows users** - Use the "Jamulus Server" icon in the Windows Start menu.

* **macOS users** - Double-click the "Jamulus Server" icon in Applications (assuming you put the files from the install there as per [these instructions](Installation-for-Macintosh)).

* **Linux users** - Launch the "Jamulus Server" shortcut. Or you can open a terminal window (`CTRL+ALT+t` on Debian and related distros), type `jamulus -s` and hit return. _(To run a headless Server [read this guide](#installing-and-running-a-server))_

Take a look at the [Jamulus Server Guide](Running-a-Server){: .button}
