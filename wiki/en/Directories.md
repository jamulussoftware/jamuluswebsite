---
layout: wiki
title: "Directories"
lang: "en"
permalink: "/wiki/Directories"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}


# Running a Directory

This is a specialised Jamulus Server configuration, as described in [Server Modes](Running-a-Server#server-modes).

To view Servers listed by a Custom Directory, users must enter the address of that Directory in their Client's Settings > Advanced Setup > Custom Directories field. Multiple addresses can be added in this way if needed. Custom Directories will then appear in the Directory drop-down list on their Connect window. Custom Directories otherwise work for Clients in the same way as Public Directories, displaying a list of Servers registered with them.

To run a Server as a Directory, it should be started with the `--directoryserver` option to make itself (that is, `localhost` or `127.0.0.1`) the Directory to query for Servers.

When running a Server with the GUI, set the Custom Directory server address in the Options tab to "localhost", then select "Custom" from the Directory drop-down list.


### Points to note about Directories

- If you want to control which Servers can register with your Directory, you can enable a whitelist with the `--listfilter` command line option in the format `ip address 1[;ip address 2]`.

- When running a Server behind a NAT firewall on a private network and registering with a Directory on the same network, run the Server using the `--serverpublicip` option to specify the public IP address.  This is necessary to allow Clients on the public Internet to connect to the correct address.  Note that for the Server(s) using this option, you will still need proper port forwarding in your router/firewall.

- When running a Client behind a NAT firewall on a private network with a Directory on the same network, the Directory itself needs to be run using the `--serverpublicip` option to specify the public IP address, so that any Servers on the public Internet registering with the Directory that require the "hole punch" can be accessed by the Client(s). (This is because otherwise the Directory would provide the local network address of the Client to the Server and the "hole punch" would fail.)

- If you need to restart your Directory for any reason (for example when rebooting the host), Servers connected to it will be disconnected until they re-register. This does not mean that Clients connected to those Servers will be disconnected, but does mean that new Clients will be not able to see Servers listed by your Directory until those Servers reconnect. To enable the list of registered Servers to persist between restarts, use the `--directoryfile` option to specify the location and name of a file that the Directory can read and write to.

- Up to 150 Servers can then register with a Directory.
