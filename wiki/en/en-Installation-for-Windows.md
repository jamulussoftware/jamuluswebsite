---
layout: wiki
title: "Installation for Windows"
lang: "en"
permalink: "/wiki/Installation-for-Windows"
---

# Installation for Windows
Make sure you read the [Getting Started](Getting-Started) page.
1. **Download and install an ASIO Driver**. It is recommended to use a sound card/interface with a native ASIO driver. If you don't have one, install [this free ASIO driver (ASIO4All)](http://www.asio4all.org)  **before** installing Jamulus.
1. **Download and install Jamulus** from the [Jamulus project page](https://sourceforge.net/projects/llcon/files/). If you get a warning notice, click on "More info" and "Run anyway" to install Jamulus.
1. **Setup your sound card**. When you're done, you need to setup your audio hardware. Have a look at how to setup ASIO4All if you you're using that (scroll down), and afterwards at [Hardware Setup](Hardware-Setup).

You can also [compile your own binary](Compiling) if you feel so inclined.

## Setting up ASIO4All
*ASIO4All is not recommended if your audio interface provides its own ASIO driver, since that might have better latency.*

First of all **close all applications** (especially those which could access your soundcard like your browser) to minimize conflicts. If the audio doesn’t work out of the box, make sure that only the **correct inputs/outputs** in its control panel **are switched on**.
You may need to experiment a bit to find the right ones since every computer is a bit different. Do this while you're connected to a server to hear your instrument or voice and check if everything is correctly setup.

### How to setup ASIO4All inputs (Guide)

1. Open Jamulus's settings
1. Go to _"ASIO Settings"_
1. Enable _advanced view_ in ASIO4All (click the tool icon on the bottom right)
1. Open your soundcard inputs by clicking the _plus icon_ next to the soundcard name.
1. Now enable/disable the correct inputs/outputs

Many internal sound cards are named Realtek High Definition Audio, Conexant or similar.
Headphones and speakers are often labeled as output and microphones as inputs.

### Having trouble with ASIO4All setup?

Although ASIO4All might work out of the box, you might also experience problems with its setup.

If nothing works, first of all try to **restart Jamulus and/or your PC**.
Afterwards try to **setup the inputs/outputs again**. Enabled and accessible inputs/outputs show a lit up on/off button and a play button. If you see a red cross or a yellow symbol, you might need to close other applications like your browser, Zoom, ...

Have a look at [this video](https://youtu.be/_GzOsitVgLI) from @trombonepizza which gives more detailed setup information on ASIO4All.

Official and more detailed info about how to configure ASIO4All is documented in the official [ASIO4All FAQs on the ASIO4All website](http://www.asio4all.org/faq.html) and in the ASIO4All manual. This can most likely be found on your desktop or in the folder where the ASIO4All binary is installed (usually `C:\Program Files (x86)\ASIO4ALL v2\`).

## All installed?
Jamulus has been installed and can be used now. If you haven't set up your audio gear yet, have a look at [Hardware Setup](Hardware-Setup).

For detailed information on using Jamulus, please see the [help manual](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).
