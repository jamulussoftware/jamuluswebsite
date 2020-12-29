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

Several users have reported success allowing a "virtual audience" for a Jamulus session by using [JACK audio](https://jackaudio.org) to route the Jamulus signal through the JackRouter to the target application (in this case, Zoom meetings).

You can also use [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) for Windows or [BlackHole](https://github.com/ExistentialAudio/BlackHole) for macOS to route Jamulus output to multiple destinations, for example to your headphones and the meeting application at the same time.


## Recording Jamulus on Windows with Reaper

Jamulus user [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) has written a [guide to recording the output of Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc) using the ReaRoute add-on for [Reaper](https://www.reaper.fm/).  


## Sharing song/chord sheets

Jamulus user [BTDT](https://sourceforge.net/u/btdt/profile/) has written a system called [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), a web application that allows a "Jam leader" to push song sheets (in PDF format) to "Jammers" in real time using standard web browsers.

## Making a server status page

With the `-m` command line argument a server statistic information can be generated to be put on a web page.

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

Finally I start Jamulus automatically connecting to the central server.

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

The volume faders in the client's mixer window can be controlled using a MIDI controller by using the `--ctrlmidich` parameter (note: only available for use with macOS and Linux). To enable this feature, Jamulus must be launched with `--ctrlmidich`. There are two parameters you can set: `Channel` and `Offset`. Set the first parameter to the channel you want Jamulus to listen on (0 for all channels) and the second parameter to the Control Number you want the first fader to react to. By default, the offset is 70 (for the Behringer X-Touch), which means that the first fader reacts to Control Number 70, the second to 71, and so on.

So for example, if you're using a Behringer X-Touch, sending MIDI on channel 1 and leaving the offset at default, the command would look like this: `--ctrlmidich 1`. If you have a different controller, e.g. sending MIDI on channel 2 and starting with Control Number 30, the command would be as follows: `--ctrlmidich "2;30"`

Make sure you connect your MIDI device's output port to the Jamulus MIDI in port (QjackCtl (Linux), MIDI Studio (macOS) or whatever you use for managing connections). In Linux you will need to install and launch a2jmidid so your device shows up in the MIDI tab in Qjackctl.
