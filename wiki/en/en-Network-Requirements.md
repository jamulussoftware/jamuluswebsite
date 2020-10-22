---
layout: wiki
title: "Quality, Delay and Network Bandwidth"
lang: "en"
permalink: "/wiki/Network-Requirements"
---

# Network Requirements

## Audio bandwidth

The audio settings have an impact on the required network bandwidth. The below table summarizes the network requirements with respect to the configuration of:
* channels : stereo/mono
* quality : high/medium/low
* audio buffer duration : 2.67ms, 5.33ms, 10.67ms, 21.33ms

With the following units
* ms : milliseconds
* Kbps : Kilo-bits per seconds (Reminder : 1Mbps = 1024Kbps, 1KByte = 8Kbits)
* Mbps : Mega-bits per seconds

| Channels  | Quality | Bandwidth (for buffer : 2.67ms) |  Bandwidth (for buffer : 5.33ms) | Bandwidth (for buffer : 10.67ms) | Bandwidth (for buffer : 21.33ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Stereo    | High   | 894 Kbps | 657 Kbps | 541 Kbps | 483 Kbps |
| Stereo    | Medium | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Stereo    | Low    | 606 Kbps | 372 Kbps | 256 Kbps | 198 Kbps |
| Mono      | High   | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Mono      | Medium | 594 Kbps | 366 Kbps | 250 Kbps | 192 Kbps |
| Mono      | Low    | 534 Kbps | 306 Kbps | 190 Kbps | 132 Kbps |

## Network bandwidth

There is one upstream (musician sending to the server) and one downstream (server sending back the mix to the musician)

![image](https://user-images.githubusercontent.com/9976944/79274940-999b0b00-7ea5-11ea-85be-3ded5ee198d5.png)

Note also that mean ADSL2 transfer rate is 10 Mbits/second for downstream and 1 Mbit/second for upstream. The actual performance depends on distance to the provider, which may [theoretically range from 24Mb/s at 0.3km to 1.5Mb/s at 5.2km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) for download rate.

