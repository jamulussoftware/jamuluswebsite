---
layout: wiki
title: "Bandwidth Use"
lang: "en"
permalink: "/wiki/Server-Bandwidth"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

## Audio bandwidth

The audio settings have an impact on the required network bandwidth. The table below summarises network requirements with respect to the configuration of:
* Channels : stereo/mono
* Quality : max/high/medium/low
* Audio buffer duration : 2.67 ms (64 samples), 5.33 ms (128 samples), 10.67 ms (256 samples)

With the following units
* ms : milliseconds
* Kbit/s : Kilo-bits per second (Reminder : 1 Mbit/s = 1024 Kbit/s, 1 KByte/s = 8 Kbit/s)
* Mbit/s : Mega-bits per second

| Channels  | Quality | Bandwidth (for buffer : 2.67 ms) |  Bandwidth (for buffer : 5.33 ms) | Bandwidth (for buffer : 10.67 ms) |
| --------- | ------ | -------- | -------- | -------- |
| Stereo    | Max    | 2004 Kbit/s | 1770 Kbit/s | 1654 Kbit/s |
| Stereo    | High   | 906 Kbit/s  | 729 Kbit/s  | 613 Kbit/s  |
| Stereo    | Medium | 678 Kbit/s  | 447 Kbit/s  | 331 Kbit/s  |
| Stereo    | Low    | 612 Kbit/s  | 375 Kbit/s  | 259 Kbit/s  |
| Mono      | Max    | 1236 Kbit/s | 1002 Kbit/s | 886 Kbit/s  |
| Mono      | High   | 684 Kbit/s  | 480 Kbit/s  | 364 Kbit/s  |
| Mono      | Medium | 600 Kbit/s  | 369 Kbit/s  | 253 Kbit/s  |
| Mono      | Low    | 540 Kbit/s  | 309 Kbit/s  | 193 Kbit/s  |

## Network bandwidth

There is one upstream (musician sending to the Server) and one downstream (server sending back the mix to the musician)
<figure>
        <img src="{% include img/en-screenshots/bandwidth-diagram.inc %}" loading="lazy" alt="A diagram of Jamulus network bandwidths from different audio qualities ranging from low to high">
<figcaption>Calculate bandwidth use </figcaption>
</figure>

Note also that mean ADSL2 transfer rate is 10 Mbit/s for downstream and 1 Mbit/s for upstream. The actual performance depends on distance to the provider, which may [theoretically range from 24 Mbit/s at 0.3 km to 1.5 Mbit/s at 5.2 km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) for download rate.

