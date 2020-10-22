---
layout: wiki
title: "Getting Started"
lang: "en"
permalink: "/wiki/Getting-Started"
---

# Getting Started with Jamulus

## You will need

1. **A computer** running either **Windows 10**, **MacOS X** El Capitan (v10.11) or higher, or **Linux**.
1. **A wired internet connection** (don't use Wi-Fi, it will cause sound problems). Most broadband connections will be fine ([full details here](Quality,-delay-and-network-bandwidth)). If you have 10Mbits down and 1Mbps up, you're unlikely to run into bandwidth-related issues.
1. **Wired headphones - not speakers** to prevent echo or feedback and (particularity if singing or playing acoustic instruments) to make sure you keep in time with others (see the [note on this](Getting-Started#having-trouble-cant-keep-in-time) for why).

### Highly recommended: an audio interface!

Unless you are a musician with a (USB) microphone, then to avoid latency you are strongly advised to use an audio interface: a box that you can plug your instrument(s) into rather than using your computer's built-in sound card. The interface will connect to your PC usually via USB. See [Hardware Setup](Hardware-Setup).

### Minimise interruptions!

Minimizing "latency" (signal delay) is crucial for playing successfully together. While using Jamulus, try to make sure that nothing else on your machine or your network is competing against it. Don't watch YouTube/Netflix, or have anything else running on the machine that you are using Jamulus on.

#### Ping time!

Always connect to servers with the **lowest ping times** as shown in your server list. 15ms or below will give you the best chance of having a good time (although there's other things that affect performance too). Anything higher and you're taking your chances.

## Ready? Install Jamulus!

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">For Windows users</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">For macOS users</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">For Linux users</a>
</div>
[Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/)

Run Jamulus on any computer using a USB stick (64-bit systems only). Checks your hardware and sets you up like a boss straight out of the box!

## All installed?

If you set up Jamulus, have a look [Hardware Setup](Hardware-Setup)

For detailed information on using Jamulus, please see the [Help Manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

**Also [this excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) by [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a)** (_Facebook_)

## Having trouble? Can't keep in time?

**ONLY. LISTEN. TO. THE. SIGNAL. FROM. THE. SERVER!**

Or put another way, do **not** listen to your direct signal.

This is obviously hard for singers and some acoustic musicians, but even if your connection is good, when players aren't listening to their **own signal coming back from the server**, your synchronisation **will** suffer. _(For the avoidance of doubt: this has nothing to do with the "mute" controls in Jamulus.)_

Further information about how to avoid listening to yourself (and help with other problems) can be found in the [Troubleshooting FAQ section](Client-Troubleshooting) (_currently under construction_)

## How Jamulus works (in general)

**Here's how millions of people are using Jamulus to play, sing and teach music with other people in real time, all over the world:**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus works on the client server principle. Everybody’s audio is sent to a server, mixed and processed there. Afterwards the audio is sent to every client. If a server is made public and registered on a central server, its information will be broadcasted to all clients._
