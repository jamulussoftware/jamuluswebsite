---
layout: wiki
title: "Installation for Windows"
lang: "en"
permalink: "/wiki/Installation-for-Windows"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation for Windows

Make sure you read the [Getting Started](Getting-Started) page.
1. **Download and install an ASIO Driver**. It is recommended to use a sound card/interface with a native ASIO driver. If you don't have an external sound card, you probably need to install a generic driver like ASIO4ALL. For more information scroll down to the [ASIO](#asio) section.
1. [Download Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
 **Mirror 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Install Jamulus**: Double click the installer to launch it. If you get a warning notice from SmartScreen, click on "More info" and "Run anyway" to install Jamulus. (If you grabbed a new version of Jamulus and are one of the first people who downloaded it, Jamulus won't be whitelisted by SmartScreen yet. We don't pay for code signing.)
1. **Run Jamulus**. Now you should be able to use Jamulus just like any other application.
1. **Set up your sound card**. When you're done, you need to set up your audio hardware. Have a look at how to set up ASIO4ALL if you're using that and/or [Hardware Setup](Hardware-Setup).

***

## ASIO

Jamulus uses [ASIO](https://en.wikipedia.org/wiki/Audio_Stream_Input/Output) to provide the lowest latency.
* If you own an external sound card/audio interface, use its official ASIO driver (they usually provide the best quality).
* If you don't have an external sound card, you will probably not have an ASIO driver. Therefore, you will need to install a generic one like ASIO4ALL:

You can try two versions of ASIO4ALL. ASIO4ALL v2.14 includes a workaround for a bug which might break other functionality.

[ASIO4ALL v2.15 Beta 2 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta2_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### Setting up ASIO4ALL

*ASIO4ALL is not recommended if your sound card/audio interface provides its own ASIO driver, since that might have better latency.*

For ASIO4ALL, you may or may not need to experiment a bit depending on your sound hardware. If everything works out of the box, you don't need to do anything.

**Tip:** Set up your sound card while you're [connected to a server](Getting-Started#connecting-to-a-server-and-testing-your-sound) to hear your instrument or voice and check if everything is correctly set up; but first read on.


Before you start with Jamulus:
1. **Close all applications** (especially those which could access your sound card like your browser/media player). ASIO4ALL needs exclusive access to your sound card which means that other programs will not be able to use audio if ASIO4ALL and Jamulus are running.
1. If the Jamulus audio doesn’t work out of the box, make sure that only the **correct inputs/outputs** in ASIO4ALL **are switched on**. Everything else should be switched off. Search the [community list of working ASIO4ALL configurations](/kb/2021/03/20/ASIO4ALL-Examples.html) for your configuration or do it manually if you can't find yours:

### How to set up ASIO4ALL inputs (Guide)

1. Open Jamulus's settings
1. Go to _"ASIO Device Settings"_ (column on the left; directly under the selection of the driver)
1. Enable _advanced view_ in ASIO4ALL (click the tool icon on the bottom right)
1. Enable only the sound card you want to use by clicking on the button next to its name
1. Open your sound card inputs/outputs by clicking the _plus icon_ next to this sound card
1. Now enable the correct inputs/outputs in the list under your sound card and disable everything else. You can hover over the inputs/outputs to see which of both they are and if they support the required sample rate for Jamulus of 48kHz (DVD quality).

**Hints:**
1. Many internal sound cards are named Realtek High Definition Audio, Conexant or similar.
1. Headphones and speakers are often labelled as output and microphones as inputs or capture.
1. Stereo Mix/Stereo Input is usually not the input/output you're looking for. Therefore, switch it off if you see it.

### Having trouble setting up ASIO4ALL?

If nothing works, first restart Jamulus and/or your PC to close background processes that may be accessing your sound card.

Afterwards, *set up the inputs/outputs again*. Enabled and accessible input/outputs show as lit up power buttons and play buttons. If instead you see a red cross or yellow symbol, close other applications that may be accessing your sound card (e.g. browser, Zoom, etc).

Have a look at [this video](https://youtu.be/_GzOsitVgLI) by [trombonepizza](https://github.com/trombonepizza) which gives more detailed setup information on ASIO4ALL.

Official and further information about how to configure ASIO4ALL is documented in the official [ASIO4ALL FAQs on the ASIO4ALL website](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"}.

## All installed?

Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Getting-Started){: .button}
