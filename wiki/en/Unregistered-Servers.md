---
layout: wiki
title: "Running an Unregistered Server"
lang: "en"
permalink: "/wiki/Unregistered-Servers"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# Running an Unregistered Server

It is highly recommended to test your Server by registering it on one of the built-in Directories **first**. This will help you tackle general problems before you try unregistered mode.

## Setting up a Server behind a home router

If you set up your server at home, you will probably need to change some settings in your router/firewall:

### Port forwarding

Normally, people from outside your home network cannot see things inside it. To let external Jamulus clients connect to your server, you need to set up port forwarding in your router's settings. The exact setup differs for every router. For help, see your router's documentation or [portforward.com](https://portforward.com).

**Note:** The default port for Jamulus is **UDP** (not TCP) port **22124**. You will usually forward the port **22124** from outside your network to the port **22124** of the computer running the Server.

### Getting the public IP

To allow others to connect to your Server from the internet, give them your public internet IP address. You can [learn your current address using Google](https://www.google.com/search?q=what+is+my+ip).
You should connect yourself using the local network address of the computer the Server is running on. If you are running a Client on the same computer as your Server, the address is `localhost` or `127.0.0.1`.


### Dynamic DNS and why you will probably need it

Unless your ISP provides you with a fixed IP address, you may find that your address changes over time. You might want to set up "dynamic DNS" to get a static address you can share with others. A "dynamic DNS" provider can supply you with a static IP address that you can share, but you need to keep refreshing your dynamic IP with the provider. Your router might support certain providers to do this. If this is not the case, the provider will have instructions on how to set up a dynamic DNS client.