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

No. Musicians on a Jamulus Server play in real time together as they would in person. If you want a time signal, there are shared metronome solutions on the Internet you can try. But it’s probably best to just minimise latency so nobody has an overall delay more than about 30-50 ms.

Bear in mind also that all participants should follow [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together) which will also determine whether you can play in time properly.

### How do I know if I can join a Server? Are there rules?

If somebody lists a Server on one of the Directories built into Jamulus, they accept that anyone can play on it. Jamulus has no password protection or other authentication mechanisms. Whilst some Servers may state their policies in the welcome message you will see in the chat window, Jamulus itself does nothing to enforce these.

Note also that Servers do not have to be registered on a Directory in order for Jamulus Clients to connect to them. Server operators can just give out the address of their Servers to those they want to play with, and they can then connect directly. Have a look at [this overview for more information](/wiki/Running-a-Server#server-modes).

### Why shouldn’t I use wireless equipment?

Whether or not you will be able to play in time with other musicians depends mainly on how much latency (delay) you have in your sound signal and whether you are all following [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together). An overall delay much bigger than 50 ms usually makes it too hard to play in time unless you train yourself to do so. Some musicians report they can play in time with delays of up to 70 ms by playing ahead of the beat. But much beyond that and it becomes too difficult unless timing isn’t an important factor in the music or you just want to listen.

So it makes sense to minimise any sources of delay or other problems with the signal. Even fast wi-fi is usually too variable to use for long periods with Jamulus, and Bluetooth headphones and mics usually introduce latencies of about 50 ms or more.

### Why should I not listen to my own signal?

For the same reason as you need to minimise delay in your signal in order to play in time, you need to make sure you are playing to your own sound that other musicians are hearing. More information on this, and a way of testing your setup to make sure you are obeying this “Golden Rule” [can be found here](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

Of course, if you are playing an acoustic instrument, or are a singer, it will be hard to exclude your “local” sound. But you should at least try to do so by for example using closed-back headphones turned up as loud as you are able to mask your own sound. This will let you concentrate on the mix coming back to you from the Server.

### Do I need a fast Internet connection?

No, especially if you don't run a Server to host other musicians. Having a low ping is more important. Most people on standard broadband (e.g. 10 Mbit/s down and 1 Mbit/s up) will have no problems. For those running Servers at home, depending on how many people join, you may encounter issues if your _upstream_ bandwidth is lower than about 5 Mbit/s.

### Do I need to run a Server?

No. If you just intend to connect to other people’s Servers, then all you need is a Client. [Read this if you think you need to run your own Server](/wiki/Running-a-Server).

### How does Jamulus work (in general)?

<img src="{% include img/en-screenshots/diagram-overview.inc %}" loading="lazy" alt="Diagram showing how Jamulus works">


Jamulus works on the Client-server principle. Everybody’s audio is sent to a Server, mixed and processed there. Afterwards, the audio is sent back to each Client. If a Server is registered in a Jamulus Directory, the Server's information will be provided to all Clients using that Directory.

### Why doesn't Jamulus provide video support?

Adding video support adds a lot of complexity. You can use other software like Jitsi or Zoom if you want to see others when playing (or have an "audience"), but the video will be significantly behind the Jamulus audio.


## Server FAQ

### Why do Registered Servers not need port forwarding?

Normally, network address translation (NAT) blocks incoming requests initiated from outside the local network. Inbound traffic is only possible for packets relating to an outbound request (strictly speaking, “related” and “established” packets to an initial outbound connection). In Registered Server mode, your Jamulus Server initiates an outbound connection when it connects to a Directory. From then on, the Directory sends (established/related) connection “pings” (not ICMP pings) to your Server at regular intervals to keep the relevant port(s) open on your router.

However, to reach an Unregistered Server, each Client has to initiate a connection into the Server’s network. A NAT prevents this, so you need to configure your router to allow incoming connection requests on the Jamulus port using port forwarding.
