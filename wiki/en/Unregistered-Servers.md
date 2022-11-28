---
layout: wiki
title: "Running an Unregistered Server"
lang: "en"
permalink: "/wiki/Unregistered-Servers"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# Running an Unregistered Server

It is highly recommended to test your Server by registering it on one of the built-in Directories **first** so as to narrow down any subsequent problems in unregistered mode.

## Setting up a Server behind a home router

If you set up your server at home, you will probably need to change some settings in your router/firewall:

### Port forwarding

People from outside your home network will not be able to see things inside it. To let external Jamulus clients connect to your server, you need to set up port forwarding in your Router's settings. The exact setup differs for every router. For help see your Router's documentation or [portforward.com](https://portforward.com).

**Note:** The default port for the current version of Jamulus is **UDP** (not TCP) port **22124**. You will usually forward the port **22124** from outside your network to the port **22124** of the machine running the Server.

**Note:** Your home router may change the IP address of the machine you're running your Server on. Depending on your router, you might need to give this machine a static IP address (often under DHCP settings of your router).

### Getting the external IP

To allow others to connect to your Server from the internet, get your external (WAN) IP address e.g. by [using Google](https://www.google.com/search?q=what+is+my+ip) and give it to them.
You yourself should connect using the local network (LAN) address of the machine the Server is running on. If you are running a Client on the same machine as your Server, that would be `localhost` or `127.0.0.1`.


### Dynamic DNS and why you will probably need it

Unless you have agreed in your ISP contract to have a fixed IP address, then you may find that your address changes over time. To avoid problems with this, you might want to set up "dynamic DNS" to get a static address you can share with others. Your router might support some "dynamic DNS" providers to do this. If this is not the case, these providers will have instructions to set up a dynamic DNS client.
