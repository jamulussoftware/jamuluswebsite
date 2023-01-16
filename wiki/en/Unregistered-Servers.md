---
layout: wiki
title: "Running an Unregistered Server"
lang: "en"
permalink: "/wiki/Unregistered-Servers"
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# Running an Unregistered Server

It is highly recommended to test your Server by registering it on one of the built-in Directories **first**. This will help you tackle general problems before you try unregistered mode.

## Setting up a Server behind a home router

If you set up your Server at home, you will probably need to change some settings in your router/firewall:

### Port forwarding

Normally, people from outside your home network cannot see things inside it. To let external Jamulus Clients connect to your Server, you need to set up port forwarding in your router's settings. The exact setup differs for every router. For help, see your router's documentation or [portforward.com](https://portforward.com).

**Note:** The default port for Jamulus is **UDP** (not TCP) port **22124**. You will usually forward the port **22124** from outside your network to the port **22124** of the computer running the Server.

### Getting the public IP

To allow others to connect to your Server from the internet, give them your public internet IP address. You can [learn your current address using Google](https://www.google.com/search?q=what+is+my+ip).
You should connect yourself using the local network address of the computer the Server is running on. If you are running a Client on the same computer as your Server, the address is `localhost` or `127.0.0.1`.


### Dynamic DNS and why you will probably need it

Unless your ISP provides you with a fixed IP address, you may find that your address changes over time. You might want to set up "dynamic DNS" to get a static address you can share with others. A "dynamic DNS" provider can supply you with a static IP address that you can share, but you need to keep refreshing your dynamic IP with the provider. Your router might support certain providers to do this. If this is not the case, the provider will have instructions on how to set up a dynamic DNS client.

## DNS SRV record support

Jamulus Clients support [DNS SRV records ("service" records)](https://en.wikipedia.org/wiki/SRV_record). If a Client finds an SRV record associated with the domain name given in the Connect window, it will try to connect to the endpoint host and port listed in the SRV record. This process is similar to HTTP redirection in a web browser, only it's between Jamulus Clients and the DNS server. The Jamulus Server is not involved in this interaction. Jamulus Servers just listen for connections on the same port listed in the SRV record.

#### Why is this helpful?

A Jamulus Client can connect to a Server on a non-default port by specifying the port as part of the server address. A server administrator may want to give users a simple address without the port details, while still serving Jamulus on a non-default port. For this case, the port information can be acquired from an SRV record.

An address entered in the Connect window could look like ```jamulus.example.com```. If an SRV record is found for this DNS domain, Jamulus Client will try to connect to the Server on the host:port listed in the SRV record, such as ```jamulus.example.com:12345```.

If no SRV records are found on the DNS server, a Client will attempt to connect to the Server as specified in the connection window.

#### Creating SRV records

SRV records are created by the administrator of the domain being used to host the Jamulus server. The SRV records are added through the administration portal (or API if available) of the domain's DNS hosting service. The format of the SRV record entry can vary by DNS hosting service but will generally look something like this.

~~~
  _service._proto.name. ttl IN SRV priority weight port target
  
  # or, more specifically
  
  _jamulus._udp.example.com. 60 IN SRV 0 5 12345 jamulus.example.com
~~~

**Note:** You can host many Jamulus Servers at different ports on one host by giving each its own SRV record.

See the documentation of your DNS provider for instructions on creating an SRV record.

#### Example use case with SRV records

This example assumes the DNS contains an A or CNAME record that resolves to ```server1.example.com```, where three Jamulus Server instances are running, each listening on one of the three ports listed below.

Alternatively, `server1.example.com` can be a router, NAT-gateway, or load-balancer that forwards each of the ports to a backend Jamulus server (or servers).


| JAMULUS CLIENT     |  DNS SRV RECORD                                                             | JAMULUS SERVER             |
| ------------------ | --------------------------------------------------------------------------- | -------------------------- |
| rock.example.com  |  _jamulus._udp.rock.example.com 300 IN SRV 0 5 22124 server1.example.com  | server1.example.com:22124 |
| jazz.example.com  |  _jamulus._udp.jazz.example.com 300 IN SRV 0 5 22125 server1.example.com  | server1.example.com:22125 |
| blues.example.com |  _jamulus._udp.blues.example.com 300 IN SRV 0 5 22126 server1.example.com | server1.example.com:22126 |

*It's important to remember that DNS is not forwarding connections. It's simply telling Jamulus Client what public host:port to connect to.*

