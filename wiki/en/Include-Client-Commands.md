|<nobr> `-M` or `--mutestream` </nobr>| Prevent others on a Server from hearing what I play |
|<nobr> `--mutemyown` </nobr>| Prevent me from hearing what I play in the Server mix (headless only) |
|<nobr> `-c` or `--connect` </nobr>| Connect to given Server address on startup, format `address[:port]`. `-c` connects directly, so the Server's port must already be reachable from your computer - the Server's operator may need to open the port in the router, cloud firewall/security group, and/or OS firewall. (Viewing the server list in the GUI opens the port for you; `-c` does not, whether or not the Server is registered with a Directory.) |
|<nobr> `-j` or `--nojackconnect` </nobr>| Disable auto JACK connections |
|<nobr> `--ctrlmidich` </nobr>| MIDI channel to listen on, Jamulus control + MIDI control number and count of consecutive CC numbers (or Jamulus channels), pick-up mode, device selection option. Format: `channel[;fn[*n]][;pn[*n]][;sn[*n]][;mn[*n]][;on][;u][;dDeviceName]` See [Tips & Tricks](Tips-Tricks-More#using---ctrlmidich-for-midi-controllers). |
|<nobr> `--clientname` </nobr>| Window title and JACK client name |
