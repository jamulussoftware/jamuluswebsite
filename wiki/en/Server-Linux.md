---
layout: wiki
title: "Server Installation - Linux"
lang: "en"
permalink: "/wiki/Server-Linux"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Running a Server" branch1-url="Running-a-Server" %}

# Server Installation - Linux

**_Please ensure you have read the [server overview](Running-a-Server)_**


## Running a server with a GUI on a desktop machine

If you have installed the Jamulus client, you can run it in your chosen [server mode](Choosing-a-Server-Type) by running Jamulus with the `-s` option as follows:

1. Open a terminal window (`CTRL+ALT+t` on Ubuntu and related distros).
1. Assuming Jamulus is in `/usr/local/bin`, type `Jamulus -s`

Hit return and you should see the server control window. You can stop the server by closing the server window, or by using `CTRL+C` in the terminal.

**To configure the server**, please refer to [the Windows & macOS instructions](Server-Win-Mac), and [Command Line Options](Command-Line-Options) for other parameters you can set.

## Running a "headless" server

The following is for running Jamulus as a "pure" server on **hardware without audio** (e.g. on a 3rd party/cloud host) and assumes Ubuntu/Debian distributions using systemd. We also have instructions for [Raspberry Pi](Server-Rpi).

1. Download the [latest headless .deb file]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }})
1. Update apt to make sure you have a current list of standard packages: `sudo apt update`
1. Install the Jamulus package: `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Enable the headless server process via systemd: `sudo systemctl enable jamulus-headless`
1. Add your desired [command line options](Command-Line-Options) to the `ExecStart` line in the systemd service file in `/lib/systemd/system/jamulus-headless.service` (By default you will be running a private server).
1. Reload the systemd files `sudo systemctl daemon-reload` and restart the headless server: `sudo systemctl restart jamulus-headless`
1. Check all is well with `service jamulus-headless status` (hit `q` to get back to the command prompt).

## Notes

You can control Jamulus with the `service` command. For example, to stop the server cleanly:

`sudo service jamulus-headless stop`

### Viewing The Logs

Jamulus will log to the system file if you left the `StandardOutput=journal` setting in the unit file. Logging to the system log is recommended, as the system will manage the log file for you - no need to come back and purge it later or worry about filling up your disk space.

To view the log, use `journalctl` (to exit press Ctrl-C). For example, to read the system log file, filtered for the Jamulus service:

`journalctl -u jamulus-headless`

For today’s entries:

`journalctl -u jamulus-headless --since today`

For the last hour:

`journalctl -u jamulus-headless --since "1 hour ago"`

Filter the log to see connection messages for your Jamulus server:

`journalctl -u jamulus-headless | grep connected`

Follow (show on screen) Jamulus log messages as they occur:

`journalctl -f -u jamulus-headless`

### Upgrading

To upgrade your server to a newer version, simply download a new .deb and re-install as step 3.

### Recording

See [this information](/wiki/Tips-Tricks-More#controlling-recordings-on-linux-headless-servers) on controlling recordings on headless servers.
