---
layout: wiki
title: "Known Good Devices"
lang: "en"
permalink: "/wiki/Sound-Devices"
---

# Known Good Devices

This page lists hardware known to work or not work with Jamulus (although it may vary between Windows, Mac and Linux). Please update with any new information you have (and indicate the platform(s) you have used).

### Known to Work with Jamulus

#### USB Microphones

* Blue Yeti microphone. Works well on Mac (there is a checkbox to turn off local monitoring). Works OK on Windows with ASIO4ALL but with a bit more latency than on Mac. You can turn off the local monitoring if you go deep into the settings. Latency on Linux is good but I did not find any way to turn off the local monitoring.

* [Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface) XLR to USB audio interface with headphone jack, converting an XLR mic into a USB mic. Set PC/Mic mix dial to 100% PC and listen to the output on headphones. Tested using Raspberry Pi 4 running Raspberry Pi OS Buster, kernel version 4.19.


#### Audio interfaces

* Ammoon [AGM02](https://www.ammoon.com/p-i3974.html) and [AGM04](https://www.ammoon.com/p-i4049.html) USB mixer: relatively inexpensive 4 channel USB mixers, both tested on MacOS Catalina, the AGM02 tested on Windows 10. On Windows 10, with ASIO4ALL, the AGM02 can be used as an input, and the onboard audio as the output. There is no way to monitor only the USB return signal on the AGM02.  (USB Audio)
**Note:** The Ammoon AGM04 appears to be a re-branded [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/).

* ART USB Mix4 (USB audio interface + 4 channel mixer).

* Audient EVO 4, [driver download and install](https://evo.audio/driver-installation/) (USB Audio)

* Behringer UCA222 & UCA202 U-Control (USB audio) _Note: Works best on Mac and Linux. On Windows, [ASIO4ALL](https://www.asio4all.org/) driver works OK but not great. There is also the [native driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) which Behringer withdrew support for a while ago, and therefore removed from their download section._

* Behringer UGC102 (USB interface for guitar/bass) _Note: On Mac, appears as "USB Audio Codec" - when selected for input and output in Jamulus, the UGC102 headphone jack is the output (and cannot be used for input)._

* Behringer UMC202HD, UMC204HD, and UMC404HD interfaces, [Windows 7 to 10 ASIO Driver](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip) (USB Audio)

* Behringer X32 digital mixer with X-USB 32-in/32out (USB audio)

* Behringer XENYX 302USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q502USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q802USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip).  This Behringer ASIO Driver does not appear to be very good.  Audio latency with this 'unsupported' driver seems poor - not better than ASIO4ALL.  It's good device for Mac and Linux, but perhaps not for Windows.  More testing is required.

* Behringer XR18/XR16/XR12 digital mixers (USB Audio)

* Edirol FA-66 (FireWire) - good on Mac, Linux, and Windows [ASIO driver](https://www.roland.com/global/products/fa-66/downloads/)

* Focusrite Clarett 4Pre interface (Thunderbolt 2)

* Focusrite Scarlett interfaces (USB Audio) _Note: if you have issues with the buffer size going to 136, download the updated driver version `4.64.15.598` from [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* HiFiBerry DAC +ADC (HAT). Virtually no jitters and the good latency (20 millseconds). No headphone amplifier, so you'll need one of those. I used a Rolls MX122 mini mixer. Tested using Raspberry Pi 4 running Raspberry Pi OS Buster, kernel version 4.19.

* iConnectivity AUDIO4+ interface (USB)

* Lexicon Omega (USB audio) _Note: Works best on Mac and Linux. There is a driver for Windows but this does not allow to use 64 samples buffer size and adds some latency compared to, e.g., the Mac driver._

* Line 6 Helix Stomp, read [Remote Jamming with Helix and Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) for setup on a Mac. (USB Audio)

* MOTU Ultralite (2010 FireWire model mk1/mk2), 2015 MacBook Pro, OS X El Capitan 10.11.6, Apple Thunderbolt/FireWire adapter.

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

### Known Not to work with Jamulus
* Zoom B3 bass amp-modeling pedal. Does not support 48000 Hz. (USB Audio)
