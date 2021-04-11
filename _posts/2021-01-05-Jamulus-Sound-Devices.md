---
layout: post
title: "Audio devices for Jamulus"
lang: "en"
heading: "Sound devices"
lang: "en"
---

### You can of course use Jamulus with your computer's built-in sound card or microphone.

However, most people choose to use specialist audio interfaces. These either help you play in time better with better latency, or have more features. Most are quite inexpensive and easy to set up, and will usually perform better than "stock" hardware.

Thanks to Jamulus users, this page lists audio devices known to work (or not) with Jamulus.
<!--more-->

_**Note**: Whether these work or not can depend on your operating system (Linux, MacOS, Windows, etc.)_.

## Updating this page

You can update this page with the information you have. **Please indicate the platform(s) you are using!** Just [edit this page and wait for an approval](https://github.com/jamulussoftware/jamuluswebsite/edit/release/_posts/2021-01-05-Jamulus-Sound-Devices.md).

## Audio devices known to work with Jamulus

### USB/USB-C devices

#### Microphones / DI Boxes

**[Blue Yeti](https://www.bluemic.com/en-us/products/yeti/)**, USB Microphone

**Windows**: Works well *with ASIO4All*; a bit more latency than under macOS. You can disable local monitoring by going deep into the settings.

**macOS**: Works well. (There is a check option to disable local monitoring).

**Linux**: Latency is good. You can't disable local monitoring (or we haven't found out how to do it, feel free to add this information if you know how to do it).

***

**[Marantz MPM-1000U](https://www.marantzpro.com/products/view/mpm-1000u)**, low-cost USB Microphone 

**Windows**: Needs *ASIO4All*. Probably a bit more latency than under macOS.

**macOS**: Not yet tested.

**Linux**: Not yet tested.

***

**[Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface)**, USB to XLR audio interface with headphone jack connector that converts a wired microphone to a USB microphone.

**Windows**: Set the PC/Mix dialog box to 100% PC to listen to Jamulus' mix on the headphone output.

**macOS**: not yet tested.

**Linux**: Tested with a Raspberry Pi 4 under *Raspberry Pi OS Buster*, kernel version 4.19.

***

**[Behringer UGC102](https://www.behringer.com/behringer/product?modelCode=P0198)**, Guitar-to-USB Interface  (guitar and bass)

**Windows**: not yet tested.

**macOS**: This device appears as "USB Audio Codec". When selected for input and output in Jamulus, the **UGC102** headphone jack is the output (and cannot be used for input).

**Linux**: not yet tested.



#### Audio interfaces / digital mixing consoles

**[Solid State Logic SSL2+](https://www.solidstatelogic.com/products/ssl2-plus)**, USB-C/USB digital audio/MIDI interface 2 in/4 out

**Windows**: Works great with the [native ASIO driver](http://eu1.download.solidstatelogic.com/SSL%202/SolidStateLogic_UsbAudio_v4.67.0_2019-10-21_setup%20(3).exe).  

**macOS**: Works great (not tested on Big Sur).

**Linux**: Works great (Tested on Ubuntu 20.04 and Raspberry Pi OS (Buster))

The monitoring of the Jamulus mix is done by moving the "MONITOR MIX" completely to the right to "USB". See the [official manual](http://eu1.download.solidstatelogic.com/2%20Plus%20/SSL%202%20Plus%20User%20Guide_ENGLISH.pdf).

***

**[Ammoon AGM02](https://www.ammoon.com/p-i3974.html)** and **[Ammoon AGM04](https://www.ammoon.com/p-i4049.html)**, low-cost USB 2-channel and 4-channel compact mixing consoles

**Windows**: Works. Tested *AGM02*. On Windows 10, with ASIO4ALL, the **AGM02** can be used as an input, and the onboard audio as the output. There is no way to monitor only the USB return signal on the **AGM02**.

**macOS**: Both tested on **macOS Catalina**.

**Linux**: Not yet tested.

_**Note:** The Ammoon AGM04 appears to be a re-branded [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/)._

**ART USBMix4**, USB 4-channel compact mixing console (_see above_)

***

**[Audient EVO 4](https://evo.audio/products/evo-4/overview/)**, USB digital audio interface 2-in/2-out

**Windows**: Should work

**macOS**: Should work

**Linux**: Not yet tested.

[Driver installation and download](https://evo.audio/driver-installation/)

***

**[Behringer UCA222](https://www.behringer.com/product.html?modelCode=P0A31)** & **Behringer UCA202 U-Control**, 2-in/2-out USB Audio Interface with Digital Output

**Windows**: [ASIO4ALL](http://www.asio4all.org/) driver works OK but not great. There is also the [native driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) which Behringer withdrew support for a while ago, and therefore removed from their download section.

**macOS**: Works better than on Windows.

**Linux**: Works better than on Windows.

** Please note: Ploytec, a German company have developed a very low latency alternative to ASIO4ALL and the native Behringer driver for both Windows and Mac. It is capable of latency in the 2 ms range. Their software driver is somewhat expensive at $60, but you can download and try it out to see if it is worth the money for your situation. The demo download can be found at: 
https://www.usb-audio.com/download/

***

**[Behringer UMC202HD](https://www.behringer.com/product.html?modelCode=P0BJZ)**, **UMC204HD**, and **UMC404HD** USB digital audio interfaces. Affordable. Behringer provides native ASIO drivers for Windows.

**Windows**: Works great. [ASIO driver Windows 7 to 10](https://mediadl.musictribe.com/download/software/behringer/UMC/UMC-Driver_4-59-0.zip)

**macOS**: Works great (measured interface latency with Oblique Audio RTL Utility, 48000 64 samples and cable from output to input on Mac OS X Big Sur: `10.625ms`. Note this is **only the interface latency** not the latency in Jamulus)

**Linux**: Works great (measured interface latency of UMC202HD with `alsa_delay hw:1 hw:1 48000 64 2` and cable from output to microphone input on Debian 10: `8.451 ms`. Note this is **only the interface latency** not the latency in Jamulus)

***

**[Behringer X32](https://www.behringer.com/behringer/product?modelCode=P0ASF)** X-USB digital mixing desk 32-in/32-out

**Windows**: Should work.

**macOS**: Should work.

**Linux**: Not yet tested.

***

**[Behringer XR18](https://www.behringer.com/product.html?modelCode=P0BI8)** (XR serie), USB digital mixing consoles

**Windows**: Should work.

**macOS**: Should work.

**Linux**: Not yet tested.

***

**[Berhinger XENYX series](https://www.behringer.com/series.html?category=R-BEHRINGER-XENYXSERIES)**, USB digital audio interfaces

**Windows**: Works, but not great. The [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) does not appear to be very good. Audio latency with this "unsupported" driver seems poor - not better than ASIO4ALL.

**macOS**: Works great.

**Linux**: Works great.

Tested Behringer XENYX X1832 USB (USB audio) on Ubuntu 20.04 LTS which works fine.
_More testing required._

***

**[Focusrite Scarlett range](https://focusrite.com/en/scarlett)**, USB digital audio interfaces

**Windows**: Works great. If you have issues with the buffer size going to 136, download the updated driver version `4.64.15.598` from [http://beta.focusrite.com/](http://beta.focusrite.com/)

**macOS**: Works great. (measured interface latency with Oblique Audio RTL Utility, 48000hz, 64 samples and cable from output to input on Mac OS X: around `7.5ms`. Note this is **only the interface latency** not the latency in Jamulus)

**Linux**: Not tested, but should work great.

***

**[iConnectAUDIO4+](https://www.iconnectivity.com/products/audio/iconnectaudio4plus)**, Discontinued USB digital audio interface

**Windows**: Provides [ASIO drivers](https://www.iconnectivity.com/downloads).

**macOS**: Should work.

**Linux**: Not yet tested.

***

**[Lexicon Omega](https://lexiconpro.com/en/products/omega)**, USB digital audio interface

**Windows**: There is an ASIO driver which does not allow to use 64 samples buffer size and adds some latency.

**macOS**: Should work.

**Linux**: Not yet tested.

***

**[M-audio M-track Solo/Duo](https://m-audio.com/m-track-solo, https://m-audio.com/m-track-duo)**, 48-KHz, 2-channel USB Audio Interface

**Windows**: Works both with dedicated driver (M-Track Solo and Duo Windows Driver v1.0.3) and ASIO4ALL 2.15 Beta 1 with 64 sample buffer size. However, the ASIO4ALL driver results in lower delay of about 5 ms and less audio device buffer jitter.

**macOS**: Works out of the box.

**Linux**: Not yet tested.

***

**[Native Instruments Komplete Audio 2](https://www.native-instruments.com/en/products/komplete/audio-interfaces/komplete-audio-1-audio-2/)**, USB digital audio interface

**Windows**: Tested on *Windows 10* with 64 sample buffer and am getting great sound and total latency around 15ms over the ping time.

**macOS**: Should work.

**Linux**: Not yet tested.

***

**[Presonus Studio 24C](https://www.presonus.com/products/Studio-24c)** USB digital audio interface

**Windows**: Works great with provided ASIO driver. (measured interface latency with Oblique Audio RTL Utility, 48000hz, 64 samples and cable from output to input on Mac OS X Big Sur: `4.1ms`. Note this is **only the interface latency** not the latency in Jamulus)

**macOS**: Works great.

**Linux**: Not yet tested.

***

**[Steinberg UR22C](https://new.steinberg.net/audio-interfaces/ur22c/)** USB-C/USB3 digital audio interface

**Windows**: Provides ASIO Driver. Not yet tested.

**macOS**: Works directly on *macOS* with a beautiful sound even with un-balanced jack.  

**Linux**: Works on a *Raspberry PI4* provided `jackd` version used is the one from `/usr/bin` (Tweaking `raspijamulus.sh`).

***

**[Steinberg UR22 MKII](https://www.steinberg.net/en/products/audio_interfaces/ur_series/models/ur22mkii.html)**, USB digital audio interface

**Windows**: Works (great ?) on Windows.

**macOS**: Not yet tested.

**Linux**: Works (great?) on Linux.

Sounds great, can achieve 32 frame buffer and works on *Windows* and *Linux*.  

***

**[Yamaha AG03](https://usa.yamaha.com/products/music_production/interfaces/ag_series/index.html)**, USB digital audio/MIDI interface

**Windows**: Tested on *Windows 10* with 64 sample buffer and am getting great sound and total latency around 15ms over the ping time.

**macOS**: Should work

**Linux**: Not yet tested.

***

**[ZOOM LiveTrak L-8](https://zoomcorp.com/en/us/digital-mixer-multi-track-recorders/digital-mixer-recorder/LIVETRAK-L-8/)**, Mixer

**Windows**: Latency is around 19ms (measured with local server with ping time of 0 ms) using "L-8 Driver" (ASIO, 07/02/2020) from [zoomcorp.com](https://zoomcorp.com/). Driver can be downloaded from link to device and clicking "Support & Downloads".

**macOS**: Not yet tested

**Linux**: Not yet tested

***

#### Amp modelers/effects pedals for instruments

**[Line 6 HX Stomp](https://line6.com/hx-stomp/)**, USB multi-effects pedal for guitar

**Windows**: not yet tested.

**macOS**: See [Remote Jam with Helix and Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) for settings on a Mac.

**Linux**: not yet tested.

#### Digital recorders

**Tascam DR-07X** stereo recorder with USB audio into computer, headphones in line-out of the recorder.

**Windows**: Can also be used with an external mic in the line-in (had to use a pre-amp with that).

**macOS**: should work.

**Linux**: not yet tested.

**Tascam DR-40X** stereo recorder as above. Set "Monitor" to "PC/Mac". **Linux Ubuntu 18.04**.

***

**[Zoom H4](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h4/)**, USB portable recorder

**Windows**: Works well.

**macOS**: Works well.

**Linux**: Tested on Raspberry Pi 4. Works well.

***

**[Zoom H2N](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h2n-handy-recorder/)**, USB portable recorder

**Windows**: Latency is around 26ms (measured with local server with ping time of 0 ms) using "Stereo ASIO Driver" (06/02/2020) from [zoomcorp.com](https://zoomcorp.com/). Driver can be downloaded from link to device and clicking "Support & Downloads".

**macOS**: Not yet tested

**Linux**: Not yet tested

***

**[Zoom H2](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h2/)**, USB portable recorder

**Windows**: Latency is around 26ms (measured with local server with ping time of 0 ms) using "Stereo ASIO Driver" (06/02/2020) from [zoomcorp.com](https://zoomcorp.com/). Driver can be downloaded from link to device and clicking "Support & Downloads".

**macOS**: Not yet tested

**Linux**: Not yet tested

***

### FireWire devices

**[Presonus StudioLive 16.4.2 AI](https://www.presonus.com/products/StudioLive-1642AI)** (StudioLive AI series), FireWire digital mixing desk  

**Windows**: Since these devices work with Windows, they should also work with Jamulus.

**macOS**: Works perfectly with Jamulus. Not yet tested on Big Sur. Assign the individual inputs in Jamulus or the corresponding inputs to a stereo auxiliary mix (to be patched in "Universal Control") if more than two channels. Use outputs 17-18 to monitor the Jamulus mix.  

**Linux**: Not tested under Linux, may (or may not) work, see [here](https://forums.presonus.com/viewtopic.php?f=67&t=2717).

***

**[Edirol (Roland) FA-66](https://www.roland.com/global/products/fa-66/)** Firewire digital audio interface

**Windows**: Works well. [ASIO driver download](https://www.roland.com/global/products/fa-66/downloads/)

**macOS**: Works well.

**Linux**: Works well.

***

**[MOTU Ultralite](https://motu.com/products/motuaudio/copy_of_ultralite/body-old.html)** (2010 models MK1/MK2), Firewire digital audio interface

**Windows**: Their page says it should work on Windows.

**macOS**: Tested on MacBook Pro 2015, **Mac OS X** 10.11.6 (El Capitan) with Apple Thunderbolt/FireWire adapter.

**Linux**: Not yet tested. Should work since it's class compliant.

***

### Thunderbolt devices

* **[Focusrite Clarett 4Pre](https://focusrite.com/en/usb-c-audio-interface/clarett-usb/clarett-4pre-usb)**, Thunderbolt 2 digital audio interface  

* **[Resident Audio T4](http://www.residentaudio.com/t4overview)**, Thunderbolt 2 digital audio interface

* **[Universal Audio Arrow](https://www.uaudio.com/audio-interfaces/arrow.html)**, Thunderbolt 3 digital audio interface  
This device provides the **lowest latency**.

* **[Zoom TAC-2](https://zoomcorp.com/en/us/audio-interface/audio-interfaces/tac-2/)**, Thunderbolt 2 digital audio interface

### Internal soundcards

**[HiFiBerry DAC+ ADC (Pro)](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc/)**, Raspberry Pi compatible HAC internal sound card.

**Linux**: Virtually no jitter and good latency (20 milliseconds). No headphone amp, so you'll need one. Used with a mini console [Rolls MX122](https://rolls.com/product/MX22s). Tested on several distributions, kernel versions 4.19, 5.4 and 5.8. (measured interface latency with jack_delay, 48000Hz, 64 samples/buffer, 2 periods, asynchronous mode and cable from output to input, with DSP mode set to low latency in alsamixer: `4.9ms`. Note this is **only the interface latency** not the latency in Jamulus)

**Windows**: Not yet tested (if anybody runs Windows ARM on a Raspberry Pi feel free to test it). Probably no ASIO Driver available.

**macOS**: ?

***

**[Soundblaster Live!](https://en.wikipedia.org/wiki/Sound_Blaster_Live!)**, PCI internal sound card

**Windows**: Works with [kX ASIO driver](https://www.kxproject.com/)

**macOS**: ?

**Linux**: ?

**[Soundblaster Audigy 4](https://en.wikipedia.org/wiki/Sound_Blaster_Audigy#Sound_Blaster_Audigy_4)**, PCI internal sound card  

See above. Not fully verified.

## Audio devices known not to work with Jamulus

* **Zoom B3**, USB amplifier modeling pedal for bass. **Does not support 48 kHz**.

* **Line6 Bass POD**, USB amplifier modeling pedal for bass. **Does not support 48 kHz**.
