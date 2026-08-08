
[comment]: # (This is an include file for use in multiple documents)

|<nobr> `-h` or `--help`</nobr>| Display help text |
|<nobr> `-i` or `--inifile`</nobr>| Set location of initialization file (overrides default. On macOS simply provide a filename only, since config files can only be read from `/Users/<username>/Library/Containers/app.jamulussoftware.Jamulus/Data/`. For the server replace `app.jamulussoftware.Jamulus` with `app.jamulussoftware.JamulusServer`. Turn on "Show Library folder" in "Show view options" in Finder to see this folder.) |
|<nobr> `-n` or `--nogui`</nobr>| Disable GUI (for use in headless mode) |
|<nobr> `-p` or `--port`</nobr>| Sets the local UDP port number. Default is 22124 |
|<nobr> `--jsonrpcport`</nobr>| Enables JSON-RPC API server to control the app, set TCP port number (EXPERIMENTAL, APIs might change; only accessible from localhost). Please see [the JSON-RPC API Documentation file](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md). |
|<nobr> `--jsonrpcsecretfile`</nobr>| Required when using `--jsonrpcport`. Sets a path to a text file containing an authentication string for getting access to the JSON-RPC API. |
|<nobr> `--jsonrpcbindip`</nobr>| The IP address the JSON-RPC server should bind to. (optional, defaults to 127.0.0.1) |
|<nobr> `-Q` or `--qos`</nobr>| Sets the quality of service DS Field byte. Default is 128 (DSCP/CS4). QoS is ignored by Windows. To enable it, [see this page](QOS-Windows) |
|<nobr> `-t` or `--notranslation`</nobr>| Disable UI language translations |
|<nobr> `-6` or `--enableipv6`</nobr>| Enable IPv6 addressing (IPv4 is always enabled) |
|<nobr> `-v` or `--version`</nobr>| Output version information and exit |
