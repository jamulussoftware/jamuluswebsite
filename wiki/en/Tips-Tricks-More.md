---
layout: wiki
title: "Tips, Tricks and More"
lang: "en"
permalink: "/wiki/Tips-Tricks-More"
---

# Tips & Tricks
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

##  Learning about remote band rehearsing

Jamulus user [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/) has compiled a massive amount of information relating to [Remote Band Rehearsals](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/) (Google doc), which covers topics such as hardware and software configuration including examples and advice for newcomers to the field. He also includes a section on Jamulus in comparison to other solutions.

##  Using Jamulus audio in Zoom (or other) meeting apps

Several users have reported success allowing a "virtual audience" for a Jamulus session by using [JACK audio](https://jackaudio.org) to route the Jamulus signal through JackRouter to the target application (in this case, Zoom meetings).

You can also use [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) for Windows or [BlackHole](https://github.com/ExistentialAudio/BlackHole) for macOS to route the Jamulus output to multiple destinations, for example to your headphones and the meeting application at the same time.

## Recording Jamulus on Windows with Reaper

Jamulus user [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) has written a [guide to recording the output of Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc) using the ReaRoute add-on for [Reaper](https://www.reaper.fm/). 

## Remote management of recordings

Jamulus user [vdellamea](https://github.com/vdellamea) has written a [web-based remote tool](https://github.com/vdellamea/jamulus-server-remote) for starting and stopping recordings on Linux Servers, allowing you to then download them from your browser. See also [Jamulus Jam Exporter](https://github.com/pljones/jamulus-jamexporter) by [pljones](https://github.com/pljones), which also includes a Server recording recovery script.

## Sharing song/chord sheets

Jamulus user [BTDT](https://sourceforge.net/u/btdt/profile/) has written a system called [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), a web application that allows a "Jam leader" to push song sheets (in PDF format) to "Jammers" in real time using standard web browsers.

## Converting a public Server to a private one on the fly

You can run a public Server long enough for your band to connect, then go private by simply unchecking the 'Make my Server Public' box in the Server GUI. Your band mates will still be connected to the Server until they disconnect. (Thanks to [David Savinkoff](https://github.com/DavidSavinkoff) for this tip!)

## Jamulus client Linux start script

Here's a Linux start script for Jamulus using an old Audigy4 sound card, the large number of available audio faders for which makes it hard to get the correct settings.

This script therefore includes the most important audio fader settings. The second part of the script deals with the JACK connections. I use Guitarix as my guitar effect processor which I plug in in the JACK audio path.

Finally I start Jamulus automatically connecting to the Directory Server.

Here is the script:


~~~
 amixer sset 'Mic' capture 30% cap
 amixer sset 'Mic' playback 0%
 amixer sset 'Line' playback 60% unmute
 amixer sset 'Audigy Analog/Digital Output Jack' unmute
 amixer sset 'Analog Mix' capture 100%
 amixer sset 'Analog Mix' playback 0%
 amixer sset 'Wave' 100%
 amixer sset 'Master' capture 100% cap
 amixer sset 'Master' playback 100%
 amixer sset 'Master' playback 100%
 amixer sset 'PCM' playback 100%
 amixer sset 'PCM' capture 0%
 guitarix &
 /home/corrados/llcon/Jamulus -c myJamulusServer.domain.com &
 sleep 3
 jack_disconnect system:capture_1 Jamulus:'input left'
 jack_disconnect system:capture_2 Jamulus:'input right'
 jack_connect system:capture_1 gx_head_amp:in_0
 jack_connect gx_head_amp:out_0 gx_head_fx:in_0
 jack_connect gx_head_fx:out_0 Jamulus:'input left'
 jack_connect gx_head_fx:out_1 Jamulus:'input right'
 jack_connect Jamulus:'output left' system:playback_1
 jack_connect Jamulus:'output right' system:playback_2
~~~

## Using ctrlmidich for MIDI controllers

The volume fader, pan control and mute and solo buttons in the client's mixer window strips can be controlled using a MIDI controller by using the `--ctrlmidich` parameter (note: only available for use with macOS and Linux using Jamulus version 3.7.0 or higher). To enable this feature, Jamulus must be launched with `--ctrlmidich`. There is one global MIDI channel parameter (1-16) and two parameters you can set for each item controlled: `offset` and `consecutive CC numbers`. Set the first parameter to the channel you want Jamulus to listen on (0 for all channels) and then specify the items you want to control (f = volume fader; p = pan; m = mute; s = solo) with the offset (CC number to start from) and number of consecutive CC numbers. Take the following example:

`--ctrlmidich '1;f0*8;p16*8;s32*8;m48*8'`

Here, Jamulus listens on MIDI channel 1. Volume fader CC numbers start at 0 and there are 8 of them (so end at CC number 7). Pan controls start at CC number 16 and end at 23; Solo 32 to 39 and Mute 48 to 55.

Fader strips in the mixer window are controlled in ascending order from left to right. Continuing with the above example, in strip number 1 (farthest left), the volume fader would be controlled by CC number 0; pan by 16; solo by 32 and mute by 48. As we have specified 8 consecutive controllers for each parameter, this would give us MIDI control over 8 strips (volume, pan, solo and mute in each one) in the mixer window. The next strip would be controlled by 1, 17, 33 and 49, and so forth.

*Note*: Jamulus does not provide feedback on the state of the Solo and Mute buttons, meaning that your controller must keep track and toggle LEDs (if any) to 'on' or 'off' itself.

Make sure you connect your MIDI device's output port to the Jamulus MIDI in port (QjackCtl (Linux), MIDI Studio (macOS) or whatever you use for managing connections). In Linux you will need to install and launch a2jmidid so your device shows up in the MIDI tab in Qjackctl.

