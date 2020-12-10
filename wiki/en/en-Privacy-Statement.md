---
layout: wiki
title: "Jamulus – Privacy Statement"
lang: "en"
permalink: "/wiki/Privacy-Statement"
---

# Privacy Statement
## Homepage
This homepage jamulus.io tries not to collect your personal data. If you connect to the jamulus.io site, your IP is sent to GitHub Pages. Furthermore, since we link the SourceForge logo in the footer of every page, also SourceForge might get your IP.
We do not set tracking cookies, although SourceForge might do so. If you do not wish this, please disable cookies in your browser.

## Jamulus software

### Use of Profile Information

When you connect to a public or private Jamulus server, whatever you put in My Profile (in Settings) will be shown to others on that server while you are connected to it. The server does not otherwise store or record your Profile information and the server operator has no access to it unless they are also connected as a client.

When you connect to a public server, your profile is also available to third parties from the Central Server to which that server is registered. This is can be for informational purposes about the status of the public Jamulus network (for example, [here](https://explorer.jamulus.io/)), but may not be limited to that. Profile information is not otherwise logged or stored by the Jamulus server you are connected to, or by the Jamulus Central Server, but may be stored or processed by third parties.

### Use of IP Addresses

When you connect to a public or private server, the server operator can see your IP address while you are connected.  If the server operator has enabled logging (which is off by default) your IP address will also be logged and stored in the server's log file.

As a server operator, when you register a public server with a Central Server, your IP address is sent to CloudFlare (1.1.1.1) in order to identify your public IP address. The IP addresses of all public servers registered with the Central Server can also be seen by third parties for informational or other purposes (for example [here](https://explorer.jamulus.io/)). Your public IP address is otherwise not logged or stored by Jamulus, but may be stored or processed by third parties.

_Users concerned by the use of CloudFlare's network can [re-compile](Compiling) the Jamulus source code to use an alternative for WELL_KNOWN_HOST/ WELL_KNOWN_PORT in [global.h](https://github.com/corrados/jamulus/blob/master/src/global.h#L111)_

### Audio Recordings

You will see a notice if you are connected to a Jamulus server while server recording is turned on. Recordings of each player are stored by the server separately as .WAV files and only the server operator has access to them.

### Text Chat

When you type a message in the Chat Window, other connected players can see that, but chats are not stored by the server and neither the server operator nor any third parties have access to them.
