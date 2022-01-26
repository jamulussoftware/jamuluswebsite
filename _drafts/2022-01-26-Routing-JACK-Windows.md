---
layout: post
title: "Get computer audio into Jamulus"
lang: "en"
author: "ann0see"
heading: "How to play audio from your PC to Jamulus (using JACK)"
---

This guide explains how to play a mp3 file, YouTube video, MuseScore file or any system audio into Jamulus. We're using JACK for Windows however, it is also possible to use different software like VoiceMeeter Banana, ASIO LinkPro or similar. I assume you already know how to install software or know someone who helps you with that.

<!--more-->
## What should I know?
1. What we're doing here is basically "audio routing". No idea what this means? Basically you can think of using cables connecting multiple devices together until you reach the device you want to use. So you'd lay a cable from YouTube to some software which then converts the audio and sends it to Jamulus.
2. Unfortunately on Windows you'll need multiple pieces of Software to have low latency audio.
3. This guide is not complete. I'm happy if you update, enhance or even re-write it.

### What to install?
1. ASIO Bridge [get it from VB-Audio](https://vb-audio.com/Cable/). The link is further down on the site. Don't be tricked to think you need to donate to download the software. Basically this software gets Windows Audio and converts it to ASIO
2. JACK for Windows [get it from the JACK audio page](https://jackaudio.org/downloads/). You need select a full installation with "JACK-Router". This will be asked during the installation settings. This is basically the software where all the cables come together. If you need help with JACK, it's worth reading the [JACK FAQ](https://jackaudio.org/faq/jack_on_windows.html) on their website.

Optionally, you can also install the Jamulus JACK version for Windows, instead of the normal ASIO one. This might give you a more native experience. You can [download the Jamulus JACK version for Windows here]({{ site.download_root_link }}{{ site.download_file_names.windows-jack }})).

### Setting everything up
