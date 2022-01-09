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

### Why doesn't my server show up in the list? Why isn't it registering?

If you are registered OK (you can [see it here](https://explorer.jamulus.io/)) and you or your friends can't see your server, you may need to wait, or start your client with the `--showallservers` option and try connecting from there ([see command line options](Software-Manual#command-line-options)) on how to start your client with a config option).

If you are seeing a message that says the server is full, you will need to wait until a slot becomes free.

You can verify that your server is listed in the relevant genre by [checking it here](https://explorer.jamulus.io/).

## Servers - Unregistered 

### I'm running my client on the same machine/network as my server but I can't connect to it

Connect your client to `127.0.0.1` (or `localhost` if that works for you). If you're running the client on a different machine to the server but on the same network, then connect to the _local network_ address of the server. Do not connect via the server's public (WAN) address.

### What address do I give to people so that they can connect to my server?

This should be your **public** IP address (find that with [Google](https://www.google.com/search?q=whatsmyip)). Connect your **own** Jamulus client to the **local** IP address of your server (127.0.0.1 if it's on the same machine as your client). Note that your public IP address can change - see the note on "dynamic DNS" in [this guide](Running-a-Server#dynamic-dns-and-why-you-will-probably-need-it).

### What port numbers can I use?

You can set your server to listen on a custom port with the `--port` option. If you do this, you will need to tell people which port to connect on. They will need to append the port number to the address of your server in the format `[serverAddress]:[portNumber]`.

### **_Headless Linux_**: I have created a server but it is joining a directory and I don't want it to.

To prevent registration, do not use the `--directoryserver` (`-e`) option when starting your server.

### Nobody can connect to my server - but I can connect locally

Some ISPs are using techniques like [Address plus Port (A+P)](https://en.wikipedia.org/wiki/Address_plus_Port) or [Carrier-grade NAT (CGN)](https://en.wikipedia.org/wiki/Carrier-grade_NAT) to conserve address space. This makes it impossible to host services like Jamulus at home (and may mean you also cannot see server lists in your client, or you may be missing [some specific servers](https://sourceforge.net/p/llcon/discussion/server/thread/f72b293af0/)).

To detect if CGN is the issue, go to your router's configuration screen (typically, 192.168.X.X) and look at the WAN Status page. If your listed IPv4 address does not match with the address you see [here](https://ifconfig.me), then this means CGN may be enabled. Or if you experience problems such as being unable to [connect to servers or an empty server list](https://sourceforge.net/p/llcon/discussion/533517/thread/b3eea395c4/) this may also be an indicator that your ISP is the problem too.

To fix the issue: if you are running a registered server, try [port forwarding](Running-a-Server#port-forwarding). If you are running an unregistered server and are port forwarding already, contact your ISP support and request them to remove you from CGN and assign you a real WAN IP address because you want to host a server. If CGN is not the issue, you may need to ask your ISP to give you a WAN IP address (or fixed one to avoid using DDNS, if possible). If all else fails, consider hosting on a cloud platform (some providers do free trial periods).
