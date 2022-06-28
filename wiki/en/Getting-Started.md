---
layout: wiki
title: "Setup"
lang: "en"
permalink: "/wiki/Getting-Started"
---

# Setup - getting started with Jamulus

To get the best from Jamulus, at a minimum you will need:

1. **A wired internet connection** (and turn wi-fi off. See the [FAQ](/wiki/FAQ#why-shouldnt-i-use-wireless-equipment))
1. **Wired headphones** (not Bluetooth or speakers - see the [FAQ](/wiki/FAQ#why-shouldnt-i-use-wireless-equipment))
1. **A reasonable audio device, sound card and/or mic** ([see this list](/kb/2021/01/05/Jamulus-Sound-Devices.html) for examples)

If you have any questions, please see the [Discussions](https://github.com/jamulussoftware/jamulus/discussions)

## Installation

To get Jamulus working with your operating system, please follow the installation guide for your platform:

<div class="fx-row fx-row-start-xs button-container">
    <a href="Installation-for-Windows" class="button fx-col-100-xs">Windows</a>
    <a href="Installation-for-Macintosh" class="button fx-col-100-xs">macOS</a>
    <a href= "Installation-for-Linux" class="button fx-col-100-xs">Linux</a>
</div>
_[Android](Installation-for-Android) and [iOS](Installation-for-iOS) can be used too, but are not officially supported._

And for now, close all other applications. It’s best to start simple at first.

## Hardware Setup

If you use external audio hardware, plug that in before you start Jamulus. If you haven't configured your hardware, please see the installation guides mentioned above.

## Jamulus main window

When you open Jamulus, you will see a window which looks like this:

<figure>
  <img src="{% include img/en-screenshots/main-screen-default.inc %}" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>The main window before you connect to a Server</figcaption>
</figure>


## Setting up a profile

First, let others know who you are. Click on the “Settings” button on the bottom left and go to “My Profile…”. Now you will see this:

<figure>
  <img src="{% include img/en-screenshots/settings-profile.inc %}" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>Let people know who you are</figcaption>
</figure>


Fill in at least “Alias/Name” and close the window.

## Connecting to a Server and testing your sound

Before you connect to a Server, you should **not** be able to hear yourself.  Listening to your sound from Jamulus (and not from yourself) is called “The Golden Rule” and enables you to play in time with others ([see the FAQ](/wiki/FAQ#why-should-i-not-listen-to-my-own-signal)).

**Before playing with others, we recommend that you connect to an empty Server to test your setup**, and make sure you are listening to the signal coming back from the Server (if possible) and not yourself.

Now use the “Connect” button in the Jamulus main window to join a Server. A window will now open:

<figure>
  <img src="{% include img/en-screenshots/connection-setup-window.inc %}" loading="lazy" alt="Screenshot of the connection window" style="border: 5px solid grey;">
  <figcaption>Connect to a Server</figcaption>
</figure>

The most important thing about Servers is their “ping time”. The bigger the number, the harder it will be to play in time with others. Usually, you would select a Server with a ping of less than 50ms if you can.

Once connected to a Server, make sure you can hear yourself OK and fix any input volume or other problems. You can have a look at the [troubleshooting page](/wiki/Client-Troubleshooting) for common problems. And of course, check that you are also able to obey [The Golden Rule](/wiki/Client-Troubleshooting#you-all-sound-ok-but-its-difficult-to-keep-together).

## Playing for the first time

With your sound all set up, you are ready to go. When you connect to a Server (you may want to select a genre from the list), the faders you see on the right are your own personal mix. Everything you change here will change what you hear, but won’t affect others. If you move a fader down, that channel will be quieter, if you move it up, the channel will be louder for you.

<figure>
  <img src="{% include img/en-screenshots/main-screen-medium.inc %}" loading="lazy" alt="Screenshot" style="border: 5px solid grey;">
  <figcaption>The main window when you are connected to a Server</figcaption>
</figure>

If you don’t want others to hear your audio, click on the “Mute Myself” button which will stop your audio from being sent to other people. They won’t be able to tell you have done this though. But if you see a “mute” icon above a fader, that means they can’t hear you because they've muted your channel in their mix.

Note that you can use the Chat facility at any time to message other people while you are connected. The welcome message in the chat may also state some guidelines for use.

More information about using Jamulus can be found in the [Software Manual](/wiki/Software-Manual).

## Troubleshooting

Having audio trouble? Can't see Servers, or some other issue? Have a look at the [Troubleshooting page](/wiki/Client-Troubleshooting), or feel free to ask in the [Discussions](https://github.com/jamulussoftware/jamulus/discussions).
