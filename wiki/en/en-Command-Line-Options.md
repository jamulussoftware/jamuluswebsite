---
layout: wiki
title: "Command Line Options"
lang: "en"
permalink: "/wiki/Command-Line-Options"
---

# Command Line Options

While the most common functions in Jamulus can be set using the GUI, Jamulus can also be controlled using these options on the command line. Exactly how you do this will depend on your operating system.

For example, on Windows to enable recording with the `-R` option: right-click on the Jamulus shortcut and choose "Properties" > Target. Add the necessary arguments to Jamulus.exe:

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" -s -R "C:\path\to\your\Jam Recordings"
```

For macOS, start a Terminal window and run Jamulus with the desired options like this:

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus -s -R "/path/to/your/jam recordings"
```

***

You can see all possible options your version supports by starting Jamulus with the `-h` option.


| Short | Long name | `[...]` means optional parameter | |
|-------|-----------|----------------------------------|-|
|    `-c` |`--connect`        | Connect to given server address on startup, format `address[:port]` | (client only) |
|    `-d` |`--discononquit`   | Disconnect all clients on quit | (server only) |
|    `-e` |`--centralserver`  | Makes the server public and sets its genre. See also `-o`| (server only) [See list](Central-Servers). |
|    `-f` |`--listfilter`     | Whitelist servers registering on the serverlist, format `ip address 1[;ip address 2]` | (central server only) [See note](Choosing-a-Server-Type#3-central). |
|    `-F` |`--fastupdate`     | 64 samples frame size mode. Reduces latency if clients connect with "Enable Small Network Buffers" option. Requires faster CPU to avoid dropouts, and more bandwidth to enabled clients. | (server only) |
| `-h,-?` |`--help`           | This help text | (client and server) |
|    `-i` |`--inifile`        | Set location of initialization file (overrides default) | (client (always) and server (with GUI)) |
|    `-j` |`--nojackconnect`  | Disable auto JACK connections | (client only) |
|    `-l` |`--log` | Enable logging, set path and file name | (server only) |
|    `-m` |`--htmlstatus`     | Enable HTML status file, set path and file name | (server only) |
|    `-M` |`--mutestream`     | Starts Jamulus in muted state | (client only) |
|    `-n` |`--nogui`          | Disable GUI | (client and server) |
|    `-o` |`--serverinfo`     | Server location details in the format: <br/>`[name];[city];[locale value]` (see [values](https://doc.qt.io/qt-5/qlocale.html#Country-enum))| (public servers only) |
|    `-p` |`--port`           | Local UDP port number. Default is 22124 | (server only) |
|    `-R` |`--recording`      | Include a writable path where the files should be stored (in quotes if needed). | (server only) See description in [Server Setup](Server-Win-Mac#recording). |
|       | `--norecord`      | Start recorder with recording disabled | (server only) |
|    `-s` |`--server`         | Start in server mode | (server only) [See note](Choosing-a-Server-Type) |
|    `-t` |`--notranslation`  | Disable translations | (client and server) |
|    `-T` |`--multithreading` | Enable multithreading | (server only) |
|    `-u` |`--numchannels`    | Maximum number of users. Default is 10, maximum is 50 | (server only) |
|    `-w` |`--welcomemessage` | Supports HTML and inline CSS formatting (in enclosing quotes), or set path to text file. | (server only) |
|    `-z` |`--startminimized` | Start minimized | (server only) |
|       |`--ctrlmidich`     | MIDI controller channel to listen on and control number offset, format: `channel[;offset]` | (client only) see [Tips & Tricks](Tips-Tricks-More#Using-ctrlmidich-for-MIDI-controllers) |
|       |`--clientname`     | Window title and JACK client name | (client only) |
