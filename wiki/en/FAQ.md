---
layout: wiki
title: "FAQ"
lang: "en"
permalink: "/wiki/FAQ"
---

# Jamulus FAQ
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

**For common problems and their solutions when using Jamulus, see the [Troubleshooting](/wiki/Client-Troubleshooting) page.**


### Is there a metronome, synchronization, or some other way of keeping in time?

No. Musicians on a Jamulus server simply play in real time together as they would in person. If you want to have a time signal, then there are shared metronome solutions on the Internet you can try. But it’s probably best to just minimise latency so nobody has an overall delay more than about 30-50 ms. 

Bear in mind also that all participants should follow [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together) which will also determine whether you can play in time properly.

### How do I know if I can join a server? Are there rules?

In general, if somebody sets up a public server, they accept that anyone can play on it. Jamulus has no password protection or other authentication mechanisms. However, some servers may state their policies in the welcome message you will see in the chat window.

You can also set up a private server on Jamulus and give others your address to connect to that. Have a look at [this page for more information](/wiki/Running-a-Server).

### Why shouldn’t I use wireless equipment?

Whether or not you will be able to play in time with other musicians depends mainly on how much latency (delay) you have in your sound signal and whether you are all following [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together). An overall delay much bigger than 50 ms usually makes it too hard to play in time unless you train yourself to do so. Some musicians report they can play in time with delays of up to 70 ms by playing ahead of the beat. But much beyond that and it becomes too difficult unless timing isn’t an important factor in the music or you just want to listen.

So it makes sense to minimise any sources of delay or other problems with the signal. Even fast wi-fi is usually too variable to use for long periods with Jamulus, and Bluetooth headphones and mics usually introduce latencies of about 50 ms or more.

### Why should I not listen to my own signal?

For the same reason as you need to minimise delay in your signal in order to play in time, you need to make sure you are playing to your own sound that other musicians are hearing. More information on this, and a way of testing your setup to make sure you are obeying this “Golden Rule” [can be found here](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

Of course, if you are playing an acoustic instrument, or are a singer, it will be hard to exclude your “local” sound. But you should at least try to do so by for example using closed-back headphones turned up as loud as you are able to mask your own sound. This will let you concentrate on the mix coming back to you from the server.

### Do I need a fast Internet connection?

No, especially if you don't run a server to host other musicians. Having a low ping is more important. For most people on standard broadband (e.g. 10 Mbit/s down and 1 Mbit/s up) you will have no problems. For those running servers at home, depending on how many people join, you may encounter issues if your _upstream_ bandwidth is lower than about 5 Mbit/s. 

### Do I need to run a server?

No. If you just intend to connect to other people’s servers, then all you need is a client. [Read this if you think you need to run your own server](/wiki/Running-a-Server).

### How does Jamulus work (in general)?

<img src="{{site.url}}/assets/img/en-screenshots/diagram-overview.png" loading="lazy" alt="Diagram showing how Jamulus works">


Jamulus works on the client-server principle. Everybody’s audio is sent to a server, mixed and processed there. Afterwards, the audio is sent back to each client. If a server is made public and registered on a public directory, its information will be broadcast to all clients.

### Why doesn't Jamulus provide video support?

Adding video support adds a lot of complexity. You can use other software like Jitsi or Zoom if you want to see others when playing (or have an "audience"), but the video will be significantly behind the Jamulus audio.


## Server FAQ

### Why do public servers not need port forwarding?

Normally, network address translation (NAT) firewalls prevent incoming requests initiated from outside the local network. Inbound traffic is only possible for packets relating to an outbound request (strictly speaking, “related” and “established” packets to an initial outbound connection). In public server mode, when your Jamulus server connects to a Directory Server it of course initiates an outbound connection. From then on, the Directory Server sends (established/related) connection “pings” (not ICMP pings) to your server at regular intervals to keep the relevant NAT port(s) open on your router/firewall.

However, in private mode, clients have to **initiate** connections into the server’s network. NAT firewalls prevent this, so you need to tell them to allow incoming connection requests on the Jamulus port using port forwarding.


