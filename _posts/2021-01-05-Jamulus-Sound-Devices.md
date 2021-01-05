---
layout: post
title: "Audio devices for Jamulus"
lang: "en""
heading: "Sound devices"
lang: "en"
---

# Sound Devices

Thanks to Jamulus users, this page lists audio devices known to work (or not) with Jamulus.
<!-- more -->

_**Note**: If they work or not depends on your operating system (Linux, MacOS, Windows, etc.)_.

You can update this page with the information you have. **Please indicate the platform(s) you are using!**. Just open an issue on the 

## Audio devices known to work with Jamulus

### USB/USB-C devices

#### Microphones / DI Boxes

* **[Blue Yeti](https://www.bluemic.com/en-us/products/yeti/)**, USB Microphone  
Works well under **macOS** (there is a check option to disable local monitoring).  
Works well under **Windows 10 with ASIO4All**, a bit more latency than under macOS. You can disable local monitoring by going deep into the settings.  
Latency is good under **Linux**. You can't disable local monitoring (or we haven't found out how to do it, feel free to send us the information if you know how to do it).

* **[Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface)**, USB to XLR audio interface with headphone jack connector that converts a wired microphone to a USB microphone.  
Set the PC/Mix dialog box to 100% PC to listen to Jamulus' mix on the headphone output.  
Tested with a Raspberry Pi 4 under **Raspberry Pi OS Buster**, kernel version 4.19.

* **[Behringer UGC102](https://www.behringer.com/behringer/product?modelCode=P0198)**, Guitar-to-USB Interface  (guitar and bass) 
_Note: On **macOS**, this device appears as "USB Audio Codec". When selected for input and output in Jamulus, the **UGC102** headphone jack is the output (and cannot be used for input)._

#### Audio interfaces / digital mixing consoles

* **[Solid State Logic SSL2+](https://www.solidstatelogic.com/products/ssl2-plus)**, USB-C/USB digital audio/MIDI interface 2 in/4 out  
Works great under **Linux** (Ubunutu 20.04 or Raspberry Pi OS (Buster)), **macOS** (not tested on Big Sur) or **Windows 10** with the [native ASIO driver](http://eu1.download.solidstatelogic.com/SSL%202/SolidStateLogic_UsbAudio_v4.67.0_2019-10-21_setup%20(3).exe).  
The monitoring of the Jamulus mix is done by moving the "MONITOR MIX" completely to the right to "USB". See the [official manual](http://eu1.download.solidstatelogic.com/2%20Plus%20/SSL%202%20Plus%20User%20Guide_ENGLISH.pdf).

* **[Ammoon AGM02](https://www.ammoon.com/p-i3974.html)** and **[Ammoon AGM04](https://www.ammoon.com/p-i4049.html)**, low-cost USB 2-channel and 4-channel compact mixing consoles 
Both tested on **macOS Catalina**.  
The **AGM02** tested on **Windows 10**. On Windows 10, with ASIO4ALL, the **AGM02** can be used as an input, and the onboard audio as the output. There is no way to monitor only the USB return signal on the **AGM02**.
_**Note:** The Ammoon AGM04 appears to be a re-branded [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/)._

* **ART USBMix4**, USB 4-channel compact mixing console (_see above_)

* **[Audient EVO 4](https://evo.audio/products/evo-4/overview/)**, USB digital audio interface 2-in/2-out   
[Driver installation and download](https://evo.audio/driver-installation/),

* **[Behringer UCA222](https://www.behringer.com/product.html?modelCode=P0A31)** & **Behringer UCA202 U-Control**, 2-in/2-out USB Audio Interface with Digital Output  
_Note: Works best on **macOS** and **Linux**._  
On Windows, [ASIO4ALL](http://www.asio4all.org/) driver works OK but not great. There is also the [native driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) which Behringer withdrew support for a while ago, and therefore removed from their download section.

* **[Behringer UMC202HD](https://www.behringer.com/product.html?modelCode=P0BJZ)**, **UMC204HD**, et **UMC404HD** USB digital audio interfaces  
[pilotes ASIO pour Windows 7 à 10](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip)

* **[Behringer X32](https://www.behringer.com/behringer/product?modelCode=P0ASF)** X-USB digital mixing desk 32-in/32-out 

* **[Behringer XR18](https://www.behringer.com/product.html?modelCode=P0BI8)** (XR serie), USB digital mixing consoles

* **[Berhinger XENYX serie](https://www.behringer.com/series.html?category=R-BEHRINGER-XENYXSERIES)**, USB digital audio interfaces  
[Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip). This Behringer ASIO Driver does not appear to be very good. Audio latency with this "unsupported" driver seems poor - not better than ASIO4all. It's good device for **macOS** and **Linux**, but perhaps not for Windows. More testing is required.

* **[Focusrite Scarlett serie](https://focusrite.com/en/scarlett)**, USB digital audio interfaces
_Note: if you have issues with the buffer size going to 136, download the updated driver version `4.64.15.598` from [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* **[iConnectivity AUDIO4+](https://www.iconnectivity.com/products/audio/iconnectaudio4plus)**, USB digital audio interface

* **[Lexicon Omega](https://lexiconpro.com/en/products/omega)**, USB digital audio interface  
_Note: Works best on **macOS** and **Linux**. There is a driver for Windows but this does not allow to use 64 samples buffer size and adds some latency compared to, e.g.,the mocOS driver._

* **[Native Instruments Komplete Audio 2](https://www.native-instruments.com/en/products/komplete/audio-interfaces/komplete-audio-1-audio-2/)**, USB digital audio interface  
Tested on **Windows 10** with 64 sample buffer and am getting great sound and total latency around 15ms over the ping time.

* **[Steinberg UR22C](https://new.steinberg.net/audio-interfaces/ur22c/)** USB-C/USB3 digital audio interface  
Works directly on **macOS** with a beautiful sound even with un-balanced jack.  
Works on a **Raspberry PI4** provided `jackd` version used is the one from `/usr/bin` (Tweaking `raspijamulus.sh`). Not tested on PC.

* **[Steinberg UR22 MKII](https://www.steinberg.net/en/products/audio_interfaces/ur_series/models/ur22mkii.html)**, USB digital audio interface 
Sounds great, can achieve 32 frame buffer and works on **Windows** and **Linux**.  
Not tested on **macOS**.

* **[Yamaha AG03](https://usa.yamaha.com/products/music_production/interfaces/ag_series/index.html)**, USB digital audio/MIDI interface

#### Amp modelers/effects pedals for instruments

* **[Line 6 HX Stomp](https://line6.com/hx-stomp/)**, USB multi-effects pedal for guitar  
See [Remote Jam with Helix and Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) for settings on a Mac.

#### Digital recorders

* **Tascam DR-07X** stereo recorder with USB audio into computer, headphones in line-out of the recorder.  
It can also be used with an external mic in the line-in (had to use a pre-amp with that). Tested on **Windows 10**.

* **Tascam DR-40X** stereo recorder as above. Set "Monitor" to "PC/Mac". **Linux Ubuntu 18.04**.

* **[Zoom H4](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h4/)**, USB portable recorder
Works well on Mac, PC and Raspberry Pi4


### Firewire devices

* **[Presonus StudioLive 16.4.2 AI](https://www.presonus.com/products/StudioLive-1642AI)** (StudioLive AI series), Firewire digital mixing desk  
Works perfectly with Jamulus under **macOS** (not yet tested on Big Sur). Assign the individual inputs in Jamulus or the corresponding inputs to a stereo auxiliary mix (to be patched in "Universal Control") if more than two channels. Use outputs 17-18 to monitor the Jamulus mix.  
These devices work under Windows, they should work with Jamulus under this OS (not tested).  
Not tested under Linux, may (or may not) work, see [here](https://forums.presonus.com/viewtopic.php?f=67&t=2717).

* **[Edirol (Roland) FA-66](https://www.roland.com/global/products/fa-66/)** Firewire digital audio interface  
Good on **macOS**, **Linux**, et **Windows**, [Pilote ASIO](https://www.roland.com/global/products/fa-66/downloads/).

* **[MOTU Ultralite](https://motu.com/products/motuaudio/copy_of_ultralite/body-old.html)** (2010 models MK1/MK2), Firewire digital audio interface  
Tested on e MacBook Pro 2015, **Mac OS X** 10.11.6 (El Capitan), Apple Thunderbolt/Firewire adaptor.

### Thunderbolt devices

* **[Focusrite Clarett 4Pre](https://focusrite.com/en/usb-c-audio-interface/clarett-usb/clarett-4pre-usb)**, Thunderbolt 2 digital audio interface  

* **[Resident Audio T4](http://www.residentaudio.com/t4overview)**, Thunderbolt 2 digital audio interface

* **[Universal Audio Arrow](https://www.uaudio.com/audio-interfaces/arrow.html)**, Thunderbolt 3 digital audio interface  
This device provides the lowest latency.

* **[Zoom TAC-2](https://zoomcorp.com/en/us/audio-interface/audio-interfaces/tac-2/)**, Thunderbolt 2 digital audio interface

### Internal soundcards

* **[HiFiBerry DAC+ ADC](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc/)**, Raspberry Pi compatible HAC internal sound card.  
Virtually no jitter and good latency (20 milliseconds). No headphone amp, so you'll need one. Used with a mini console [Rolls MX122](https://rolls.com/product/MX22s). Tested on Raspberry Pi 4 under **Raspberry Pi OS Buster**, kernel version 4.19.

* **[Soundblaster Live!](https://en.wikipedia.org/wiki/Sound_Blaster_Live!)**, PCI internal sound card
With [kX ASIO driver](https://www.kxproject.com/)

* **[Soundblaster Audigy 4](https://en.wikipedia.org/wiki/Sound_Blaster_Audigy#Sound_Blaster_Audigy_4)**, PCI internal sound card  

## Audio devices known not to work with Jamulus

* **Zoom B3**, USB amplifier modeling pedal for bass. **Does not support 48 KHz**.

* **Line6 Bass POD**, USB amplifier modeling pedal for bass. **Does not support 48 KHz**.
