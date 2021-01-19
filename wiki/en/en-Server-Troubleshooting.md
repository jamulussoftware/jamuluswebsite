---
layout: wiki
title: "Server Troubleshooting"
lang: "en"
permalink: "/wiki/Server-Troubleshooting"
---

# Troubleshooting

## Servers - Public

### Why doesn't my server show up in the list? Why isn't in registering?

If you are registered OK (you can [see it here](https://explorer.jamulus.io/)) and you or your friends can't see your server, you may need to wait, or start your client with the `--showallservers` option and try connecting from there ([see this page](Command-Line-Options) on how to start your client with a config option).

If you are seeing a message that says the server is full, please [see this note](Central-Servers) on Central Servers.

You can verify that your server is listed in the relevant genre by [checking it here](https://explorer.jamulus.io/).

## Servers - Private

### I'm running my client on the same machine/network as my server but I can't connect to it

Connect your client to `127.0.0.1` (or `localhost` if that works for you). If you're running the client on a different machine to the server but on the same network, then connect to the _local network_ address of the server. Do not connect via the server's public (WAN) address.

### What address do I give to people so that they can connect to my server?

This should be your **public** IP address (find that with [Google](https://www.google.com/search?q=whatsmyip)). Connect your **own** Jamulus client to the **local** IP address of your server (127.0.0.1 if it's on the same machine as your client). Note that your public IP address can change - see the note on "dynamic DNS" in [this guide](Running-a-Private-Server).

### What port numbers can I use?

Keep the default UDP ports. The actual default port is documented by the [command line](Command-Line-Options). At the time of writing this documentation, the port number is **22124**.

### Is a private server a direct server without contact to the Jamulus Central Server?

Yes. Please see [Server Types](Choosing-a-Server-Type)

### Can I convert my private server to being a public one?

Yes. Simply check the "Make my Server Public" box in the server window and fill out the details. Remember that you also do not need to port forward if you have a public server.

### **_Headless Linux_**: I have created a server but it is joining the Central Server and I don't want it to.

To enable a private server, do not use the `--centralserver` (`-e`) option when starting your server command line.

### Nobody can connect to my server - but I can connect locally

Some ISPs are using techniques like [Address plus Port (A+P)](https://en.wikipedia.org/wiki/Address_plus_Port) or [Carrier-grade NAT (CGN)](https://en.wikipedia.org/wiki/Carrier-grade_NAT) to conserve address space. This makes it impossible to host services like Jamulus at home (and may mean you also cannot see server lists in your client, or you may be missing [some specific servers](https://sourceforge.net/p/llcon/discussion/server/thread/f72b293af0/)).

To detect if CGN is the issue, go to your router's configuration screen (typically, 192.168.X.X) and look at the WAN Status page. If your listed IPv4 address does not match with the address you see [here](https://ifconfig.me), then this means CGN may be enabled. Or if you experience problems such as being unable to [connect to servers or an empty server list](https://sourceforge.net/p/llcon/discussion/533517/thread/b3eea395c4/) this may also be an indicator that your ISP is the problem too.

To fix the issue: if you are running a public server, try [port forwarding](Running-a-Private-Server#port-forwarding). If you are running a private server and are port forwarding already, contact your ISP support and request them to remove you from CGN and assign you a real WAN IP address because you want to host a server. If CGN is not the issue, you may need to ask your ISP to give you a WAN IP address (or fixed one to avoid using DDNS, if possible). If all else fails, consider hosting on a cloud platform (some providers do free trial periods).
