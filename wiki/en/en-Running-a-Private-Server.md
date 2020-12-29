---
layout: wiki
title: "Running a Private Server"
lang: "en"
permalink: "/wiki/Running-a-Private-Server"
---

# Running a Private Server

**_Please ensure you have read the [server overview](Running-a-Server)_**

This guide assumes you will be running a private server on your home network, but some of the issues here may also apply to those running on cloud hosts (e.g. Amazon EC2).

It is highly recommended to test your server in **public mode first** so as to narrow down any subsequent problems in private mode.

## Operating a private server behind a home network router
### Port forwarding
To run a private server, you need to setup port forwarding on your router. _(If you are curious about why you need to do this for private but not public servers, see [this footnote](#footnote-for-geeks).)_

Normally, people from outside your home network cannot see things inside it. So if you want to operate a Jamulus server at home, you need to open a hole in your router to let Jamulus clients connect to it.

**The default port for the current version of Jamulus is UDP (not TCP) port 22124.**

The exact setup of port forwarding differs for every router. Here's an example of the port forwarding settings in a Linksys router:

![Linksysportforwarding](https://user-images.githubusercontent.com/4561747/97542495-bc62bc00-19be-11eb-8e54-b6e906e676f6.jpg)

For help see [portforward.com](https://portforward.com).

Once you have your router set up, you can get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip). Give this address to your friends so they can connect to your server (_but see also the note on dynamic DNS below_). You yourself have to connect to your own computer instead, since your computer runs the server. Therefore **only you** need to connect to `127.0.0.1`.

### Points to note

* You do not need to open a port range as shown in the example above as long as you want to start only one instance of the Jamulus server on the same machine.

* If using a different port than the default port (22124) you have to enter the port number after the server name or IP address separated by a colon in the Jamulus client (e.g. jamulus.example.org:22120).

* See also this excellent [guide to running a private server](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/how-to-create-a-private-server-for-band-rehearsals/508642543044030/) by [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a) on Facebook.  

## Dynamic DNS and why you will probably need it

Most domestic Internet connections will change their IP address after a period (hours, days or weeks). To make it easier for people to connect to you, you may therefore also want set up a dynamic DNS address. You can do this on [the machine](https://www.online-tech-tips.com/computer-tips/ddns-dynamic-dns-service/) that you are running the Jamulus server on, or preferably your router [may support it](https://www.noip.com/support/knowledgebase/how-to-configure-ddns-in-router/).

Note also that your home router may also change the IP address of the machine that you are running your server on. In which case you may need either to give that machine a static IP in the router's DHCP configuration, or simply port forward to all the addresses in your LAN.

## Footnote for geeks

One of the many features of Jamulus that make it orgasmically wonderful is the fact that you can set up a server in seconds. But why do public servers not need port forwarding to do this?

Normally, network address translation (NAT) firewalls prevent incoming requests initiated from outside the local network. Inbound traffic is only possible for packets _relating to an outbound request_ (strictly speaking, "related" and "established" packets to an initial outbound connection). In public mode, when your Jamulus server connects to a Central Server it of course initiates an outbound connection. From then on, the Central Server sends (established/related) connection "pings" (not ICMP pings) to your server at regular intervals to keep the relevant NAT port(s) open on your router/firewall.

However, in private mode clients have to _initiate_ connections into the server's network. NAT firewalls prevent this, so you need to tell them to allow incoming connection requests on the Jamulus port using port forwarding.
