---
layout: post
title: "Software Synth in Jamulus"
lang: "en"
author: "niebert"
heading: "Software Synth in Jamulus"
---

This article will show you how to use a software synth with Jamulus.

<!--more-->

## Linux

We will look at the concept of playing a software synth on Linux but other operating systems should work similar.
Let's have a look at what we need:
1\. A software synth like [setBfree](https://github.com/pantherb/setBfree) **(Hammond Organ Synth)** which we'll use in this example. It emulates an organ and outputs its audio to JACK on Linux.
2\. A **MIDI Keyboard**. The MIDI keyboard is used to generate the key pressed events, which are transmitted through a USB-MIDI interface to your operating system. After that the synthesizer [setBfree](https://github.com/pantherb/setBfree) generates the corresponding sound for the pressed key. The MIDI keyboard could also be replaced by a digital wind midi controller, which does the same (although the tone is dependent on how the musician blows air into the digital wind controller).
3\. A **connector to Jamulus**. You may hear the audio output of the synth on your speakers but the audio output may not be used as input for Jamulus. That's why we need to connect the audio output of the synth to Jamulus (this can be done with QJackCtl on Linux).

### General Information about ALSA, JACK and MIDI

This part is specific to Linux. Let's have a look at a few concepts how Linux handles Audio and MIDI before actually looking at how to connect the synth.

-   **ALSA** This is the basic layer which connects to the hardware, i.e. the soundcard and the midi controller for the keyboard.
-   **JACK** is built on top of ALSA and uses ALSA for the audio output. It provides an easy to use environment for music production on Linux.
-   The **synthesizer** like the [Hammond Organ emulator setBfree](https://github.com/pantherb/setBfree) connects to JACK and sends its audio there.
-   **Jamulus** connects to JACK too and can therefore receive and send audio to every application connected to JACK (including our synthesizer).

### Requirements for using Software Synths in Jamulus on Linux

If you use your MIDI keyboard, you might need ALSA2JACK MIDI (`a2jmidid`) from the `a2j` package to be able to connect it to JACK. Since we use `setBfree` in this example, you also need this software synth (of course, you can replace this by your favourite Linux synthesizer). Both packages `a2jmidid` and `setbfree` can be installed with your package manager e.g. on Ubuntu by using the `apt-get` commands:

```shell
sudo apt-get install a2jmidid
sudo apt-get install setbfree
```

### Connecting ALSA, JACK and MIDI for a Synth for Jamulus

Let's have a look at the workflow.

1.  Install Jamulus (you've probably already done that. If not, please have a look at the [installation page in the documentation](/wiki/Getting-Started)). If you followed these instructions, JACK and QJackCtl were already installed.
2.  **ALSA to JACK - MIDI** Next, we must create a connection from ALSA to JACK to route the MIDI input from the keyboard to setBfree. Let's have a look at how to do that:
    -   Open Qjackctl e.g. from the command line by typing `qjackctl`
    -   Launch the ALSA2JACK MIDI connector with `a2jmidid -e`. While this connector runs, the `a2j` connection interface should be visible in `QJackCtl` in JACK-MIDI.
    -   Now connect your USB MIDI device as input to `MIDI through` in the ALSA-MIDI tab of QJackCtl. MIDI events from your keyboard will now reach JACK.
    -   Start your synth e.g. from the command line with (in my case) `setBfree`. You will now see the `setBfree` graphical user interface (it could look like this: <http://setbfree.org/gui_3d>). You can now check if the synth generates sound by clicking on the visualised organ keyboard and listening for sound through your speakers.
    -   In Qjackctl we can now connect `a2j` in JACK-MIDI as input to the synth, which generates sound as output for each key pressed on the keyboard. Keep in mind that you can connect synths if they are started and visible for QJackCtl. So you can connect after starting the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree), i.e. connect `a2j` to `setbfree` if you also see the Hammond Synth SetBFree in QJackCtl.
    -   Let's test the software synth with our MIDI Keyboard! If you have speakers attached to your device you should hear the emulated Hammond sound for all the keys your press on your MIDI keyboard. If you just want to play the software synth with your keyboard, you're finished here. But if you want to connect the sound of the synth to Jamulus, the only remaining step is to connect the synths' audio to Jamulus.
        **Synth to Jamulus - Audio**: In the previous step we ensured that the MIDI signals from your keyboard get sent to to the MIDI input of JACK. Now we need to create an audio connection from JACK (i.e. the generated Hammond sound of the synth) to Jamulus. To do so, we connect the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) output to Jamulus. Therefore, start Jamulus so that you can see Jamulus in QJackCtl. Now connect the audio output of the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) to the audio input of Jamulus in JACK. Now you're done.

`QJackCtrl` can be used for operations like plugging in instruments in mixer and the mixer into an amplifier and the amplifier again to the speakers.

There are also other Open Source synths like QSynth or [ZynAddSubFX](https://sourceforge.net/projects/zynaddsubfx/) which can be installed on your Linux system and/or used within LMMS.

Have fun playing your synth within Jamulus!
