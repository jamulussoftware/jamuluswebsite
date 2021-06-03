---
layout: wiki
title: "Server Installation - Windows and macOS"
lang: "en"
permalink: "/wiki/Server-Win-Mac"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Installation for Windows and macOS


**_Please ensure you have read the [server overview](Running-a-Server)_**

* **Windows users** - Start the server using the entry for "Jamulus server" in the Windows start menu.

* **macOS users** - Double-click the "Jamulus server" icon in Applications (assuming you put the files from the install there as per [these instructions](Installation-for-Macintosh)).

* **Linux users** - Please refer to the [GUI server instructions](Server-Linux#running-a-server-with-the-gui).

<figure><img src="{{site.url}}/assets/img/en-screenshots/server-window-setup.png" loading="lazy" alt="Image of the Jamulus server setup window"></figure>

### Public server setup

1. On checking "Make My Server Public" you should see a confirmation message saying whether your server has registered successfully.

1. Type in the name, city and country so that other users can easily identify you.

1. Specify a music genre. This will make your server appear in the relevant server list for clients (see more [details on Directory Servers](Directory-Servers)).

_The Chat Welcome Message appears to all users when they join the server (the chat window will open automatically for them)._

### Private server setup

If you do not check "Make My Server Public", you will be running a private server and need to [read these instructions](Running-a-Private-Server).

_If you want to **run a client on the same machine** you should **connect the client to `127.0.0.1`** for best performance. (Similarly, if you want to connect a client on another machine on your LAN, use the server's LAN IP address)._


### Other options

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/114275476-79e7e580-9a1a-11eb-8e6b-09d9f956c689.png">

### Recording

Turn on server recording by first setting the Recording Directory in the Options tab. Recording starts once the first person connects to the server, and stops when the last person leaves. Use the "New Recording" button to create a new sub-directory in which the recordings will be stored. Note that Recordings are per track in [Audacity](https://www.audacityteam.org/) `.lof` format and [REAPER](https://en.wikipedia.org/wiki/REAPER) `.rpp`. Open the respective files to listen to them in those applications.

_Note: When your server is recording, clients will display a message that recording is on._

For headless servers: you can control the recording function [using these instructions](Server-Linux#controlling-recordings).

### Delay panning

This option uses small differences in sound arrival time between the two ears. It produces a stereo effect similar to natural human hearing when compared to normal "volume" panning. Note that to achieve the effect, all clients should be set to 'mono in / stereo out' (or to 'stereo', but only if transmitting a stereo signal).

### Custom Central Server Address


<figure><img src="{{site.url}}/assets/img/en-screenshots/server-window-options.png" loading="lazy" alt="Image of Jamulus server window options"></figure>

(Leave this field empty unless you need to list your server on a [private central server](Choosing-a-Server-Type#3-directory))


**Windows users** - If you want the server to start automatically on system start, enable the corresponding check box.

(Leave the "Custom Directory Server Address" field empty unless you need to list your server on a [private directory server](Choosing-a-Server-Type#3-directory))


***

See also [Command Line Options](Command-Line-Options) for other parameters you can set.
