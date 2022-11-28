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

People from outside your home network will not be able to see things inside it. To let external Jamulus clients connect to your server, you need to set up port forwarding in your Router's settings. The exact setup differs for every router. For help see your Router's documentation or [portforward.com](https://portforward.com).

**Note:** The default port for Jamulus is **UDP** (not TCP) port **22124**. You will usually forward the port **22124** from outside your network to the port **22124** of the computer running the Server.

**Note:** Your home router might change the IP address of the computer you're running your Server on. Depending on your router, you might need to give this computer a static IP address (often under DHCP settings of your router).

### Getting the external IP

To allow others to connect to your Server from the internet, give them your public internet IP address. You can learn your current address [using Google](https://www.google.com/search?q=what+is+my+ip).
You should connect yourself using the local network address of the computer the Server is running on. If you are running a Client on the same computer as your Server, the address is `localhost` or `127.0.0.1`.


### Dynamic DNS and why you will probably need it

Unless your ISP provides you with a fixed IP address, you may find that your address changes over time. To avoid problems with this, you might want to set up "dynamic DNS" to get a static address you can share with others. Your router might support some "dynamic DNS" providers to do this. If this is not the case, these providers will have instructions to set up a dynamic DNS client.
