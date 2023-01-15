---
layout: wiki
title: "Server Troubleshooting"
lang: "en"
permalink: "/wiki/Server-Troubleshooting"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# Server Troubleshooting
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

## Servers - Registered 

### Why doesn't my Server show up in the list? Why isn't it registering?

If you are registered OK (you can [see it here](https://explorer.jamulus.io/)) and you or your friends can't see your Server, you may need to wait, or start your Client with the `--showallservers` option and try connecting from there ([see command line options](Software-Manual#command-line-options)) on how to start your Client with a config option). In some network configurations, you may also need to [port forward](Running-a-Server#port-forwarding) your router.

If you are seeing a message that says the Server is full, you will need to wait until a slot becomes free.

You can verify that your Server is listed in the relevant genre by [checking it here](https://explorer.jamulus.io/).

## Servers - Unregistered 

### I'm running my Client on the same machine/network as my Server but I can't connect to it

Connect your Client to `localhost` or `127.0.0.1`. If you're running the Client on a different machine to the Server but on the same network, then connect to the _local network_ address of the Server. Do not connect via the Server's public (WAN) address.

### What address do I give to people so that they can connect to my Server?

This should be your **public** IP address (find that with [Google](https://www.google.com/search?q=whatsmyip)). Connect your **own** Jamulus Client to the **local** IP address of your Server (`localhost` or `127.0.0.1` if it's on the same machine as your Client). Note that your public IP address can change - see the note on "dynamic DNS" in [this guide](Running-a-Server#dynamic-dns-and-why-you-will-probably-need-it).


### What port numbers can I use?

You can set your Server to listen on a custom port with the `--port` option. If you do this, you will need to tell people which port to connect on. They will need to append the port number to the address of your Server in the format `[serverAddress]:[portNumber]`.

### Nobody can connect to my Server - but I can connect locally

First of all, make sure you've enabled [port forwarding](Running-a-Server#port-forwarding). If you still don't see your server from outside of your local network, you may have issues with your Internet Service Provider (ISP).

Some ISPs are using techniques like [Address plus Port (A+P)](https://en.wikipedia.org/wiki/Address_plus_Port) or [Carrier-grade NAT (CGN)](https://en.wikipedia.org/wiki/Carrier-grade_NAT) to conserve address space (usually for IPv4). That makes it impossible to host services like Jamulus at home as they are not visible outside your local network.

To detect if CGN is the issue, go to your router's configuration screen (typically, 192.168.X.X) and look at the WAN Status page. If your listed IPv4 address doesn't match with your public IPv4 address (check it [here](https://ifconfig.me)), it suggests that CGN may be enabled. You can try using an IPv6 connection by starting clients and server with the `-6` flag if IPv6 is available for the server and all clients. 

To fix the issue with IPv4, contact your ISP technical support team, and tell them that you want to host a public server at home, so you need a real WAN IP address. Furthermore, you can help them with info that CGN might be the issue. Also, you can ask for a static IP address to avoid using DDNS.

