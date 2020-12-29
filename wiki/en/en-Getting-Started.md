---
layout: wiki
title: "Getting Started"
lang: "en"
permalink: "/wiki/Getting-Started"
---

# Getting Started with Jamulus

## You will need

1. **A computer** running either **Windows 10**, **macOS** (**MacOS X** El Capitan v10.11 or higher), or **Linux**.
1. **A wired internet connection** (don't use Wi-Fi, it will cause sound problems). Most broadband connections will be fine[^1].
1. **Wired headphones - not speakers** to prevent echo or feedback and to minimize delay[^2].

## Maximise quality, minimise delay

### 1. Minimize internet traffic and close all programs on your PC

Try to make sure nothing on your machine or your network (like a video stream) is competing against Jamulus when you are using it.

### 2. Use an audio interface/external microphone, not your internal sound card

We strongly recommend – although you could start without it – to use an audio interface (a box you plug a microphone/instrument into and connect to your PC e.g. via USB) to enjoy higher quality sound with low latency in Jamulus. You can also use a USB microphone. See [recommended hardware](#recommended-hardware).

### 3. Connect to the servers with the lowest ping times

Servers shown on the list with 15ms or below will give you the best chance of having a good time (although there's other things that affect performance too). Anything higher and you're taking your chances.

Now that you have the basics down, let's go:

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Install on Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Install on macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">For Linux users</a>
</div>

Also - [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Run Jamulus on any computer using a USB stick (64-bit systems only). Checks your hardware and sets you up like a boss straight out of the box!

## Recommended hardware

In general, your device must support a sample rate of **48kHz** (DVD quality) and should allow you to listen to the computer's audio signal. On Windows it's recommended to choose a device with a native [ASIO](https://en.wikipedia.org/wiki/Audio_Stream_Input/Output) driver.

See [the list of known good hardware](Sound-Devices).

## Other guides
* [This excellent guide](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} by [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) might also be worth a view.

## Having trouble? Can't keep in time?

**ONLY. LISTEN. TO. THE. SIGNAL. FROM. THE. SERVER!**

Or put another way, do **not** listen to your direct signal.

This is obviously hard for singers and some acoustic musicians, but even if your connection is good, when players aren't listening to their **own signal coming back from the server**, your synchronisation **will** suffer. _(For the avoidance of doubt: this has nothing to do with the "mute" controls in Jamulus.)_

Further information about how to avoid listening to yourself (and help with other problems) can be found in the [Troubleshooting FAQ section](Client-Troubleshooting) (_currently under construction_)

## How Jamulus works (in general)

**Here's how millions of people are using Jamulus to play, sing and teach music with other people in real time, all over the world:**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus works on the client server principle. Everybody’s audio is sent to a server, mixed and processed there. Afterwards the audio is sent to every client. If a server is made public and registered on a central server, its information will be broadcasted to all clients._

## Footnotes
[^1]: [Full details here](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. If you have 10 Mbit/s down and 1 Mbit/s up, you're unlikely to run into bandwidth-related issues.
[^2]: Bluetooth headphones usually have too much latency. That's one reason why wired headphones are required. Particularity if singing or playing acoustic instruments to make sure you keep in time with others only use headphones (see the [note on this](Getting-Started#having-trouble-cant-keep-in-time) for further information).
