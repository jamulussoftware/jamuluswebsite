---
layout: post
title: "Using Multiple Audio Interfaces"
heading: "Using multiple Audio interfaces"
lang: "en"
---

It is possible to run Jamulus with multiple Audio Interfaces on all three operating systems. Useful when we need to output an instrument through external audio card for minimal latency and computer microphone for communication. Other use cases may apply.
<!--more-->

### Windows

Under Windows, the best option to run multiple interfaces through Jamulus at the same time is by using a combination of JACK Audio Connection Kit with VoiceMeeter. It can be accomplished with just VoiceMeeter, but I've found that it introduces some undesirable latency and it wasn't supporting 64 frame buffer size correctly as it was producing some noises through my headphones.

**Requirements:**
* [JACK for Windows](https://jackaudio.org/downloads/);
* [Voicemeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (any version will do).

**Steps:**
1. [Install and configure JACK on Windows](https://jackaudio.org/faq/jack_on_windows.html) - Make sure you select your best audio interface in the configuration steps, also add `-r 48000 -p <desired frame buffer size>` to ensure JACK is outputting audio in the required sample rate for Jamulus (48.000Hz). If your frame buffer size is too low for your hardware, you'll need to change it to a higher value;
2. Install and open Voicemeeter;
3. Open configured Jack PortAudio shortcut, Jack Control and Jamulus software;
4. On Voicemeeter, go to HARDWARE OUT and on A1 dropdown list, select JackRouter. On Hardware Input 1 select your computer microphone. You can make your computer microphone have the lowest latency possible by going into _Menu > System Settings/Options..._ and enabling _WDM Input Exclusive Mode_ (if you experience crackling noises while speaking, disable this) and changing the _Engine Mode_ to _Swift_;
5. Make sure the Hardware Input where you selected your microphone is sending sound through A1 by enabling the corresponding button next to the fader;
6. On Jamulus, under Settings, select JackRouter as your Soundcard Device;
7. On Jack Control, if you click the _Connect_ button, you should now see three devices: portaudio (your external audio interface), voicemeeter and jamulus. If Jamulus doesn't appear, try connecting and disconnecting from any server to enable it;
8. To test things out, on Jack Control, connect portaudio and voicemeeter output ports to jamulus input ports, then connect jamulus output ports to portaudio input ports (assuming you'll be using your external audio interface to listen, otherwise you can use voicemeeter to redirect the sound to another device, which I will not cover on this guide). Connect to a server on Jamulus and test it out by speaking into the microphone and playing your instrument. If everything went well you should hear yourself;
9. To make JACK connections permanent, on Jack Control, open the _Patchbay_, add all inputs and outputs available (Add... > Select each Client > Click Add Plug until there's none left) and make the connections you wish to make permanent. This usually goes like connecting both _system_ and _voicemeeter_ outputs into _jamulus_ input, and _jamulus_ output into _system_ input. Once done, save the Patchbay definition and _Activate_ it. Now every time you start jamulus and connect to a server, the connections on JACK should automatically be done.

**Bonus:**

* The Microphone can be muted and it's volume adjusted on VoiceMeeter. Be sure to play with the _VOICE_ graph too (equalization), I find that my voice sounds better if I move it halfway into _Lo_;
* If you're using VoiceMeeter Banana or Potato, you can apply Gate to your microphone (useful to cut undesirable noises when you're not speaking);
* If you set your default playback device under Windows to one of VoiceMeeter's virtual inputs, you can route audio from your computer into JackRouter (and consequently, into Jamulus) by enabling the _A1_ button on the relevant input under _Virtual Inputs_. This is useful if you wish to play some audio through Jamulus (backing tracks, youtube, recordings, etc...)


### MacOS X

[Aggregate devices](https://support.apple.com/en-us/HT202000) lets you do this. Just make sure your Jamulus version is 3.5.3 or higher.


### Linux

On Linux, it is possible to route additional devices to Jack by using alsa_in.

**Requirements:**

* QJackCtl
* alsa

**Steps:**
1. Follow [this tutorial](https://www.penguinproducer.com/Blog/2011/11/using-multiple-devices-with-jack/) to route the desired interface into Jack by using alsa_in.
2. Jamulus should automatically route the JACK configured interface, adjustments can be made through the _Connect_ button.
3. Connect the device configured on step 1 into jamulus input.
4. Use Patchbay as described on Windows section to make connections permanent.
