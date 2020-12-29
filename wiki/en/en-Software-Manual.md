---
layout: wiki
title: "Software Manual"
lang: "en"
permalink: "/wiki/Software-Manual"
---
Jamulus Help (Software Manual)
==============================

Main Window
-----------


![Main window](https://user-images.githubusercontent.com/20726856/97360410-77476880-189e-11eb-99c6-f4a68258bf31.png)

### Status LEDs

The **Delay** status LED shows the current audio delay status:

![image](https://user-images.githubusercontent.com/4561747/99384024-b6c60b00-28c6-11eb-9e7d-aa1e4245353f.png)


**Green** - The delay is perfect for a jam session

![image](https://user-images.githubusercontent.com/4561747/99384041-bb8abf00-28c6-11eb-96ab-c1c08acf2a85.png)


**Yellow** - A session is still possible but it may be harder to play


![image](https://user-images.githubusercontent.com/4561747/99384044-bded1900-28c6-11eb-8971-9ab6ee1908b5.png)


**Red** - The delay is too large for jamming





The **Buffers** status LED shows the current audio/streaming status. If the light is **red**, the audio stream is interrupted. This is caused by one of the following problems:

- The network jitter buffer is not large enough for the current network/audio interface jitter.
- The sound card's buffer delay (buffer size) is too small (see Settings window).
- The upload or download stream rate is too high for your internet bandwidth.
- The CPU of the client or server is at 100%.

### Input level

![Input level](https://user-images.githubusercontent.com/20726856/97363247-9516cc80-18a2-11eb-8195-1e887ee8040f.png)

This shows the level of the two stereo channels for your audio input.
Make sure not to clip the input signal to avoid distortions of the audio signal (the LEDs will indicate clipping when it occurs).



### Chat button

![Chat dialog](https://user-images.githubusercontent.com/20726856/97360717-d7d6a580-189e-11eb-84db-80536e17dc30.png)

The chat text entered in that dialog is sent to
all connected clients. If a new chat message arrives and the Chat dialog is not already open, it will
opened automatically for all clients.

### Profile window

![My profile dialog](https://user-images.githubusercontent.com/20726856/97360811-f9379180-189e-11eb-98bf-7f44f884adaa.png)

From the View menu, select My Profile... to set your Alias/Name
which is displayed below your fader in the server audio mixer board. If an instrument and/or country is set,
icons for these selections will also be shown below your fader. The skill setting changes the background colour of
the fader tag and the city entry shows up in the tool tip of the fader tag (see screenshot below).

![Fader tag tool tip](https://user-images.githubusercontent.com/20726856/97360889-166c6000-189f-11eb-802d-330e761ed017.png)

### Connect/disconnect button

Opens a dialog where you can select a server to connect to. If you are connected,
pressing this button will end the session.

![Connect dialog](https://user-images.githubusercontent.com/20726856/97360965-31d76b00-189f-11eb-870b-f58be6e30f04.png)

The Connection Setup window shows a list of available servers together with the number of occupants and the maximum number supported. Server operators can optionally list their servers by musical genre. Use the List dropdown to select a genre, click on the server you want to join and press the Connect button to connect to it. Alternatively, double-click on the server name. Permanent servers (those that have been listed for longer than 24 hours) are shown in bold.

You can filter the list by server name or location. To list only occupied servers, enter a "#" character.

If you know the IP address or URL of a server, you can connect to it using the Server Name/Address
field. An optional port number can be added after the IP address or URL using a colon as a separator, e.g,
jamulus.example.com:22124. The field will also show a list of the most recently used server addresses.

### Mute Myself button

Cuts your audio stream to the server so that you will be able to hear yourself and see your own input levels, but other musicians will not. Be aware that other musicians will not know if you have muted yourself.

### Reverb effect

![Reverberation](https://user-images.githubusercontent.com/20726856/97361142-6e0acb80-189f-11eb-8fd7-e03aa4ffc662.png)

Reverb can be applied to one local mono audio channel or to both channels in stereo mode.
The mono channel selection and the reverberation level can be modified. For example, if a microphone signal is fed
in to the right audio channel of the sound card and a reverb effect needs to be applied, set the channel selector
to the right and move the fader upwards until the desired reverb level is reached.

### Local audio pan / balance control

![Local audio pan / balance control](https://user-images.githubusercontent.com/20726856/97361250-8c70c700-189f-11eb-82c2-9a9d768dcfff.png)

Controls the relative levels of the left and right local audio channels. For a mono signal
it acts as a pan between the two channels. For example, if a microphone is connected to the right input channel and
an instrument is connected to the left input channel which is much louder than the microphone, move the audio fader to increase the relative volume of the mic.

### Server audio mixer

![Audio faders](https://user-images.githubusercontent.com/20726856/97361324-a5797800-189f-11eb-80d4-3a93e5728b99.png)

The audio mixer screen shows each user connected to the server (including yourself).
The faders allow you to adjust the level of what you hear without affecting what others hear.

The VU meter shows the input level at the server - that is, the sound being sent.

If you have set your Audio Channel to Stereo or Stereo Out in your Settings, you will also see a pan control (shift-click to reset).

If you see a "mute" icon above a user, it means that person cannot hear you. Either they have muted you, soloed one or more users not including you, or have set your fader in their mix to zero.

Using the **Mute button** prevents users being heard in your local mix. Be aware that when you mute someone, they will see a "muted" icon above your fader to indicate that you cannot hear them. Note also that you will continue to see their VU meters moving if sound from the muted user is reaching the server. Your fader position for them is also unaffected.

The **Solo button** allows you to hear one or more users on their own. Those not soloed will be muted. Note also that those people who are not soloed will see a "muted" icon above your fader.

Users are listed left to right in the order that they connect. You can change the sort order using the Edit option in the application menu.

You can group users together using the "group" toggle. Moving the fader of any member of the group will move the other faders in that group by the same amount. You can isolate a channel from the group temporarily with shift-click-drag.

If the server operator has enabled recording, you will see a message above the mixer showing that you are being recorded.



Settings Window
---------------

![image](https://user-images.githubusercontent.com/4561747/99384700-b7ab6c80-28c7-11eb-845e-c137793941d4.png)

### Sound card device

![Sound card device Windows](https://user-images.githubusercontent.com/20726856/97361494-e70a2300-189f-11eb-9095-2c34ad07314d.png)
![Sound card device macOS](https://user-images.githubusercontent.com/20726856/97361570-02752e00-18a0-11eb-8475-e92a57ce6ae7.png)

The ASIO driver (sound card) can be selected using Jamulus under the Windows operating system. If the selected ASIO
driver is not valid an error message is shown and the previous valid driver is selected. Under macOS the input and output hardware can be selected.

### Input/output channel mapping

![Channel mapping](https://user-images.githubusercontent.com/20726856/97361637-1caf0c00-18a0-11eb-9b65-81225b7e3dd5.png)

If the selected sound card device offers more than one input or output channel, the _Input Channel Mapping
and Output Channel Mapping_ settings are visible. For each Jamulus input/output channel (left and right channel)
a different actual sound card channel can be selected.

### Enable small network buffers

Allows support for very small network audio packets. These are only used if the sound card buffer delay is smaller than 128 samples. The smaller the network buffers, the
lower the audio latency. But at the same time the network load increases and the probability of audio dropouts
also increases.

### Buffer delay

![Buffer delay](https://user-images.githubusercontent.com/20726856/97361710-3c463480-18a0-11eb-8d5c-07ed6590ccac.png)

The buffer delay setting is a fundamental setting of the Jamulus software. This setting has an influence on many
connection properties. Three buffer sizes are supported:

- 64 samples: The preferred setting. Provides the lowest latency but does not work with all sound cards.
- 128 samples: Should work for most available sound cards.
- 256 samples: Should only be used on very slow computers, or with a slow internet connection.

Some sound card drivers do not allow the buffer delay to be changed from within the Jamulus software.
In this case the buffer delay setting is disabled and has to be changed using the sound card driver. On Windows, press the ASIO Setup button to open the driver settings panel.

![Buffer delay Windows](https://user-images.githubusercontent.com/20726856/97361808-65ff5b80-18a0-11eb-88d6-fb2131f10c75.png)

On Linux, use the JACK configuration tool to change the buffer size.

The actual buffer delay has an influence on the connection status, the current upload rate and the overall delay.
The lower the buffer size, the higher the probability of a red light in the status indicator (drop outs) and the
higher the upload rate and the lower the overall delay.

![Buffer delay dependencies](https://user-images.githubusercontent.com/20726856/97361878-816a6680-18a0-11eb-8c1f-fbf956be4b81.png)

The buffer setting is therefore a trade-off between audio quality and overall delay.

### Jitter buffer with buffer status indicator

![Jitter buffer](https://user-images.githubusercontent.com/20726856/97361956-9b0bae00-18a0-11eb-85de-dc2ded891175.png)

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

### Audio channels

![Audio channels](https://user-images.githubusercontent.com/20726856/97362020-b24a9b80-18a0-11eb-8a55-ee536b29460b.png)

Selects the number of audio channels to be used for communication between client and server. There are three modes
available:

Mono and Stereo modes use one and two audio channels respectively.

Mono-in/Stereo-out: The audio signal sent to the server is mono but the return signal is stereo. This is useful if the sound card has the instrument on one input channel and the microphone on the other. In that case
the two input signals can be mixed to one mono channel but the server mix is heard in stereo.

Enabling stereo mode will increase your stream's data rate. Make sure your upload rate does
not exceed the available upload speed of your internet connection.

In stereo streaming mode, no audio channel selection for the reverb effect will be available on
the main window since the effect is applied to both channels in this case.

### Audio quality

![Audio quality](https://user-images.githubusercontent.com/20726856/97362080-c42c3e80-18a0-11eb-87ac-9a4ca948bbcf.png)

The higher the audio quality, the higher your audio stream's data rate. Make sure your upload rate does not exceed the available upload speed of your internet connection.

### New client level

![New client level](https://user-images.githubusercontent.com/20726856/97362173-e2923a00-18a0-11eb-8401-9ad71866f6b1.png)

This setting defines the fader level of a newly connected client in percent. If a new user connects
to the current server, they will get the specified initial fader level if no other fader level from a previous connection of
that user was already stored. You can set all users in an occupied server to this level using Edit > "Set All Faders to New Client Level".


### Fancy skin

![Fancy skin](https://user-images.githubusercontent.com/20726856/97362214-f9389100-18a0-11eb-9adb-ebf2c1d18007.png)

This applies a fancy skin to the main window.

### Custom central server address

![Central server address](https://user-images.githubusercontent.com/20726856/97362265-0a819d80-18a1-11eb-9b0c-2f7ecf21841c.png)

Leave this blank unless you need to enter the address of a central server other than the default.

### Current connection status parameter

![Indicators](https://user-images.githubusercontent.com/20726856/97362338-271dd580-18a1-11eb-99b7-02c9371a6258.png)

The Ping Time is the time required for the audio stream to travel from the client to the server and back again.
This delay is introduced by the network and should about 20-30ms. If this delay is higher than about 50ms,
your distance to the server is too large or your internet connection is not sufficient.

Overall Delay is calculated from the current Ping Time and the delay introduced by the current buffer settings.

Audio Upstream Rate depends on the current audio packet size and compression setting. Make sure that the upstream
rate is not higher than your available internet upload speed (check this with a service such as [librespeed.org](https://librespeed.org/)).
