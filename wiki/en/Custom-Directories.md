---
layout: wiki
title: "Custom Directories"
lang: "en"
permalink: "/wiki/Custom-Directories"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}


# Running a Custom Directory 

This is a specialised Jamulus Server configuration, as described in [Server Types](Running-a-Server#server-types). 

To view Servers listed by a Custom Directory, users must enter the address of that Directory in their client's Settings > Advanced Setup > Custom Directories field. Multiple addresses can be added in this way if needed. Custom Directories will then appear in the Directory drop-down list on their Connect window. Custom Directories otherwise work for clients in the same way as Public Directories, displaying a list of Servers registered with them.

To run a Server as a Directory, it should be started with the `--directoryserver` option to make itself (that is, 'localhost' or '127.0.0.1') the Directory to query for Servers.

When running a Server with the GUI, select "Custom" from the Directory drop-down list, and set the Custom Directory Address field in the Options tab.  


### Points to note about Directories

- If you want to control which Servers can register with your Directory, you can enable a whitelist with the `--listfilter` command line option in the format `ip address 1[;ip address 2]`. 

- When running a Directory behind a NAT firewall on a private network, use the `--serverpublicip` option to specify the public IP address of the Server(s) being listed by your Directory if those Servers are on the same LAN / with the same public IP as the Directory. This is necessary to allow clients on the public Internet to connect to them via NAT. Note that for the Servers using this option, you will still need proper port forwarding in your router/firewall.

- If you are running your Server as a Directory and need to restart it for any reason (for example when rebooting the host), Servers connected to it will be disconnected until they re-register. This does not mean that clients connected to those Servers will be disconnected, but does mean that new clients will be not able to see Servers listed by your Directory until those Servers reconnect. To enable the list of registered Servers to persist between restarts, use the `--directoryfile` option to specify the location and name of a file that the Directory can read and write to.

- Up to 150 Servers can then register with a Directory.
