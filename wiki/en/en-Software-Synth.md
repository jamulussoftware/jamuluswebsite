---
layout: wiki
title: "Software Synth in Jamulus"
lang: "en"
permalink: "/wiki/Software-Synth"
---

# Software Synth in Jamulus

## Linux
We will elaborate the concept of playing a software synth on Linux as example and transfer that to other operating systems (e.g. Windows, macOS). 
* **(Hammond Organ Synth)** As an example we talk open source software synth [setBfree](https://github.com/pantherb/setBfree), which is a hammond organ emulator that outputs through JACK on Linux.
* **(MIDI Keyboard)** The MIDI keyboard is used to generate the key pressed events, that are transmitted through a USB-MIDI interface to Linux system and the Synthesizer [setBfree](https://github.com/pantherb/setBfree) generates the corresponding tone for the pressed key. In general the MIDI keyboard can also be replaced by a digital wind midi controller, that does the same but the tone is dependent on how the musician blows air into the digital wind controller.
* **(Connector to Jamulus)** You may hear the audio output of your Linux system on your speakers but the audio output may not be use as input for your Jamulus session. So another step is to connect the audio out to Jamulus client (with QJackCtl).

### General Information about ALSA, JACK and MIDI
First of all we explain a few basic concepts on Linux to use MIDI and Audio together.
* ALSA is the basic to connection to the hardware, i.e. the soundcard and the midi controller for the keyboard.
* JACK is build on top of ALSA and uses ALSA for the audio output. It provides a adequat environment for music production on Linux.
* Synthesizer like the [Hammond Organ emulator setBfree](https://github.com/pantherb/setBfree) connect to JACK for audio output.
* Jamulus connects to JACK.

### Requirements for Using Software Synths in Jamulus on Linux
For ALSA2JACK MIDI (`a2jmidid`) connection it is necessary to install the a2j package. Furthermore we use in this example a simple Hammond organ emulator `setBfree` in this example. Replace `setBfree` by your favorite Linux synthesizer. Both packages `a2jmidid` and `setbfree` can be installed via your package manager or e.g. on Ubuntu/Mint with `apt-get` commands:
```shell
    sudo apt-get install a2jmidid
    sudo apt-get install setbfree
```

### Connecting ALSA, JACK and MIDI for a Synth for Jamulus
Now we look an the workflow to use the whole infrastructure in Jamulus.
* **(Jamulus Installation and JACK)** Use the [install script](https://github.com/corrados/jamulus/wiki/Linux-Client-Install-Script) for Jamulus on Linux or [install Jamulus with the manual in the wiki](https://github.com/corrados/jamulus/wiki/Installation-for-Linux). With this installation we have JACK and QJackCtl installed for Jamulus.
* **(ALSA to JACK - MIDI)** Next we must create a connection from ALSA to JACK to route the MIDI input from the keyboard to the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree).
   * ***(Command Line: `qjackctl`)*** For this step you can start JACK-Control (QJackCtl) from the command line by `qjackctl`,
   * ***(Command Line: `a2jmidid -e`)*** Then you launch the ALSA2JACK MIDI connector with command: `a2jmidid -e`. As long as this connector runs in the shell the `a2j` connection interface is visible in `QJackCtl`.
   * ***(QJackCtl: `ALSA-MIDI`)*** Connect your USB MIDI as input to `MIDI through` in the ALSA-MIDI tab of QJackCtl.  Now the midi events from your keyboard reach JACK and are ready to connect.
   * ***(Start Synth)*** Start the Hammond Synthesizer too e.g. from the command line with `setBfree`. You will see the `setBfree` graphical user interface GUI (see http://setbfree.org/gui_3d). Press with your mouse on the visualised organ keyboard to test if the synth generates an organ sound on your speakers.
   * ***(QJackCtl: `JACK-MIDI`)*** Now we can connect `a2j` in JACK-MIDI as input to the synth `setBfree`, that generates the sound as output for each key pressed on the keyboard. Keep in mind that you can connect synths if they are started and visible for QJackCtl.  So you can connect  after starting the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree), i.e. connect `a2j` to the `setbfree` if you also see the Hammond Synth SetBFree in QJackCtl.
   * ***(Test Software Synth with MIDI Keyboard)*** If you have speakers attached to your Linux Computer you would hear the emulated Hammond sound on your Linux PC for all the keys your press on your MIDI keyboard. If you just want to play the software synth with your keyboard you are ready to play from here. The only remaining step is to connect the audio to Jamulus.
* **(Synth to Jamulus - Audio)** In the previous step we connected the MIDI signals from your keyboard to the MIDI input of JACK via a2j - MIDI through connection. Now JACK the MIDI which tell JACK which keys are pressed on the keyboard. Now create an audio connection in JACK (i.e. the generated Hammond sound of the synth). We connect the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) output to Jamulus. Therefore Jamulus must be started so that you see also Jamulus in the audio connection of QJackCtl. Now you can the audio output of the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) to the audio input of Jamulus in JACK.

In general `QJackCtrl` is used similar operations like for plugging in instruments in mixer and the mixer into an amplifier and the amplifier again to the speakers. Have fun with your other OpenSource synths like QSynth, [ZynAddSubFX](https://sourceforge.net/projects/zynaddsubfx/) than can be installed on your Linux system and/or used within LMMS.

Have fun playing your synth within Jamulus.
