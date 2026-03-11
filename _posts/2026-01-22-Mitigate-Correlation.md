---
layout: post
title: "Privacy: Mitigating User Tracking By Third Parties"
lang: "en"
author: "rdica"
heading: "Privacy: Mitigating User Tracking By Third Parties"
---

By default the Jamulus protocol does not map usernames to IP addresses in any publicly available data.  
However it is possible to correlate connections to Servers to achieve user&lt;&dash;&gt;IP mapping.  
This was first reported to Jamulus developers here: [https://github.com/orgs/jamulussoftware/discussions/3545](https://github.com/orgs/jamulussoftware/discussions/3545)

<!--more-->

## Scope

This document will attempt to summarize the problem, and provide mitigations for both users, and Server admins.

## The Problem - Pings and Join Events

### Pings

When a user attempts to connect to a Server, they open the Connect dialog window. The client will **start** sending &ldquo;pings&rdquo; to every Server listed in that genre to report delay latency &lpar;basically network distance&rpar; to those Servers.

Anyone running a Server can capture those &ldquo;pings&rdquo; using tools like `tcpdump` or `tshark/wireshark` and view the IP addresses of the clients that are sending them.  
**No username data is sent.** This is part of the Jamulus protocol, by design, to maintain a level of privacy and prevent others from finding the IP addresses of specific users.

### Join Events

A user will either select a Server from the list, or type in a Server address:port, click Connect or hit Enter, and the client will then attempt to connect to the Server. At this point the client **stops** sending the &ldquo;pings&rdquo; and the client typically completes the connection to the Server.

Each genre has a Directory Server. The purpose of the Directory Server is to provide clients with a listing of Servers registered to it, and the users connected to each Server. This is public data, and viewed in the Connect dialog window, and available through a number of websites, like [explorer.jamulus.io](https://explorer.jamulus.io), [jamulusjams.com](https://jamulusjams.com), or [jamscout.de](https://jamscout.de).

Anyone can run an explorer instance. An explorer queries each genres Directory Server to get a list of Servers, then queries each Server directly to get a list of connected users. This is public data. **There is no IP address information on users, just the user profile data**. Again this is by design to prevent IP&lt;&dash;&gt;username mapping.  This data can also be saved for later processing.

### Correlation

Anyone can run Servers **and** explorer instances.  
Using IPs captured by a Server, one can correlate **when an IP address stops pinging** &lpar;ie; just connected to a Server&rpar; and **when a new client joined a Server** &lpar;username data from explorer query directly to a Jamulus Server&rpar; to produce an IP&lt;&dash;&gt;username mapping. The IP address can then be processed to provide geolocation data. From this one can determine the approximate location of a specific user even if no location was set in the users profile.

## Current Correlation (as of 2026-03-11)

### Listeners

There are currently seven known Servers on public Jamulus space, one in each genre. They are hosted on [DigitalOcean](https://digitalocean.com) instances. They are named ***Duet***, and have a userlimit set at two. They all share the same IP and each sit on different ports.  
These Servers are &ldquo;listening&rdquo; for pings from clients, and packet capturing them to get the IP addresses of user clients.

```
Genre               Name   IP:port

Any Genre1          Duet   24.199.107.192:22121
Any Genre2          Duet   24.199.107.192:22122
Any Genre3          Duet   24.199.107.192:22123
Rock                Duet   24.199.107.192:22124
Jazz                Duet   24.199.107.192:22125
Classical/Folk      Duet   24.199.107.192:22126
Choral/Barbershop   Duet   24.199.107.192:22127
```

### User Data

There is an explorer instance collecting lists of Servers and users running from **`137.184.43.255`**. It is hosted on a [DigitalOcean](https://digitalocean.com) instance.  
IP addresses of users collected from the listeners are being correlated with join events derived from the explorer instance to produce IP&lt;&dash;&gt;username mappings. IP addresses are processed to provide geolocation data of users. This geolocation data is being collected **and** displayed without express permission of users, and with no means to opt in or out.

## Mitigations

### Clients

When you open the Connect dialog window your client starts sending pings to every Server in the list. **`24.199.107.192`** is the IP address of one of those Servers. A Server using **`24.199.107.192`** exists on each genre, their names are ***Duet***.

Blocking outgoing **UDP** traffic on your DAW or router to **`24.199.107.192`** will prevent the listeners from collecting your IP address and breaks correlation. This will help prevent you from being tracked.

### Server Admins

Server admins can decide to prevent user tracking by blocking the explorer probe.  
If you run a Server on the Jamulus public network, it is currently being indexed by the explorer instance on **`137.184.43.255`**

Blocking incoming **UDP** traffic from **`137.184.43.255`** will prevent the explorer from indexing your Server and breaks correlation. This will disable user tracking on your Server from the blocked Server.

---

Updated information can be found here: [https://jamulusjams.com/block-user-tracking.html](https://jamulusjams.com/block-user-tracking.html)
