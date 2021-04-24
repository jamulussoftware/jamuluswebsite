---
layout: wiki
title: "Command Line Options"
lang: "en"
permalink: "/wiki/Command-Line-Options"
---

# Command Line Options

Most common functions in Jamulus can be set using the GUI, but these and others can also be set using options given in a terminal window. Exactly how you do this will depend on your operating system.

For example on Windows, to have a client use a specific settings file, right-click on the Jamulus shortcut and choose "Properties" > Target. Add the necessary arguments to Jamulus.exe:

```shell
"C:\Program Files (x86)\Jamulus\Jamulus.exe" --inifile "C:\path\to\myinifile.ini"
```

For macOS, start a Terminal window and run Jamulus with the desired options like this:

```shell
/Applications/Jamulus.app/Contents/MacOS/Jamulus --inifile "/path/to/myinifile.ini"
```

***

You can see all possible options your version supports by starting Jamulus with the `-h` option.

_Note that the following options will not alter settings made in the GUI._

### General settings (client and server modes)

| Short   | Long name         | `[...]` means optional parameter                                                                             | Notes                                                    |
|---------|-------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| `-h,-?` | `--help`          | This help text                                                                                               |                                                          |
| `-i`    | `--inifile`       | Set location of initialization file (overrides default)                                                      | Client (always) and server (with GUI)                    |
| `-n`    | `--nogui`         | Disable GUI                                                                                                  |                                                          |
| `-p`    | `--port`          | Local UDP port number. Default is 22124                                                                      |                                                          |
|    `-Q` | `--qos`           | Sets the quality of service DSCP value. Default is 128. Disable with 0.  | QoS is ignored by Windows, but see [Tips & Tricks](Tips-Tricks-More#quality-of-service) for how to apply it. |
| `-t`    | `--notranslation` | Disable translations                                                                                         |                                                          |
| `-v`    | `--version`       | Output version information and exit | |

### Server only

| Short | Long name         | `[...]` means optional parameter                                                                                                                             | Notes                                                                    |
|-------|-------------------|----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| `-d`  | `--discononquit`  | Disconnect all clients on quit                                                                                                                               |                                                                          |
| `-e`  | `-alserver` | Makes the server public and sets its genre. See also `-o`                                                                                                    | See [server types](Choosing-a-Server-Type#3-directory)                     |
| `-f`  | `--listfilter`    | Whitelist servers registering on the server list, format `ip address 1[;ip address 2]`                                                                       | Directory servers only. [See note](Choosing-a-Server-Type#3-directory)     |
| `-F`  | `--fastupdate`    | Reduces latency if clients connect with "Enable Small Network Buffers" option. Requires faster CPU to avoid dropouts, and more bandwidth to enabled clients. |                                                                          |
| `-l`  | `--log`           | Enable logging, set path and file name                                                                                                                       |                                                                          |
| `-L`  | `--licence`       | Show an agreement window before users can connect                                                                                                            |                                                                          |
| `-m`  | `--htmlstatus`    | Enable HTML status file, set path and file name                                                                                                              |                                                                          |
| `-o`  | `--serverinfo`    | Server location details in the format:  `[name];[city];[locale value]` (see [values](https://doc.qt.io/qt-5/qlocale.html#Country-enum))                      | Public servers only                                                      |
| `-P`  | `--delaypan`      | Start with delay panning enabled                                                                                                                             | See [Server Setup](https://jamulus.io/wiki/Server-Win-Mac#other+options) |
| `-R`  | `--recording`     | Include a writeable path where the files should be stored (in quotes if needed).                                                                             | See [Server Setup](Server-Win-Mac#recording).                            |
|       | `--norecord`      | disables recording when enabled by default by -R                                                                                                             |                                                                    |


### Client only

| Short | Long name         | `[...]` means optional parameter                                                                                                         | Notes                                                                       |
|-------|-------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| `-M`  | `--mutestream`    | Starts Jamulus in muted state                                                                                                            |                                                                             |
|       | `--mutemyown`     | Mute me in my personal mix                                                                                                               | Headless only                                                               |
| `-c`  | `--connect`       | Connect to given server address on startup, format `address[:port]`                                                                      |                                                                             |
| `-j`  | `--nojackconnect` | Disable auto JACK connections                                                                                                            |                                                                             |
|       | `--ctrlmidich`    | MIDI controller channel to listen on, control number offset and consecutive CC numbers (channels). Format: `channel[;f*][;p*][;s*][;m*]` | See [Tips & Tricks](Tips-Tricks-More#Using-ctrlmidich-for-MIDI-controllers) |
|       | `--clientname`    | Window title and JACK client name                                                                                                        |                                                                             |


