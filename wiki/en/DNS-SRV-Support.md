---
layout: wiki
title: "DNS SRV Record Support"
lang: "en"
permalink: "/wiki/DNS-SRV-Support"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# DNS SRV Record Support

#### Connecting to a Server or Directory

The default UDP port on which a Jamulus Server or Directory listens is **22124**. Normally, when a Client or a Server is given a plain hostname or an IP address to connect to, such as `198.51.100.46` or `jamulus.example.com`, it will use `22124` as the destination port number.

Since a single Jamulus Server only provides a single "room", and a single Jamulus Directory only provides a single "list", it is often useful to run multiple Jamulus Server or Directory instances on a single host, sharing one IP address. In order to do this, the instances must each be made to listen on a different UDP port. This is done by specifying the port number on the command line, using `-p NNNNN` or `--port NNNNN`.

If such a Server is registered with a Directory, such as the standard Jamulus Directories, e.g. **Any Genre 1**, the port number in use is automatically detected by the Directory at registration time, and stored in the list which is sent to a Client. The user's Jamulus Client can then connect to the Server in the normal way from the list in the Connect Dialog.

However, a Jamulus instance wanting to connect _directly_ to a Server or Directory by IP or hostname must know the port number to use. This can be specified after the IP address or hostname, such as `198.51.100.46:22123` or `jamulus.example.com:22120`.

#### Using DNS SRV to publish port numbers

A [DNS SRV record ("service" record)](https://en.wikipedia.org/wiki/SRV_record) is a special DNS record that can be used to publish the port number and hostname that should be used to connect to a particular service.

Later versions of Jamulus Clients and Servers support [DNS SRV records ("service" records)](https://en.wikipedia.org/wiki/SRV_record). Depending on the version of Jamulus, if it finds a DNS SRV record associated with the domain name given, it will try to connect to the endpoint host and port listed in the SRV record. This process is similar to HTTP redirection in a web browser, only it's between Jamulus and the DNS server. The Jamulus Server is not involved in this interaction. Jamulus Servers just listen for connections on the same port listed in the SRV record.

SRV records are created by the administrator of the domain being used to host the Jamulus Server. The SRV records are added through the administration portal (or API if available) of the domain's DNS hosting service. The format of the SRV record entry can vary by DNS hosting service but will generally look something like this:

~~~
  _service._proto.name. ttl IN SRV priority weight port target.
~~~

In the case of Jamulus, the `service` must be `jamulus` and the `proto` must be `udp`, so the record will look like this:

~~~
  _jamulus._udp.example.com. 60 IN SRV 0 5 12345 jamulus.example.com.
~~~

This allows to host many Jamulus Servers at different ports on a single host with different hostnames by giving each its own SRV record. This avoids having to give your users the port number, which may be less memorable than a name.

See the documentation of your DNS provider for instructions on creating an SRV record.

#### Jamulus versions supporting SRV

Clients with version **3.10.0** or later support SRV records for a hostname given in the following contexts:

* In the Connect dialog as "Server Address".
* On the command line with `-c`, to specify immediate direct connection to a Server.

In addition to the above, both Clients and Servers with version **3.12.0** or later also support SRV records for a hostname given to specify a Directory, in the following contexts:

* Server: `-e` or `--directoryaddress` option on the command line.
* Server: (GUI) in the "Custom Directory address" setting under "Options".
* Client: (GUI) in the list of custom Directories under "Advanced Setup" in "Settings".

#### Why is this helpful?

Jamulus can connect to a Server or Directory on a non-default port by specifying the port as part of the Server address. A Server administrator may want to give users a simple address without the port details, while still serving Jamulus on a non-default port. For this case, the port information can be acquired from an SRV record, as described above.

In this case, an address entered in the Connect window, or for a custom Directory, could look like `jamulus.example.com`. If no explicit port number is specified, and an SRV record is found for this DNS domain, Jamulus will try to connect to the Directory or Server on the host:port listed in the SRV record, such as `jamulus.example.com:12345`.

If no SRV records are found on the DNS server, Jamulus will attempt to connect to the Directory or Server address on the default port number `22124`.

#### Example use case with SRV records

This example assumes the DNS contains an A or CNAME record that resolves to `server1.example.com`, where three Jamulus Server instances are running, each listening on one of the three ports listed below.

Alternatively, `server1.example.com` can be a router, NAT-gateway, or load-balancer that forwards each of the ports to a backend Jamulus Server (or Servers).


| JAMULUS CLIENT      | DNS SRV RECORD                                                             | JAMULUS SERVER              |
| ------------------- | -------------------------------------------------------------------------- | --------------------------- |
| `rock.example.com`  | `_jamulus._udp.rock.example.com 300 IN SRV 0 5 22124 server1.example.com`  | `server1.example.com:22124` |
| `jazz.example.com`  | `_jamulus._udp.jazz.example.com 300 IN SRV 0 5 22125 server1.example.com`  | `server1.example.com:22125` |
| `blues.example.com` | `_jamulus._udp.blues.example.com 300 IN SRV 0 5 22126 server1.example.com` | `server1.example.com:22126` |

*It's important to remember that DNS is not forwarding connections. It's simply telling Jamulus what public host:port to connect to.*

#### SRV for the main Jamulus public Directories

In the `jamulus.io` domain, SRV records have been created to specify the correct port for each of the standard public Directories:

| DIRECTORY              | DNS SRV RECORD                                                                    | JAMULUS SERVER               |
| ---------------------- | --------------------------------------------------------------------------------- | ---------------------------- |
| `anygenre1.jamulus.io` | `_jamulus._udp.anygenre1.jamulus.io. 60 IN SRV   0 0 22124 anygenre1.jamulus.io.` | `anygenre1.jamulus.io:22124` |
| `anygenre2.jamulus.io` | `_jamulus._udp.anygenre2.jamulus.io. 60 IN SRV   0 0 22224 anygenre2.jamulus.io.` | `anygenre2.jamulus.io:22224` |
| `anygenre3.jamulus.io` | `_jamulus._udp.anygenre3.jamulus.io. 60 IN SRV   0 0 22624 anygenre3.jamulus.io.` | `anygenre3.jamulus.io:22624` |
| `rock.jamulus.io`      | `_jamulus._udp.rock.jamulus.io. 60 IN SRV   0 0 22424 rock.jamulus.io.`           | `rock.jamulus.io:22424`      |
| `jazz.jamulus.io`      | `_jamulus._udp.jazz.jamulus.io. 60 IN SRV   0 0 22324 jazz.jamulus.io.`           | `jazz.jamulus.io:22324`      |
| `classical.jamulus.io` | `_jamulus._udp.classical.jamulus.io. 60 IN SRV   0 0 22524 classical.jamulus.io.` | `classical.jamulus.io:22524` |
| `choral.jamulus.io`    | `_jamulus._udp.choral.jamulus.io. 60 IN SRV   0 0 22724 choral.jamulus.io.`       | `choraljamulus.io.:22724`    |

This means that a Jamulus Server of version **3.12.0** or later can just give the hostname of the Directory to the `-e` or `--directoryaddress` option, without needing to find and specify the port number.
