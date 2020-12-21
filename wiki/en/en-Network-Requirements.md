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
* Kbit/s : Kilo-bits per seconds (Reminder : 1Mbit/s = 1024Kbit/s, 1KByte = 8Kbits)
* Mbit/s : Mega-bits per seconds

| Channels  | Quality | Bandwidth (for buffer : 2.67ms) |  Bandwidth (for buffer : 5.33ms) | Bandwidth (for buffer : 10.67ms) | Bandwidth (for buffer : 21.33ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Stereo    | High   | 894 Kbit/s | 657 Kbit/s | 541 Kbit/s | 483 Kbit/s |
| Stereo    | Medium | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s |
| Stereo    | Low    | 606 Kbit/s | 372 Kbit/s | 256 Kbit/s | 198 Kbit/s |
| Mono      | High   | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s |
| Mono      | Medium | 594 Kbit/s | 366 Kbit/s | 250 Kbit/s | 192 Kbit/s |
| Mono      | Low    | 534 Kbit/s | 306 Kbit/s | 190 Kbit/s | 132 Kbit/s |

## Network bandwidth

There is one upstream (musician sending to the server) and one downstream (server sending back the mix to the musician)
![image](https://user-images.githubusercontent.com/9976944/79274940-999b0b00-7ea5-11ea-85be-3ded5ee198d5.png)

Note also that mean ADSL2 transfer rate is 10 Mbit/s for downstream and 1 Mbit/s for upstream. The actual performance depends on distance to the provider, which may [theoretically range from 24Mbit/s at 0.3km to 1.5Mbit/s at 5.2km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) for download rate.
