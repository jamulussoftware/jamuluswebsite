---
layout: post
title: "Jamulus with Video"
heading: "Using Jamulus with video conferencing tool"
author: "ann0see"
lang: "en"
---

Jamulus does not support video natively. However, it is possible to use a video conferencing tool like Jitsi or Zoom to have out of sync video.

<!--more-->

## General notes about Video

Jamulus does not support video to reduce bandwidth and computer load. Running a video stream via Jitsi or Zoom (especially on the same computer you run Jamulus on) might result in degraded or unusable audio quality. This is also the case if you don't have much bandwidth!

Please keep the following in mind:

1. It is perfectly possible to use Jamulus without video. You can keep in sync by following a keyboard or drummer.
2. Video will be out of sync. However, some people did succeed with Jitsi. Conducting might be difficult or impossible (most video conferencing tools don't provide low latency video).
3. Video conferencing tools might try to access your audio devices. Therefore, use a separate device like your phone with which you join video. If you can't use a separate device, you **need** to open Jamulus before starting your conferencing tool, and you **must not** join "Computer Audio".

## Basic setup

Using video is not difficult. Just create a meeting and don't join computer audio.

### Jitsi

[Jitsi Meet](https://meet.jit.si/) is an open source, browser based easy to use video conferencing tool. There are multiple servers available throughout the internet.

#### Disable joining with audio

You should disable joining with audio, which can be done by adding the config parameter `config.startSilent=true` to the Jitsi link. A Jitsi URL look like that: `https://<add-jitsi-server-here>/myMeeting#config.startSilent=true`.

#### Reduce video quality

Reducing video quality might give Jamulus more bandwidth. However, this might not work for you. Set video quality as follows:

1. Click on the three dots on the bottom right
2. Select "Manage call quality"
3. Move the slider to "Low definition".

**Notes:**
1. Setting low quality video might not work on Linux
2. You might be able to force low video quality by adding specific configuration parameters to the Jitsi link: A valid link might look like this: `https://<add-jitsi-server-here>/myMeeting#config.resolution=180&config.constraints.video.aspectRatio=16/9&config.constraints.video.height.ideal=200&config.constraints.video.height.max=200&config.constraints.video.height.min=200`

#### Optimize Jitsi by disabling unneeded features

To reduce PC load and disable audio, you can also use the following options: `https://<add-jitsi-server-here>/myMeeting#config.startSilent=true&config.prejoinPageEnabled=false&config.disableAudioLevels=true&config.enableLipSync=false&config.enableLayerSuspension=true&config.disableE2EE=true&config.p2p.enabled=false`.

An "all in one" example link with multiple other options might look like that: `https://meet.jit.si/MyJamulusExampleMeeting#config.prejoinPageEnabled=false&disableInviteFunctions=true&config.startSilent=true&config.startWithVideoMuted=true&config.disableAudioLevels=true&config.resolution=180&config.constraints.video.aspectRatio=16/9&config.constraints.video.height.ideal=200&config.constraints.video.height.max=200&config.constraints.video.height.min=200&config.p2p.enabled=false&config.disableAGC=true&config.disableHPF=true&config.disableNS=true&config.enableLipSync=false&config.enableLayerSuspension=true&config.disableE2EE=true&config.stereo=true&config.enableNoisyMicDetection=false&config.disableAP=true&config.requireDisplayName=true`


### Zoom

[Zoom](https://zoom.us/) is a proprietary video conferencing tool the [Jamulus WorldJam](https://worldjam.vip/) uses for video.

#### Disable joining with audio

Before joining a meeting, you will be asked if you also want to join "Computer Audio". Dismiss this message by closing the window. If you already joined Computer Audio, click on the arrow next to the Mute button and select "Leave Computer Audio".

## Advanced setup

Using Video and routing Audio from Jamulus into your video conferencing software is more difficult. Since there are multiple options on every operating system, they are not described here (yet). However, there are some hints which might help you:

1. Linux users can user JACK and a PulseAudio bridge to route Jamulus audio into your web-browser or video conferencing app. This is quite easy with a program like QjackCtl or Carla. [JamulusOS](https://sourceforge.net/projects/jamulus-os/) has almost everything ready to use.
2. MacOS users might use BlackHole.
3. Windows users might use ASIO Link Pro or VoiceMeeter and virtual audio cables. However, audio routing on Windows might be more complicated than on macOS and Linux.

See [Tips and Tricks](/wiki/Tips-Tricks-More#using-jamulus-audio-in-zoom-or-other-meeting-apps) for more information.
