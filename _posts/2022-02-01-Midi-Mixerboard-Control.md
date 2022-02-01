---
layout: post
title: "Control the Jamulus Mixerboard using MIDI"
lang: "en"
author: "henkdegroot"
heading: "How to control the Jamulus Mixerboard using a MIDI Surface Control in Windows using JACK"
---

This guide explains how to setup your system in order to control the Jamulus Mixerboard using a MIDI Surface Control device (or similar) using JACK.
The process will be similar for Linux (this also requires JACK and a2jmidid), while for macOS you can use MIDI Studio.

## What do you need?
1. Jamulus with JACK support (not the standard ASIO version), you can [download the Jamulus JACK version for Windows here]({{ site.download_root_link }}{{ site.download_file_names.windows-jack }})).
2. You need an audio device with ASIO support or you can use a universal ASIO driver like ASIO4ALL.
3. You need a MIDI Control Surface. Many different models are available. I am using a Worlde EasyControl 9.
 ![worlde-easycontrol-9](https://user-images.githubusercontent.com/13550012/152056661-a446f24e-0598-4164-bc0f-a2510ab33c5e.png)
4. JACK for Winodws [get it from the JACK audio page](https://jackaudio.org/downloads/).

### What do you need to know?
You need to know the MIDI Control Change numbers which are assigned to the buttons/faders/knobs of your MIDI Surface Control device. For the device I use, the setup is:

![easycontrol-config](https://user-images.githubusercontent.com/13550012/152056700-9a70b7b0-ea67-4d7f-b56f-a6bc88824394.png)

When your device has buttons which you want to use to control the Mute or Solo option, then you should configure these with the Toggle option (instead of Momentary). In Toggle mode the signal will only be sent once when you press the button and not when you let the button go. In Momentary mode the "ON" signal will be sent when pressed and when let go the "OFF" signal will be sent.

### What to install?
1. Install JACK for Windows, accepting the default options should be sufficient.
2. Install Jamulus with JACK for Windows, accepting the default options but don't run Jamulus at the end.
3. Install ASIO4ALL (if you do not have an audio device with an ASIO driver).

### Setting everything up
*Plug in your MIDI Surface Control into your computer. This needs to be done before you start QjackCtl and Jamulus.*

Now let's setup JACK:

You will mostly control the Audio flow in JACK (or QjackCtl, the software you can see in the screenshot which you can find in the Start Menu).

![QjackCtl-start](https://user-images.githubusercontent.com/13550012/152056827-8e0c12e4-a683-49ee-a7a5-f3ce3d6d3e2f.png)


Click the **Setup** button in the QjackCtl software to select your Audio interface or ASIO4ALL.
You should use/select an ASIO driver:

![QjackCtl-setup](https://user-images.githubusercontent.com/13550012/152056869-fbab591c-5271-4502-9efc-1670ad8ce720.png)

Ensure the driver is set to portaudio, the Sample Rate is set to 48000,  Frames/Period is set to something low like 64 or 128. You can now close this window by clicking **OK**.

Next, click on the **Start** button in Qjackctl.

![QjackCtl-started](https://user-images.githubusercontent.com/13550012/152056960-8fc51bc6-5cc0-492e-9ff1-298a8dff4c74.png)

After this is started, click the **Graph** button to show the Graph dialog:

![QjackCtl-at-startup](https://user-images.githubusercontent.com/13550012/152056935-b133a172-9894-4a2b-96dc-5aa7e4c5407b.png)

*NOTE: In this dialog you should see the System MIDI connection. If you do not see that option, then your MIDI device is not recognized or you may have connected the device after you started JACK.*

Now let's update the Jamulus shortcut:

The Jamulus installation has created a Desktop Shortcut, which we need to modify. We need to tell Jamulus that we want to use the MIDI Surface Control.
Locate the icon on the desktop, right click and select "Properties"

![jamulus-desktop-shortcut-properties](https://user-images.githubusercontent.com/13550012/152057006-b1878219-e661-4548-9bd3-0fa36422ddb0.png)

We need to add an option to the Target field.

The information you need to provide will depend on the MIDI Surface Control device configuration.
The mixing section of my device contains 9 faders, 9 knobs and 9 buttons. As I only have 1 button row, I need to decide to use the Mute or Solo option.
- The fader section starts with CC# 3 and ends with CC# 11.
- The knobs section starts with CC# 14 and ends with CC# 22.
- The button sections starts with CC# 23 and ends with CC# 31.

We need to tell Jamulus that these Control Change numbers are being used. When the Control Change is sent, it will also sent a value for the CC. The value will be in the range from 0 till 127.
The fader at the zero position will sent value 0 and at the max. position it will sent value 127.
The knob rotate and will sent 0 when turned fully to the left, 64 when in top centre and 127 when turned fully to the right.
The button will sent OFF (0 value) or ON (127 value).

The option we need to use for Jamulus is: **--ctrlmidich**

We need to add the information described above in the following format:

**"1;f3\*9;p14\*9;m23\*9"**

The first number indicates the MIDI channel Jamulus needs to listen to. A zero can be used if you want Jamulus to listen to all midi channels. The channel used will depend on your device and can be configurable as well.
After the first number we enter a ;

Next we start with the letter f (for fader), enter the first CC# number for the faders (in this case 3), how many faders the device contains (in this case 9), and we add a ;

Next we start with the letter p (for pan), enter the first CC# number for the knobs (in this case 14), how many knobs the device contains (in this case 9), and we add a ;

Next we start with the letter m (for mute), enter the first CC# number for the buttons (in this case 23), and how many buttons the device contains (in this case 9).

*NOTE: if you want to use the Solo option instead of Mute, then you replace the letter m by s (for solo). Or if you have another row with buttons, then you can add the sequence for that button row.*

You also need to make sure to start and end the values with double quotes.

The final command will look like this: --ctrlmidich "1;f3\*9;p14\*9;m23\*9"

Add this in the **Target** field:

![jamulus-desktop-shortcut-properties-ctrlmidich](https://user-images.githubusercontent.com/13550012/152057135-f356aacf-697d-4aae-8e34-897598783798.png)

Click **OK** to save and close that window.

Now you can start Jamulus and the initial dialog should appear (without errors).

![Jamulus-default-window](https://user-images.githubusercontent.com/13550012/152057183-f696901a-0ec7-49f9-b275-91c2727ad06f.png)

Now let's go back to the JACK Graph dialog window:

![QjackCtl-after-startup-jamulus](https://user-images.githubusercontent.com/13550012/152057213-4c9263a8-f6d7-43e7-91fe-6f40db018b73.png)

In this dialog you should see the Jamulus software which automatically has connected to the System Input (capture) and System Output (playback).
You notice that there is an extra connect option available for Jamulus, which indicates MIDI.

*NOTE: This is only available when the --ctrlmidich option is used when starting Jamulus.*

Use the mouse and click the "System Midi Capture_1" and drag this to the "Jamulus input midi" connector.
This will allow the MIDI signals to be sent from the MIDI device to Jamulus.

![QjackCtl-connect-midi](https://user-images.githubusercontent.com/13550012/152057248-b089ab04-72b6-4340-a5d1-2500a9938dd9.png)

*NOTE: Jamulus will not respond to MIDI messages if you have forgotten this step.*

Now let's go and do some testing:

Connect to a server and the Jamulus window should looke something like this:

![Jamulus-Active-Session](https://user-images.githubusercontent.com/13550012/152057277-80527562-338b-4470-b04e-e03aafcbb30f.png)

Your own channel is the first one in the list and your name/alias has been automatically prefixed with a number. 0 for the first fader.

*TIP: Starting with Jamulus version 3.8.2, you have an option to always have your own fader first. This can be enabled in the View menu. This will ensure that, regardless of the sorting mode you use for the mixerboard, your own fader is the first one in the mixerboard and can be controlled by the first fader/knob/button.*

You can now control your own "channel" using the first fader, knob and button(s). The second person who joins the jam session will get the second fader assigned, and so on.

Enjoy your jam sessions!

Feel free to add/update this KB post as appropiate.
