---
layout: wiki
title: "Tips, Tricks and More"
lang: "en"
permalink: "/wiki/Tips-Tricks-More"
---

# Tips & Tricks

##  Learning about remote band rehearsing

Jamulus user [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/) has compiled a massive amount of information relating to [Remote Band Rehearsals](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/) (Google doc), which covers topics such as hardware and software configuration including examples and advice for newcomers to the field. He also includes a section on Jamulus in comparison to other solutions.

##  Using Jamulus audio in Zoom (or other) meeting apps

Several users have reported success allowing a "virtual audience" for a Jamulus session by using [JACK audio](https://jackaudio.org) to route the Jamulus signal through JackRouter to the target application (in this case, Zoom meetings).

You can also use [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) for Windows or [BlackHole](https://github.com/ExistentialAudio/BlackHole) for macOS to route the Jamulus output to multiple destinations, for example to your headphones and the meeting application at the same time.


## Recording Jamulus on Windows with Reaper

Jamulus user [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) has written a [guide to recording the output of Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc) using the ReaRoute add-on for [Reaper](https://www.reaper.fm/).  


## Sharing song/chord sheets

Jamulus user [BTDT](https://sourceforge.net/u/btdt/profile/) has written a system called [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), a web application that allows a "Jam leader" to push song sheets (in PDF format) to "Jammers" in real time using standard web browsers.

## Making a server status page

With the `-m` command line argument, server statistic information can be generated to be put on a web page.

Here is an example php script using the server status file to display the current server status on a html page (assuming the following command line argument to be used: `-m /var/www/stat1.dat`):

~~~
<?php
function loadserverstat ( $statfilename )
{
   $datei = fopen ( $statfilename, "r" );
   while ( !feof ( $datei ) )
   {
	  $buffer = fgets ( $datei, 4096 );
	  echo $buffer;
   }
   fclose($datei);
}
?>
<?php loadserverstat ( "stat1.dat" ); ?>
~~~

## Saving and loading client mix states

You can save and restore the mix you have for your band rehearsals (fader, mute, pan, solo etc.) and load these any time (even while you are playing). Do this with "File > Save Mixer Channels Setup" in your client and load them using "Load Mixer Channels Setup" (or drag/drop them to the mixer window).

## Converting a public server to a private one on the fly

You can run a public server long enough for your band to connect, then go private by simply unchecking the 'Make my server Public' box in the server GUI. Your band mates will still be connected to the server until they disconnect. (Thanks to [David Savinkoff](https://github.com/DavidSavinkoff) for this tip!)


## Jamulus client Linux start script

Here's a Linux start script for Jamulus using an old Audigy4 sound card, the large number of available audio faders for which makes it hard to get the correct settings.

This script therefore includes the most important audio fader settings. The second part of the script deals with the JACK connections. I use Guitarix as my guitar effect processor which I plug in in the JACK audio path.

Finally I start Jamulus automatically connecting to the directory server.

Here is the script:

~~~
amixer sset 'Mic' capture 30% cap
amixer sset 'Mic' playback 0%
amixer sset 'Line' playback 60% unmute
amixer sset 'Audigy Analog/Digital Output Jack' unmute
amixer sset 'Analog Mix' capture 100%
amixer sset 'Analog Mix' playback 0%
amixer sset 'Wave' 100%
amixer sset 'Master' capture 100% cap
amixer sset 'Master' playback 100%
amixer sset 'Master' playback 100%
amixer sset 'PCM' playback 100%
amixer sset 'PCM' capture 0%
guitarix &
/home/corrados/llcon/Jamulus -c myJamulusServer.domain.com &
sleep 3
jack_disconnect system:capture_1 Jamulus:'input left'
jack_disconnect system:capture_2 Jamulus:'input right'
jack_connect system:capture_1 gx_head_amp:in_0
jack_connect gx_head_amp:out_0 gx_head_fx:in_0
jack_connect gx_head_fx:out_0 Jamulus:'input left'
jack_connect gx_head_fx:out_1 Jamulus:'input right'
jack_connect Jamulus:'output left' system:playback_1
jack_connect Jamulus:'output right' system:playback_2
~~~

## Using ctrlmidich for MIDI controllers

The volume fader, pan control and mute and solo buttons in the client's mixer window strips can be controlled using a MIDI controller by using the `--ctrlmidich` parameter (note: only available for use with macOS and Linux using Jamulus version 3.7.0 or higher). To enable this feature, Jamulus must be launched with `--ctrlmidich`. There is one global MIDI channel parameter (1-16) and two parameters you can set for each item controlled: `offset` and `consecutive CC numbers`. Set the first parameter to the channel you want Jamulus to listen on (0 for all channels) and then specify the items you want to control (f = volume fader; p = pan; m = mute; s = solo) with the offset (CC number to start from) and number of consecutive CC numbers. Take the following example:

`--ctrlmidich '1;f0*8;p16*8;s32*8;m48*8'`

Here, Jamulus listens on MIDI channel 1. Volume fader CC numbers start at 0 and there are 8 of them (so end at CC number 7). Pan controls start at CC number 16 and end at 23; Solo 32 to 39 and Mute 48 to 55.

Fader strips in the mixer window are controlled in ascending order from left to right. Continuing with the above example, in strip number 1 (farthest left), the volume fader would be controlled by CC number 0; pan by 16; solo by 32 and mute by 48. As we have specified 8 consecutive controllers for each parameter, this would give us MIDI control over 8 strips (volume, pan, solo and mute in each one) in the mixer window. The next strip would be controlled by 1, 17, 33 and 49, and so forth.

*Note*: Jamulus does not provide feedback on the state of the Solo and Mute buttons, meaning that your controller must keep track and toggle LEDs (if any) to 'on' or 'off' itself.

Make sure you connect your MIDI device's output port to the Jamulus MIDI in port (QjackCtl (Linux), MIDI Studio (macOS) or whatever you use for managing connections). In Linux you will need to install and launch a2jmidid so your device shows up in the MIDI tab in Qjackctl.


## Controlling recordings on Linux headless servers

When using the [recording function](Server-Win-Mac#recording) with the `-R` [command line option](Command-Line-Options), if the server receives a SIGUSR1 signal during a recording, it will start a new recording in a new directory. SIGUSR2 will toggle recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `newRecording-Jamulus-server.service`).

**Note:** You will need to save recordings to a path _outside_ of the jamulus home directory, or remove `ProtectHome=true` from your systemd unit file (be aware that doing so is however a potential security risk).

For turning recording on or off (depending on the current state):

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

For starting a new recording:

~~~
[Unit]
Description=Start a new recording on Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note: The Jamulus service name in the `ExecStart` line needs to be the same as the `.service` file name you created when setting systemd to control your Jamulus server. So in this example it would be `Jamulus-Server.service`_

Run `sudo systemctl daemon-reload` to register them for first use.

Now you can run these with the `service start` command, for example:

`sudo service jamulusTogglerec start` (assuming you named your unit file `jamulusTogglerec.service`)

You can see the result of these commands if you run `service jamulus status`, or by viewing the logs.

## Quality of Service

Jamulus uses DSCP/CS4 opportunistically to deal with buffer bloat, and uses a default DSCP/CS4 value of 128 (or 0x80). This is compatible with IPv4 and IPv6. Other values can be set using the `-Q` option, eg  `-Q [0..255]` (where 0 disables QoS). If you want to explore the effect of non-default settings, see [RFC4594](https://tools.ietf.org/html/rfc4594). However, most people will have no need to do this.

### Using Quality of Service on Windows

Jamulus’s QoS settings (including the default) have no effect on Windows because the operating system ignores them. To enable Quality of Service for Jamulus, you must follow these instructions. Note also that you may need to repeat this procedure every time Jamulus is updated.

In Search box beside Start menu Type: Local Group Policy Editor (enter)
In new window, (click) on the menu icon to display the Actions third panel
Looking at the first panel of the Local Group Policy Editor
&nbsp;Local Computer Policy
&nbsp;&nbsp;Computer Configuration
&nbsp;&nbsp;&nbsp;Windows Settings
&nbsp;&nbsp;&nbsp;&nbsp;Policy-based QoS (click)
Looking at the third panel (Actions) of the Local Group Policy Editor
&nbsp;Policy-based QoS
&nbsp;&nbsp;More Actions
&nbsp;&nbsp;&nbsp;Create new Policy (click)
&nbsp;&nbsp;&nbsp;&nbsp;Policy Name: Jamulus
&nbsp;&nbsp;&nbsp;&nbsp;Specify DSCP value: 32
&nbsp;&nbsp;&nbsp;&nbsp;Next
&nbsp;&nbsp;&nbsp;&nbsp;This QoS policy applies Only to applications with name Jamulus.exe
&nbsp;&nbsp;&nbsp;&nbsp;Next
&nbsp;&nbsp;&nbsp;&nbsp;Next
&nbsp;&nbsp;&nbsp;&nbsp;UDP
&nbsp;&nbsp;&nbsp;&nbsp;Finish
(Notice Jamulus policy in center panel may be edited)

## Delegate mixing to a mix master using the --mastermix server mode

By starting a server instance with the `--mastermix` flag, the first client to connect will become the controller, or 'mix master' of the audio mix.

Subsequent joiners will be able to control their own as well as the mix master's pan and gain, but nobody else's (clients will see these faders and buttons grayed out). Instead, they will hear the pan and gain value as set by the mix master.

When the mix master sets a channel to Solo, this will *not* apply to everybody's elses mix. Allowing the mix master to secretly solo people can help to create a good mix without disturbing other clients.

This mode can be valuable for example in choir rehearsals to offload mixing from the singers to a conductor. Or in having a dedicated sound engineer to improve the quality of the overall mix for everybody.



