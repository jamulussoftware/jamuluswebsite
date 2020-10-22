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

Several users have reported success allowing a "virtual audience" for a Jamulus session by using [Jack audio](https://jackaudio.org) to route the Jamulus signal through the JackRouter to the target application (in this case, Zoom meetings). 

You can also use [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) for Windows or [BlackHole](https://github.com/ExistentialAudio/BlackHole) for Mac to route Jamulus output to multiple destinations, for example to your headphones and the meeting application at the same time.


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

## Saving client mix states between sessions 

You may want to save and restore the mix you have for your band rehearsals (fader, mute, pan, solo etc.). Do this by starting Jamulus with the `--inifile` setting (eg `Jamulus --inifile "c:\temp\jamulussetup1.ini"`) on the command line.

Do your session, than disconnect and close the Jamulus software. All fader settings are stored in the ini-file. If you then want to store another session, simply copy the file `jamulussetup1.ini` to `jmulussetup2.ini` and start with `--inifile "c:\temp\jamulussetup2.ini"`. If you want to recover the first session, simply start Jamulus with the first file again.


## Jamulus client Linux start script

Here's a Linux start script for Jamulus using an old Audigy4 sound card, the large number of available audio faders for which makes it hard to get the correct settings. 

This script therefore includes the most important audio fader settings. The second part of the script deals with the jack connections. I use Guitarix as my guitar effect processor which I plug in in the jack audio path. 

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



## Using the --ctrlmidich MIDI controller channel option

Jamulus user [Ignotus](https://sourceforge.net/u/jammerman/profile/) writes: If you want to use a generic MIDI controller, you will need to either make adjustments to your controller or re-compile the sources:

Note: only available for use with MacOS and Linux.

MIDI CC messages consist of a Control Number, Controller Value, and Channel. Jamulus listens to the Control Number to know what fader to move, on the channel you specify when launching it with `--ctrlmidich`.

The Jamulus client is set by default for use with the Behringer X-Touch, which apparently sends Control Numbers starting at 70, when Jamulus' faders are zero-indexed, which means there's a -70 offset coded into the source code that turns that 70 Control Number into a 0 for the first fader, 71 into 1 for the next, etc.

If you can change the Control Number in your MIDI controller, just set it to 70 (71, 72, etc for subsequent faders). Launch Jamulus with `--ctrlmidich x` where 'x' is the MIDI channel you're using, or launch it with `--ctrlmidich 0` to listen to all channels, and you're done. Make sure you connect your MIDI device's output port to the Jamulus MIDI in port (Qjackctl (Linux), MIDI Studio (MacOS) or whatever you use for managing connections). In Linux you will need to install and launch a2jmidid so your device shows up in the MIDI tab in Qjackctl.

If you can't change the Control Numbers in your controller, you will need to modify and re-compile the sources:
In the file `src/soundbase.cpp`, go to line 290, remove the `- 70` at the end (not the semicolon) to use Control Number 0 for the first fader, or replace that number with the initial Control Number your MIDI device sends. Save, [compile](Compiling) and install.

## Running Jamulus with Multiple Audio Interfaces

It is possible to run Jamulus with multiple Audio Interfaces on all three operating systems. Useful when we need to output an instrument through external audio card for minimal latency and computer microphone for communication. Other use cases may apply.  [See this guide for details](Running-Jamulus-with-Multiple-Audio-Interfaces)
