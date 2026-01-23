---
layout: wiki
title: "DNS SRV Record Support"
lang: "en"
permalink: "/wiki/DNS-SRV-Support"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# DNS SRV Record Support

Jamulus Clients and Servers support [DNS SRV records ("service" records)](https://en.wikipedia.org/wiki/SRV_record). Depending on the version of Jamulus, if it finds a DNS SRV record associated with the domain name given, it will try to connect to the endpoint host and port listed in the SRV record. This process is similar to HTTP redirection in a web browser, only it's between Jamulus and the DNS server. The Jamulus Server is not involved in this interaction. Jamulus Servers just listen for connections on the same port listed in the SRV record.

#### 3.10.0

Clients with version 3.10.0 or later support SRV records for a hostname given in the following contexts:

* In the Connect dialog as "Server Address".
* On the command line with `-c`, to specify immediate direct connection to a server.

#### 3.12.0

In addition to the above, both Clients and Servers with version 3.12.0 or later also support SRV records for a hostname given to specify a Directory, in the following contexts:

* Server: `-e` or `--directoryaddress` option on the command line.
* Server: (GUI) in the "Custom Directory address" setting under "Options".
* Client: (GUI) in the list of custom directories under "Advanced Setup" in "Settings".

#### Why is this helpful?

Jamulus can connect to a Server or Directory on a non-default port by specifying the port as part of the server address. A server administrator may want to give users a simple address without the port details, while still serving Jamulus on a non-default port. For this case, the port information can be acquired from an SRV record.

An address entered in the Connect window, or for a Custom Directory, could look like `jamulus.example.com`. If no explicit port number is specified, and an SRV record is found for this DNS domain, Jamulus will try to connect to the Directory or Server on the host:port listed in the SRV record, such as `jamulus.example.com:12345`.

If no SRV records are found on the DNS server, Jamulus will attempt to connect to the Directory or Server address on the default port number 22124.

#### Creating SRV records

SRV records are created by the administrator of the domain being used to host the Jamulus server. The SRV records are added through the administration portal (or API if available) of the domain's DNS hosting service. The format of the SRV record entry can vary by DNS hosting service but will generally look something like this.

~~~
  _service._proto.name. ttl IN SRV priority weight port target
  
  # or, more specifically
  
  _jamulus._udp.example.com. 60 IN SRV 0 5 12345 jamulus.example.com
~~~

**Note:** You can host many Jamulus Servers at different ports on one host by giving each its own SRV record. This avoids having to give your users the port number, which may be less memorable than a name.

See the documentation of your DNS provider for instructions on creating an SRV record.

#### Example use case with SRV records

This example assumes the DNS contains an A or CNAME record that resolves to `server1.example.com`, where three Jamulus Server instances are running, each listening on one of the three ports listed below.

Alternatively, `server1.example.com` can be a router, NAT-gateway, or load-balancer that forwards each of the ports to a backend Jamulus server (or servers).


| JAMULUS CLIENT      | DNS SRV RECORD                                                             | JAMULUS SERVER              |
| ------------------- | -------------------------------------------------------------------------- | --------------------------- |
| `rock.example.com`  | `_jamulus._udp.rock.example.com 300 IN SRV 0 5 22124 server1.example.com`  | `server1.example.com:22124` |
| `jazz.example.com`  | `_jamulus._udp.jazz.example.com 300 IN SRV 0 5 22125 server1.example.com`  | `server1.example.com:22125` |
| `blues.example.com` | `_jamulus._udp.blues.example.com 300 IN SRV 0 5 22126 server1.example.com` | `server1.example.com:22126` |

*It's important to remember that DNS is not forwarding connections. It's simply telling Jamulus Client what public host:port to connect to.*

