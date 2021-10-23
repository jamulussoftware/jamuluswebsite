---
layout: wiki
title: "Software Manual"
lang: "en"
permalink: "/wiki/Software-Manual"
---
# Jamulus User Manual
 {:.no_toc}

This manual documents the Jamulus client application for use by musicians and singers using the software to connect to a server.

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details> 

# Main Window


<figure>
	<img src="{{site.url}}/assets/img/en-screenshots/main-screen-medium.png" style="border: 5px solid grey;" loading="lazy" alt="Image of the Jamulus main window">
	<figcaption>Your local mix when connected to a Server</figcaption>
</figure>

## Delay and Buffer LEDs

**Delay** shows the status of the current audio latency:

<figure><img src="{{site.url}}/assets/img/en-screenshots/led-green.png" style="float:left; margin-right:10px;" loading="lazy" alt="Image of a green LED symbol"></figure>

**Green** - The delay is perfect for a jam session

<figure><img src="{{site.url}}/assets/img/en-screenshots/led-yellow.png" style="float:left; margin-right:10px;" loading="lazy" alt="Image of a yellow LED symbol"></figure>

**Yellow** - A session is still possible but it may be harder to play

<figure><img src="{{site.url}}/assets/img/en-screenshots/led-red.png" style="float:left; margin-right:10px; clear: both;" loading="lazy" alt="Image of a green red symbol"></figure>

**Red** - The delay is too large for jamming

**Buffers** shows the current audio/streaming status. If the light is **red**, the audio stream is interrupted. This is caused by one of the following problems:

- The network jitter buffer is not large enough for the current network/audio interface jitter.
- The sound card's buffer delay (buffer size) is too small (see Settings window).
- The upload or download stream rate is too high for your internet bandwidth.
- The CPU of the client or server is at 100%.


## Input

Shows the level of the two stereo channels for your audio input.
Make sure not to clip the input signal to avoid distortions of your sound (the LEDs will indicate clipping when it occurs).

## Mute Myself button

Cuts your audio stream to the server so that you will be able to hear yourself and see your own input levels, but other musicians will not. Be aware that other musicians will not know if you have muted yourself.

## Reverb effect

Adds reverb to your local mono audio channel, or to both channels in stereo mode.
The mono channel selection and the reverberation level can be modified. For example, if a microphone signal is fed
in to the right audio channel of the sound card and a reverb effect needs to be applied, set the channel selector
to the right and move the fader upwards until the desired reverb level is reached.


## Chat

Opens the chat window. Text entered is sent to
all connected clients. If a new chat message arrives and the Chat dialogue is not already open, it will
open automatically for all clients.

## Connect/disconnect button

Opens a dialogue where you can select a server to connect to. If you are connected,
pressing this button will end the session.

<figure><img src="{{site.url}}/assets/img/en-screenshots/connection-setup-window.png" style="border: 5px solid grey;" loading="lazy" alt="Image of a server connection window"></figure>

The Connection Setup window shows a list of available servers together with the number of occupants and the maximum number supported. Server operators register their servers on lists (mostly defined by genre, though some could be location-specific or for all genres). Use the List dropdown to select a genre, click on the server you want to join and press the Connect button to connect to it. Alternatively, double-click on the server name. Permanent servers (those that have been listed for longer than 24 hours) are shown in bold.

You can filter the list by server name or location. To list only occupied servers, enter a "#" character.

If you know the IP address or URL of a server, you can connect to it using the Server Name/Address
field. An optional port number can be added after the IP address or URL using a colon as a separator, e.g,
`jamulus.example.com:22124`. The field will also show a list of the most recently used server addresses.

## Server audio mixer

<figure><img src="{{site.url}}/assets/img/en-screenshots/mixer-channles.png" style="float:left; margin-right:10px; margin-bottom:20px; border: 5px solid grey;" loading="lazy" alt="Image of a pair of server mixer controls"></figure>

The audio mixer screen shows each user connected to the server (including yourself).
The faders allow you to adjust the level of what you hear without affecting what others hear.

The VU meter shows the input level at the server - that is, the sound being sent.

If you have set your Audio Channel to Stereo or Stereo Out in your Settings, you will also see a pan control (shift-click to reset).

If you see a "mute" icon above a user, it means that person cannot hear you. Either they have muted you, soloed one or more users not including you, or have set your fader in their mix to zero.

### Grp button

Defines a group of audio channels. Moving the fader of one member of the group moves the faders of all the others. Up to 8 groups can be defined.

### Mute button

Prevents users being heard in your local mix. Be aware that when you mute someone, they will see a "muted" icon above your fader to indicate that you cannot hear them. Note also that you will continue to see their VU meters moving if sound from the muted user is reaching the server. Your fader position for them is also unaffected. 

Note that muting your **own** channel simply means you will not hear your signal from the server (and is not advised as it can lead to you becoming out of time with other players). This is therefore not the same as using "[Mute Myself](#mute-myself-button)".

### Solo button

Allows you to hear one or more users on their own. Those not soloed will be muted. Note also that those people who are not soloed will see a "muted" icon above your fader.

Users are listed left to right in the order that they connect. You can change the sort order using the Edit option in the application menu.

You can group users together using the "group" toggle. Moving the fader of any member of the group will move the other faders in that group by the same amount. You can isolate a channel from the group temporarily with shift-click-drag.

If the server operator has enabled recording, you will see a message above the mixer showing that you are being recorded.




# Settings

## My Profile

From the Settings menu, select "My Profile..." to set your Alias/Name
which is displayed below your fader in the server audio mixer board.

<figure><img src="{{site.url}}/assets/img/en-screenshots/settings-profile.png" style="border: 5px solid grey;" loading="lazy" alt="Image of a profile window"></figure>

If you set an instrument and/or country, icons for these selections will also be shown below your fader. The skill setting changes the background colour of the fader tag and the city entry shows up in the tool tip of the fader tag:

<figure><img src="{{site.url}}/assets/img/en-screenshots/profile-tooltip.png" style="width:30%;" loading="lazy" alt="Image of a tooltip showing profile information"></figure>


### Skin

This applies a skin to the main window, some of which are designed to accommodate larger ensembles.

### Mixer rows

This sets the number of rows displayed in the server audio mixer, for use with larger ensembles.


## Audio/Network Setup

<figure><img src="{{site.url}}/assets/img/en-screenshots/settings-network.png" style="border: 5px solid grey;" loading="lazy" alt="Image of a profile window"></figure>

### Device

Under the Windows operating system the ASIO driver (sound card) can be selected using Jamulus. If the selected ASIO
driver is not valid an error message is shown and the previous valid driver is selected. Under macOS the input and output hardware can be selected.

### Input/output channel mapping

<figure><img src="{{site.url}}/assets/img/en-screenshots/channel-mapping.png" style="float:left; margin-right:10px; margin-bottom:20px;" loading="lazy" alt="Image of Input and output channel mapping"></figure>

If the selected sound card device offers more than one input or output channel, the _Input Channel Mapping
and Output Channel Mapping_ settings are visible. For each Jamulus input/output channel (left and right channel)
a different actual sound card channel can be selected.


### Audio channels

Selects the number of audio channels to be used for communication between client and server. 

**Note**: It is preferable to run separate client instances per voice/instrument, with each client given its own ini file, rather than using this built-in mono pair to stereo mixer.

There are three modes available:

**Mono** and **Stereo** modes use one and two audio channels respectively.

**Mono-in/Stereo-out**: The audio signal sent to the server is mono but the return signal is stereo. This is useful if the sound card has the instrument on one input channel and the microphone on the other. In that case
the two input signals can be mixed to one mono channel but the server mix is heard in stereo.

Enabling stereo mode will increase your stream's data rate. Make sure your upload rate does
not exceed the available upload speed of your internet connection.

In stereo streaming mode, no audio channel selection for the reverb effect will be available on
the main window since the effect is applied to both channels in this case.

### Audio quality

The higher the audio quality, the higher your audio stream's data rate. Make sure your upload rate does not exceed the available upload speed of your internet connection.

### Buffer Delay

The buffer delay setting is a fundamental setting of the Jamulus software. This setting has an influence on many
connection properties. Three buffer sizes are supported:

- **64 samples** Provides the lowest latency but does not work with all sound cards.
- **128 samples** The preferred setting. Should work for most available sound cards.
- **256 samples** Should only be used on very slow computers, or with a slow internet connection.

Some sound card drivers do not allow the buffer delay to be changed from within the Jamulus software.
In this case the buffer delay setting is disabled and has to be changed using the sound card driver. On Windows, press the ASIO Setup button to open the driver settings panel.

On Linux, use the JACK configuration tool to change the buffer size.

The actual buffer delay has an influence on the connection status, the current upload rate and the overall delay.
The lower the buffer size, the higher the probability of a red light in the status indicator (dropouts) and the
higher the upload rate and the lower the overall delay.

The buffer setting is therefore a trade-off between audio quality and overall delay.



### Jitter Buffer

The jitter buffer compensates for network and sound card timing jitters. The size of the buffer
therefore influences the quality of the audio stream (how many dropouts occur) and the overall delay
(the longer the buffer, the higher the delay).

You can set the jitter buffer size manually for your local client and the remote server. For the local jitter
buffer, dropouts in the audio stream are indicated by the light below the jitter buffer size faders.
If the light turns to red, a buffer overrun/underrun has taken place and the audio stream is interrupted.

The jitter buffer setting is therefore a trade-off between audio quality and overall delay.

If the Auto setting is enabled, the jitter buffers
of your local client and the remote server are set automatically based on measurements of the network and sound card
timing jitter. If the Auto check is enabled, the jitter buffer size faders are disabled (they cannot be moved with the mouse).

### Enable small network buffers

Allows support for very small network audio packets. These are only used if the sound card buffer delay is smaller than 128 samples. The smaller the network buffers, the
lower the audio latency. But at the same time the network load increases and the probability of audio dropouts
also increases (particuarly if your network connection has any significant jitter). Try enabling this option if you are suffering from high latency or bad audio quality. However, keeping it disabled will normally mean better audio quality.

### Measurements

The Ping Time is the time required for the audio stream to travel from the client to the server and back again.
This delay is introduced by the network and ideally should be about 20-30 ms. When this delay is higher than about 50 ms, it starts to become
more noticeable and you may find it harder to keep in time, though it is still possible once you get used to it. Factors such as tempo, the instrument
played or headphone isolation will have an impact on the delay you find you can deal with.
The most probable causes for a high delay are that your distance to the server is too large or your internet connection is not sufficient.

Overall Delay is calculated from the current Ping Time and the delay introduced by the current buffer settings.

Audio Upstream Rate depends on the current audio packet size and compression setting. Make sure that the upstream
rate is not higher than your available internet upload speed (check this with a service such as [librespeed.org](https://librespeed.org/)).

## Advanced Setup

<figure><img src="{{site.url}}/assets/img/en-screenshots/settings-advanced.png" style="border: 5px solid grey;" loading="lazy" alt="Image of a profile window"></figure>

### Custom directory server address

Leave this blank unless you need to enter the address of a directory server other than the default.

### New Client Level

This setting defines the fader level of a newly connected client in percent. If a new user connects
to the current server, they will get the specified initial fader level if no other fader level from a previous connection of
that user was already stored. You can set all users in an occupied server to this level using Edit > "Set All Faders to New Client Level".

### Input Boost

Increases the gain from your device. Use this if your device delivers a gain that is too quiet for Jamulus.

### Feedback Protection

Attempts to detect audio feedback loops or loud noise in the first three seconds after you connected to a server. Once detected, this feature will show a message and activate the "Mute Myself" button to mute you in your own mix. 

### Input Balance

Controls the relative levels of the left and right local audio channels. For a mono signal
it acts as a pan between the two channels. For example, if a microphone is connected to the right input channel and
an instrument is connected to the left input channel which is much louder than the microphone, move the audio fader to increase the relative volume of the mic.

# Menu commands

### File > Load/Save Mixer Channels Setup
 
You can save and restore the mix you have for your band rehearsals (fader, mute, pan, solo etc.) and load these any time (even while you are playing). Loading can also be done by drag/drop to the mixer window.


### Edit > Auto-Adjust All Faders 

Applies a one-off fader setting to each channel depending on its volume. Useful for large ensembles to get a reasonable overall mix, although individual adjustments might still be necessary. Best applied during a warm-up or a uniform part of the music piece. 

# Command Line Options

Most common functions in Jamulus can be set using the GUI, but these and others can also be set using options given in a terminal window. Exactly how you do this will depend on your operating system.

For example on Windows, to use a specific settings file, right-click on the Jamulus shortcut and choose "Properties" > Target. Add the necessary arguments to Jamulus.exe:

```shell
 "C:\Program Files\Jamulus\Jamulus.exe" --inifile "C:\path\to\myinifile.ini"
```

For macOS, start a Terminal window and run Jamulus with the desired options like this:

```shell
 /Applications/Jamulus.app/Contents/MacOS/Jamulus --inifile "/path/to/myinifile.ini"
```

**Note**: Command-line options will not alter settings made in the GUI. 

- `-M` or `--mutestream`  Starts Jamulus in muted state                                                      
- `--mutemyown`  Mute me in my personal mix ("headless" mode only)                                                      
-  `-c` or `--connect`  Connect to given server address on startup, format `address[:port]`  
-  `-j` or `--nojackconnect`  Disable auto JACK connections  
-  `--ctrlmidich`  MIDI controller channel to listen on, control number offset and consecutive CC numbers (channels). Format: `channel[;f*][;p*][;s*][;m*]` See [Tips & Tricks](Tips-Tricks-More#using-ctrlmidich-for-midi-controllers) 
- `--clientname`  Window title and JACK client name 
{% include_relative Shared-Commands.md %}

