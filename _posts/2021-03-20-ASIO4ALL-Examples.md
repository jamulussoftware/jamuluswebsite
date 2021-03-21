---
layout: post
title: "ASIO4ALL Configuration Example Screenshots"
heading: "ASIO4ALL Configuration Example Screenshots"
author: "npostavs"
lang: "en"
---

This page is a collection showing working example ASIO4ALL configurations.
<!--more-->

### Realtek High Definition Audio

Note that the "Stereo input" is really a virtual microphone that
corresponds to the sound being played into the speakers/headphones, it
must be turned off in ASIO4ALL.

![ASIO4ALL configured for Realtek
HD](https://github.com/npostavs/jamulus/releases/download/r3_6_2/asio4all-realtek.png)

### Realtek High Definition Audio with SPDIF subdevices

Similar to the previous, but there are more subdevices (corresponding
to different types of physical audio jacks).

![ASIO4ALL configured for Realtek HD with 5
subdevices](https://github.com/npostavs/jamulus/releases/download/r3_6_2/realtek-spdif.jpg)

### Intel SST with Realtek(R) Audio

The Realtek device again has a "Stereo input" virtual microphone.  We
need two screenshots to see all of the active devices expanded.

![ASIO4ALL configured for Intel SST & Realtek
devices](https://github.com/npostavs/jamulus/releases/download/r3_6_2/intel-sst+realtek.png)

### High Definition Audio device
This one is simple, since there's only one choice for each of input
and output.

![ASIO4ALL configured for HD Audio
device](https://github.com/npostavs/jamulus/releases/download/r3_6_2/hidef-audio.png)

### Conexant ISST

Conexant's "Stereo mix" is similar to Realtek "Stereo input".

![Conexant ISST Audio](https://user-images.githubusercontent.com/20726856/111084554-472df880-8513-11eb-886c-d5d836b7b9f7.png)
