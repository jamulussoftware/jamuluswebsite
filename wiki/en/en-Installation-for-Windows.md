---
layout: wiki
title: "Installation for Windows"
lang: "en"
permalink: "/wiki/Installation-for-Windows"
---

# Installation for Windows
Make sure you read the [Getting Started](Getting-Started) page.
1. **Download and install an ASIO Driver**. It is recommended to use a sound card/interface with a native ASIO driver. If you don't have an external sound card, you probably need to install [this free ASIO driver (ASIO4ALL)](https://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} before installing Jamulus.
1. [Download Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: .button target="_blank" rel="noopener noreferrer"}
1. **Install Jamulus**: Double click the Jamulus installer. If you get a warning notice from SmartScreen, click on "More info" and "Run anyway" to install Jamulus. This is needed since we don't pay for code signing yet.
1. **Run Jamulus**. Now you should be able to use Jamulus just like any other application.
1. **Setup your sound card**. When you're done, you need to setup your audio hardware. Have a look at how to setup ASIO4ALL if you you're using that and/or [Hardware Setup](Hardware-Setup).

***

## ASIO
To provide the lowest latency, Jamulus uses [ASIO](https://en.wikipedia.org/wiki/Audio_Stream_Input/Output). If you don't have an external sound card, you will probably also not have an ASIO driver. Therefore, you will need to install a generic one like ASIO4ALL which you can [download from the official ASIO4ALL website](https://www.asio4all.org/). If you own an external sound card/audio interface, you should check for an official ASIO driver and use it since they usually provide better quality.

### Setting up ASIO4ALL
*ASIO4ALL is not recommended if your sound card/audio interface provides its own ASIO driver, since that might have better latency.*

For ASIO4ALL, you may need to experiment a bit to find the right configuration since every computer is a bit different.

**Tip:** Setup your sound card while you're [connected to a server](Onboarding#2-connecting-to-a-server) to hear your instrument or voice and check if everything is correctly setup, but first read on.

Before you start with Jamulus:
1. **Close all applications** (especially those which could access your sound card like your browser/media player) since Jamulus needs exclusive access to your sound card. Other programs will not be able to use audio if ASIO4ALL and Jamulus is running.
1. If the Jamulus audio doesn’t work out of the box, make sure that only the **correct inputs/outputs** in ASIO4ALL **are switched on**. Everything else should be switched off. This can be done as follows:

### How to setup ASIO4ALL inputs (Guide)

1. Open Jamulus's settings
1. Go to _"ASIO Settings"_ (column on the left)
1. Enable _advanced view_ in ASIO4ALL (click the tool icon on the bottom right)
1. Enable only the sound card you want to use by clicking on the button next to its name
1. Open your sound card inputs by clicking the _plus icon_ next to this sound card
1. Now enable the correct inputs/outputs in the list under your soundcard and disable everything else

**Hint:** Many internal sound cards are named Realtek High Definition Audio, Conexant or similar.

Concerning the inputs/outputs: Headphones and speakers are often labelled as output and microphones as inputs or capture. Stereo Mix is usually not the input/output you search for, therefore you can switch it off, if you see it.

### Having trouble with ASIO4ALL setup?

If nothing works, first of all try to **restart Jamulus and/or your PC**.
Afterwards try to **setup the inputs/outputs again**. Enabled and accessible inputs/outputs show a lit up on/off button and a play button. If you see a red cross or a yellow symbol, you might need to close other applications like your browser, Zoom, ...

Have a look at [this video](https://youtu.be/_GzOsitVgLI) from [trombonepizza](https://github.com/trombonepizza) which gives more detailed setup information on ASIO4ALL.

Official and more detailed information about how to configure ASIO4ALL is documented in the official [ASIO4ALL FAQs on the ASIO4ALL website](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} and in the [ASIO4ALL manual here](https://www.asio4all.org/ASIO4ALL%20v2%20Instruction%20Manual.pdf).
(The manual can also be found on your desktop or in the folder where the ASIO4ALL binary is installed (usually `C:\Program Files (x86)\ASIO4ALL v2\`)).

## All installed?

Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Onboarding){: .button}
