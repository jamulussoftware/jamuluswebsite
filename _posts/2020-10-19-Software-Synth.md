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

We will look at the concept of playing a software synth on Linux but other operating systems should work similarly.
Let's have a look at what we need:
1. A software synth like [setBfree](https://github.com/pantherb/setBfree) **(Hammond Organ Synth)** which we'll use in this example. It emulates an organ and outputs its audio to JACK on Linux.
2. A **MIDI Keyboard**. The MIDI keyboard is used to generate the key pressed events, which are transmitted through a USB-MIDI interface to your operating system. After that the synthesizer [setBfree](https://github.com/pantherb/setBfree) generates the corresponding sound for the pressed key. The MIDI keyboard could also be replaced by a digital wind midi controller, which does the same (although the tone is dependent on how the musician blows air into the digital wind controller).
3. A **connector to Jamulus**. You may hear the audio output of the synth on your speakers but the audio output may not be used as input for Jamulus. That's why we need to connect the audio output of the synth to Jamulus (this can be done with QjackCtl on Linux).

### General Information about ALSA, JACK and MIDI

This part is specific to Linux. Let's have a look at a few concepts how Linux handles Audio and MIDI before actually looking at how to connect the synth.

-   **ALSA** This is the basic layer which connects to the hardware, i.e. the sound card and the midi controller for the keyboard.
-   **JACK** is built on top of ALSA and uses ALSA for the audio output. It provides an easy-to-use environment for music production on Linux.
-   The **synthesizer** like the [Hammond Organ emulator setBfree](https://github.com/pantherb/setBfree) connects to JACK and sends its audio there.
-   **Jamulus** connects to JACK too and can therefore receive and send audio to every application connected to JACK (including our synthesizer).

### Requirements for using Software Synths in Jamulus on Linux

If you use your MIDI keyboard, you might need ALSA2JACK MIDI (`a2jmidid`) from the `a2j` package to be able to connect it to JACK. We use the synth `setBfree` in this example, so I also need this software synth (of course, you can replace this by your favourite Linux synthesizer). Both packages `a2jmidid` and `setbfree` can be installed with your package manager e.g. on Debian/Ubuntu by using the `apt-get` commands:

```shell
sudo apt-get install a2jmidid
sudo apt-get install setbfree
```

### Connecting ALSA, JACK and MIDI for a Synth for Jamulus

Let's have a look at the workflow.

1.  Install Jamulus (you've probably already done that. If not, please have a look at the [installation page in the documentation](/wiki/Getting-Started)). If you followed those instructions, JACK and QjackCtl were already installed.
2.  **ALSA to JACK - MIDI** Next, we must create a connection from ALSA to JACK to route the MIDI input from the keyboard to setBfree. Let's have a look at how to do that:
    -   Open QjackCtl e.g. from the command line by typing `qjackctl` and start JACK by clicking on the play button
    -   Launch the ALSA2JACK MIDI connector with `a2jmidid -e`. While this connector runs, the `a2j` connection interface should be visible in `QjackCtl` in the JACK-MIDI tab.

    ![QJackctl JACK-MIDI a2j](https://user-images.githubusercontent.com/20726856/101836060-ff2abe80-3b3c-11eb-8109-347fab4f03a6.png)

    -   Now connect your USB MIDI device as an input to `MIDI through` in the ALSA-MIDI tab of QjackCtl. MIDI events from your keyboard will now reach JACK.

    ![QJackctl ALSA-MIDI MIDI through](https://user-images.githubusercontent.com/20726856/101836057-fe922800-3b3c-11eb-8ee2-60cc591cf908.png)

    -   Start your synth e.g. from the command line with (in my case) `setBfree`. You will now see the `setBfree` graphical user interface. It should look like this:

    ![setBfree synth](https://user-images.githubusercontent.com/20726856/101836062-ffc35500-3b3c-11eb-80d3-ebcfadac4942.png)

    You can now check if the synth generates sound by clicking on the displayed organ keyboard and listening for sound through your speakers.
    -   In QjackCtl we can now connect `a2j` in JACK-MIDI as an input to the synth, which generates sound for each key pressed on the keyboard. Keep in mind that you can connect synths if they are started and visible to QjackCtl. So you can connect after starting the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree), i.e. connect `a2j` to `setbfree` if you also see the Hammond Synth setBFree in QjackCtl.

    ![JACK-MIDI connect synth MIDI](https://user-images.githubusercontent.com/20726856/101932865-b4ac4f00-3bdb-11eb-8834-6f392402a8b6.png)

    -   Let's test the software synth with our MIDI Keyboard! If you have speakers attached to your device you should hear the emulated Hammond sound for all the keys you press on your MIDI keyboard. If you just want to play the software synth with your keyboard, you're finished here. But if you want to connect the sound of the synth to Jamulus, the only remaining step is to connect the synths' audio to Jamulus.

**Synth to Jamulus - Audio**: In the previous step we ensured that the MIDI signals from your keyboard got sent to to the MIDI input of JACK. Now we need to create an audio connection from JACK (i.e. the generated Hammond sound of the synth) to Jamulus. To do so, we connect the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) output to Jamulus. Therefore, start Jamulus so that you can see Jamulus in QjackCtl. Now connect the audio output of the [Hammond Emulator setBfree](https://github.com/pantherb/setBfree) to the audio input of Jamulus in JACK.

![QJackctl connect synth to Jamulus](https://user-images.githubusercontent.com/20726856/101958961-ad4d6b80-3c04-11eb-86cd-24e7efa6fe00.png))

There is one last step. In your local connection setup, you might see that the setBfree synth output (left) is not only connected to the Jamulus input (right), but also to `system`. `System` would be your speakers or headphones, but what you want to listen to is just the output from Jamulus, not the direct sound from setBfree also at the same time (not exactly - they'd be separated by a small time lag). So now you must disconnect setBfree from "system". That way you will hear the audio coming from the Jamulus server (yours and that of whoever you are playing with) and will avoid an echo or flanger effect.

Now you're done.

`QjackCtl` can also be used for operations like plugging in instruments in mixer and the mixer into an amplifier and the amplifier again to the speakers.

There are also other Open Source synths like QSynth or [ZynAddSubFX](https://sourceforge.net/projects/zynaddsubfx/) which can be installed on your Linux system.

Have fun playing your synth within Jamulus!
