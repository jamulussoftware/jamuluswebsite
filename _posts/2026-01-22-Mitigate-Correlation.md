---
layout: post
title: "Mitigating User Tracking Caused By Correlation Attack"
lang: "en"
author: "rdica"
heading: "Mitigating User Tracking Caused By Correlation Attack"
---

By default the Jamulus protocol does not map usernames to IP addresses in any publicly available data.  
However it is possible to execute a correlation attack to achieve user&lt;&dash;&gt;IP mapping.  
This was first reported to Jamulus developers here: [https://github.com/orgs/jamulussoftware/discussions/3545](https://github.com/orgs/jamulussoftware/discussions/3545)

## Scope

This document will attempt to summarize the problem, and provide mitigations for both users, and server admins.

## The Problem - Pings and Join Events

### Pings

When a user attempts to connect to a server, they open the Connect dialog window. The client will **start** sending &ldquo;pings&rdquo; to every server listed in that genre to report delay latency &lpar;basically network distance&rpar; to those servers.

Anyone running a server can capture those &ldquo;pings&rdquo; using tools like `tcpdump` or `tshark/wireshark` and view the IP addresses of the clients that are sending them.  
**No username data is sent.** This is part of the Jamulus protocol, by design, to maintain a level of privacy and prevent others from finding the IP addresses of specific users.

### Join Events

A user will either select a server from the list, or type in a server address:port, click Connect or hit Enter, and the client will then attempt to connect to the server. At this point the client **stops** sending the &ldquo;pings&rdquo; and the client typically completes the connection to the server.

Each genre has a directory server. The purpose of the directory server is to provide clients with a listing of servers registered to it, and the users connected to each server. This is public data, and viewed in the Connect dialog window, and available through a number of websites, like [explorer.jamulus.io](https://explorer.jamulus.io) or [jamulusjams.com](https://jamulusjams.com).

Anyone can run an explorer instance. An explorer queries each genres directory server to get a list of servers, then queries each server directly to get a list of connected users. This is public data. **There is no IP address information on users, just the user profile data**. Again this is by design to prevent IP&lt;&dash;&gt;username mapping.  This data can also be saved for later processing.
