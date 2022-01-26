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
3. This guide is not complete. I'm happy if you update, enhance or even re-write it. Curently there are some issues with JACK automatically disconnecting if one isn't connected to a Jamulus server.

### What to install?
1. ASIO Bridge [get it from VB-Audio](https://vb-audio.com/Cable/). The link is further down on the site. Don't be tricked to think you need to donate to download the software. Basically this software gets Windows Audio and converts it to ASIO
2. JACK for Windows [get it from the JACK audio page](https://jackaudio.org/downloads/). You need select a full installation with "JACK-Router". This will be asked during the installation settings. This is basically the software where all the cables come together. If you need help with JACK, it's worth reading the [JACK FAQ](https://jackaudio.org/faq/jack_on_windows.html) on their website.

Optionally, you can also install the Jamulus JACK version for Windows, instead of the normal ASIO one. This might give you a more native experience. You can [download the Jamulus JACK version for Windows here]({{ site.download_root_link }}{{ site.download_file_names.windows-jack }})).

### Setting everything up
After having installed everything, you need to set the your system audio to "Hi-Fi Cable Input (VB-Audio Hi-Fi Cable)". This can be done by clicking on the loudspeaker icon at the bottom right of the task bar, clicking on the arrow next to the volume fader and selecting this device:
![Windows 11 Audio settings](https://user-images.githubusercontent.com/20726856/151227279-87337325-e672-4475-bef8-e78ab3cd2441.png)

Now open ASIO Bridge and Qjackctl (you can search for both e.g. in the start menu).

ASIO Bridge looks like that:

![ASIO Bridge](https://user-images.githubusercontent.com/20726856/151228307-b3d76309-b5be-4a7d-8040-3c430a822f4d.png)

In ASIO Bridge, click on ASIO Device in ASIO Bridge and select JackRouter. This enables you to get the sound you play into "Hi-Fi Cable Input (VB-Audio Hi-Fi Cable)" you selected a few minutes ago into JACK. Remember the cable analogy I mentioned?

Let's have a look at JACK:

You will mostly control the Audio flow in JACK (or QjackCtl, the software you can see in the screenshot). Select Setup in the QjackCtl software to connect your Audio interface or ASIO4All:

![QjackCtl](https://user-images.githubusercontent.com/20726856/151229013-76b8e4a8-65bd-4e79-97af-8f31c473c496.png)

In the QjackCtl Setup dialog choose the sound hardware you want to use (e.g. your interface, ASIO4ALL,...). That's what you'd normally set up in Jamulus as "device". You should also use ASIO here:

![QjackCtl audio setup](https://user-images.githubusercontent.com/20726856/151229690-55f02313-7dde-4950-9f66-b78e5704ed82.png)

Ensure the Sample Rate is set to 48000, the driver is portaudio, Frames/Period is set to something low like 64 or 128. You can now close this window with "OK". Next, click on the Start button in Qjackctl and open Jamulus and go into settings. There select "JackRouter" as device:

![Jamulus device settings](https://user-images.githubusercontent.com/20726856/151231033-615dcc9a-5f30-4d0a-b64a-c538d46a387a.png).

Now connect to any server.

Afterwards - if needed click on the "ASIO OFF" button to turn ASIO on in ASIO Bridge. Unfortunately the button is labelled in a confusing way.

Next, you can minimise ASIO Bridge to the taskbar and open the Graph in Qjackctl. This button is at the bottom right:

![Qjackctl open Graph](https://user-images.githubusercontent.com/20726856/151230466-2e6cb323-1639-4911-acea-f9374b0a60f9.png)

Now you'll be able to all the cables I've been talking about:

![Jamulus in Qjackctl](https://user-images.githubusercontent.com/20726856/151231206-3bede3ca-131c-4ec9-a8ae-08bc519e412c.png)

Next, right click on AVCABLE_AsioBridge and click on Disconnect. Do the same with Jamulus and drag and drop the cables by clicking on capture_1 and dragging it to In1 etc., such that the graph looks like that:

![Qjackctl Graph](https://user-images.githubusercontent.com/20726856/151233403-0a749152-54bc-411b-8f30-d20480de44f8.png)

This graph shows you that the audio from "system" (that's your audio interface) gets sent to Jamulus plus the audio coming from ASIO Bridge is mixed into Jamulus. We remember that the audio from ASIO Bridge is your normal Windows audio. So you can now start any Video player, MuseScore, mp3 file and play it while others will be able to hear it via Jamulus. A lot of other things can be done with this setup. You could also start multiple instances of Jamulus, route your system audio into one and your microphone into another instance or similar. 
