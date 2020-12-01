---
layout: wiki
title: "Sound Devices"
lang: "en"
permalink: "/wiki/Sound-Devices"
---

# Sound Devices

This page lists (thanks to Jamulus users) the audio devices known to work (or not) with Jamulus.  
_**Note**: depends on how the device works on your system (Linux, MacOS, Windows, etc.)_.

You can update it with the information you have. **Please indicate the platform(s) you are using!**.

## Audio devices known to work with Jamulus

### USB/USB-C devices

#### Microphones / DI Boxes

* **[Blue Yeti](https://www.bluemic.com/fr-fr/products/yeti/)**, USB Microphone  
Works well under **macOS** (there is a check option to disable local monitoring).  
Works well under **Windows 10 with ASIO4All**, a bit more latency than under macOS. You can disable local monitoring by going deep into the settings.  
Latency is good under **Linux**. You can't disable local monitoring (or we haven't found out how to do it, feel free to send us the information if you know how to do it).

* **[Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface)**, USB to XLR audio interface with headphone jack connector that converts a wired microphone to a USB microphone.  
Set the PC/Mix dialog box to 100% PC to listen to Jamulus' mix on the headphone output.  
Tested with a Raspberry Pi 4 under **Raspberry Pi OS Buster**, kernel version 4.19.

#### Audio interfaces / digital mixing consoles

* **[Solid State Logic SSL2+](https://www.solidstatelogic.com/products/ssl2-plus)**, USB-C/USB digital audio/MIDI interface 2 in/4 out  
Works great out of the box, almost better than under macOS, with Jamulus under **Linux Ubuntu 20.04** (ACER Veriton N, i5, 8GB Ram) with [these settings](https://jamulus.io/wiki/Installation-for-Linux#configure-jack-with-qjackctl) (plugged on a USB3 port), recognized as "SSL2+" by `qjackctl`, no or very low latency, very good sound (SSL preamplifier!).   
Same under **macOS** on a Mac Mini (late 2012, i7 / SSD / 8Gb RAM), with more sound dropouts than under Linux (plugged on a USB2 Hub).  
Not yet tested on Windows 10, [native ASIO driver](http://eu1.download.solidstatelogic.com/SSL%202/SolidStateLogic_UsbAudio_v4.67.0_2019-10-21_setup%20(3).exe)   
The monitoring of the Jamulus mix is done by moving the "MONITOR MIX" completely to the right to "USB". See the [official manual](http://eu1.download.solidstatelogic.com/2%20Plus%20/SSL%202%20Plus%20User%20Guide_ENGLISH.pdf).

…

#### Amp modelers/effects pedals for instruments

* **[Line 6 HX Stomp](https://fr.line6.com/hx-stomp/)**, USB multi-effects pedal for guitar  
See [Remote Jam with Helix and Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) for settings on a Mac.

…

#### Digital recorders

* **[Zoom H4](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h4/)**, USB portable recorder
Works well on Mac, PC and Raspberry Pi4

… 

### Firewire devices

* **[Presonus StudioLive 16.4.2 AI](https://www.presonus.com/products/StudioLive-1642AI)** (StudioLive AI series), Firewire digital mixing desk  
Works perfectly with Jamulus under **macOS** (not yet tested on Big Sure). Assign the individual inputs in Jamulus or the corresponding inputs to a stereo auxiliary mix (to be patched in "Universal Control") if more than two channels. Use outputs 17-18 to monitor the Jamulus mix.  
These devices work under Windows, they should work with Jamulus under this OS (not tested).  
Not tested under Linux, may (or may not) work, see [here](https://forums.presonus.com/viewtopic.php?f=67&t=2717).

…

### Thunderbolt devices

* **[Universal Audio Arrow](https://www.uaudio.fr/audio-interfaces/arrow.html)**, Thunderbolt 3 digital audio interface  
This device provides the lowest latency.

…

### Internal soundcards

* **[HiFiBerry DAC+ ADC](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc/)**, Raspberry Pi compatible HAC internal sound card.  
Virtually no jitter and good latency (20 milliseconds). No headphone amp, so you'll need one. Used with a mini console [Rolls MX122](https://rolls.com/product/MX22s). Tested on Raspberry Pi 4 under **Raspberry Pi OS Buster**, kernel version 4.19.

* **[Soundblaster Live!](https://en.wikipedia.org/wiki/Sound_Blaster_Live!)**, PCI sound card
With [kX ASIO driver](https://www.kxproject.com/)

…

## Audio devices known not to work with Jamulus

* **Zoom B3**, USB amplifier modeling pedal for bass. **Does not support 48 KHz**.

* **Line6 Bass POD**, USB amplifier modeling pedal for bass. **Does not support 48 KHz**.


----
TO DELETE AFTER FINISH

#### Audio interfaces

* Ammoon [AGM02](https://www.ammoon.com/p-i3974.html) and [AGM04](https://www.ammoon.com/p-i4049.html) USB mixer: relatively inexpensive 4 channel USB mixers, both tested on MacOS Catalina, the AGM02 tested on Windows 10. On Windows 10, with ASIO4ALL, the AGM02 can be used as an input, and the onboard audio as the output. There is no way to monitor only the USB return signal on the AGM02.  (USB Audio)
**Note:** The Ammoon AGM04 appears to be a re-branded [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/).

* ART USB Mix4 (USB audio interface + 4 channel mixer). 

* Audient EVO 4, [driver download and install](https://evo.audio/driver-installation/) (USB Audio)

* Behringer UCA222 & UCA202 U-Control (USB audio) _Note: Works best on Mac and Linux. On Windows, [ASIO4ALL](http://www.asio4all.org/) driver works OK but not great. There is also the [native driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) which Behringer withdrew support for a while ago, and therefore removed from their download section._

* Behringer UGC102 (USB interface for guitar/bass) _Note: On Mac, appears as "USB Audio Codec" - when selected for input and output in Jamulus, the UGC102 headphone jack is the output (and cannot be used for input)._

* Behringer UMC202HD, UMC204HD, and UMC404HD interfaces, [Windows 7 to 10 ASIO Driver](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip) (USB Audio)

* Behringer X32 digital mixer with X-USB 32-in/32out (USB audio)

* Behringer XENYX 302USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q502USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q802USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip).  This Behringer ASIO Driver does not appear to be very good.  Audio latency with this 'unsupported' driver seems poor - not better than ASIO4all.  It's good device for Mac and Linux, but perhaps not for Windows.  More testing is required.

* Behringer XR18/XR16/XR12 digital mixers (USB Audio)

* Edirol FA-66 (Firewire) - good on Mac, Linux, and Windows [ASIO driver](https://www.roland.com/global/products/fa-66/downloads/)

* Focusrite Clarett 4Pre interface (Thunderbolt 2)

* Focusrite Scarlett interfaces (USB Audio) _Note: if you have issues with the buffer size going to 136, download the updated driver version `4.64.15.598` from [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* HiFiBerry DAC +ADC (HAT). Virtually no jitters and the good latency (20 millseconds). No headphone amplifier, so you'll need one of those. I used a Rolls MX122 mini mixer. Tested using Raspberry Pi 4 running Raspberry Pi OS Buster, kernel version 4.19.

* iConnectivity AUDIO4+ interface (USB)

* Lexicon Omega (USB audio) _Note: Works best on Mac and Linux. There is a driver for Windows but this does not allow to use 64 samples buffer size and adds some latency compared to, e.g., the Mac driver._

* Line 6 Helix Stomp, read [Remote Jamming with Helix and Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) for setup on a Mac. (USB Audio)

* MOTU Ultralite (2010 firewire model mk1/mk2), 2015 MacBook Pro, OS X El Capitan 10.11.6, Apple Thunderbolt/Firewire adapter.

* Native Instruments Komplete Audio 2, Tested on Win10 with 64 sample buffer and am getting great sound and total latency around 15ms over the ping time. (USB Audio)

* Resident Audio T4 (Thunderbolt 2)

* Soundblaster live with kX ASIO driver

* Soundblaster Audigy 4

* Steinberg UR22C (USB3, USBC 32bits 192khz). Works directly on a Mac with a beautiful sound even with un-balanced jack. Works on a Raspberry PI4 provided jackd version used is the one from /usr/bin (Tweaking raspijamulus.sh).  Not tested on PC.

* Steinberg UR22 MKII. Sounds great, can achieve 32 frame buffer and works on Windows and Linux. Not tested on Mac.

* Tascam DR-07X stereo recorder with USB audio into computer,  headphones in line-out of the recorder. It can also be used with an external mic in the line-in (had to use a pre-amp with that). Windows 10.

* Tascam DR-40X stereo recorder as above. Set "Monitor" to "PC/Mac". Ubuntu 18.04.

* Universal Audio Arrow (Thunderbolt 3). Achieved lowest-ever latency with this device.

* Yamaha AG03 (USB audio)

* Zoom H4 (regular USB) - Works also Mac, PC and Raspberry Pi4

* Zoom TAC-2 (Thunderbolt 2)

