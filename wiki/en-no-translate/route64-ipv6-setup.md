# IPv6 via Route64 Tunnelbroker on Ubuntu Server

A complete guide to setting up IPv6 connectivity using Route64's Wireguard tunnelbroker,
routing it to your LAN, and making it work correctly for all devices including Windows and Android.

    Copyright (C) 2026  Peter L Jones

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

---

## Example Address Summary

These addresses are placeholders.  You will need to replace these with your own values.
It might be easier to take a copy of the document and do global replaces once you have the real values.

| Address | Purpose |
|---------|---------|
| `10.0.0.123` | Your server's LAN IPv4 address |
| `10.0.0.1` | Your router's LAN IPv4 address |
| `198.51.100.154` | Your router's static external IPv4 address |
| `2a11:6c7:f06:af::1/64` | Route64 tunnel endpoint (their end) |
| `2a11:6c7:f06:af::2/64` | Your tunnel endpoint (wg0) |
| `2a11:6c7:1400:af00::1/56` | Your server's public IPv6 address (en0) |
| `2a11:6c7:1400:af01::1/64` | LAN gateway / radvd source (en0) |
| `2a11:6c7:1400:af01::/64` | LAN client prefix (autoconfigured via SLAAC) |
| `2a11:6c7:1400:af02::/64` … `77ff::/64` | Available for future use (Docker, DMZ, etc.) |

## Prerequisites

- Ubuntu 22.04+ server with a wired Ethernet connection to your router
- A domestic IPv4 router/modem (no IPv6 support required) with a static address
- Root/sudo access
- `systemd-networkd` as the network manager (check: `systemctl is-active systemd-networkd`)
- `nftables` for firewall (check: `sudo nft list ruleset`)
- `wg-quick` / `wireguard-tools` installed: `sudo apt install wireguard-tools`

Your network topology will look like this:

```
Internet
    ↓ IPv4
DSL Router (IPv4 only)
    ↓ Ethernet
Ubuntu Server (fs-peter)
    ├── en0  — LAN interface
    └── wg0     — Wireguard tunnel to Route64
```

---

## 1. Register with Route64

1. Go to [https://route64.org](https://route64.org) and create an account.
2. Verify your email address.
3. Note your public IPv4 address (e.g. `198.51.100.154`) — you'll need it when creating the tunnel.
   Check it with: `curl -s https://api4.ipify.org`

---

## 2. Create a Tunnelbroker

1. Log into Route64 and navigate to **Tunnelbroker → Add Tunnelbroker**.
2. Choose **Wireguard4** as the tunnel type.
3. Select the hub closest to you (e.g. `lon1.uk` for London).
4. Enter your public IPv4 address as **Your Endpoint**.
5. Submit — Route64 will allocate:
   - A `/64` transport network (e.g. `2a11:6c7:f06:af::/64`)
     - Their end: `::1`
     - Your end: `::2`
   - A `/56` routed prefix (e.g. `2a11:6c7:1400:af00::/56`)
   - Their WAN endpoint IP and port
   - A Wireguard public key

6. Download or copy the Wireguard config from the tunnel detail page.

---

## 3. Check Your Router/Modem

Before proceeding, check your router admin page for anything that could interfere:

- **IPv6 settings** — if IPv6 is enabled on the router, **disable it**. The router sending
  Router Advertisements (RAs) to the LAN will conflict with your server's RAs later.
  Even with IPv6 "disabled", check it isn't sending RAs:
  ```bash
  sudo tcpdump -i en0 -v "icmp6 and dst ff02::1" 2>&1 | grep "router advertisement" | head -5
  ```
  If you see RAs from anything other than your server, disable IPv6 on the router.

- **Firewall** — ensure the router passes through UDP on the Wireguard port
  (check the Route64 tunnel detail page for the endpoint port, e.g. `20048`).
  Most domestic routers do this automatically for outbound-initiated connections.

---

## 4. Configure the Wireguard Tunnel

Create the Wireguard config file. Replace values with those from your Route64 tunnel page:

```bash
sudo nano /etc/wireguard/wg0.conf
```

```ini
[Interface]
PrivateKey = <your private key>
Address = 2a11:6c7:f06:af::2/64

[Peer]
PublicKey = <route64 public key>
AllowedIPs = ::/1, 8000::/1
Endpoint = 185.121.24.12:20048
PersistentKeepalive = 15
```

Notes:
- `Address` is your `::2` transport address with `/64`
- `AllowedIPs = ::/1, 8000::/1` covers all IPv6 (split into two halves to avoid
  conflicting with the default route)
- `PersistentKeepalive = 15` keeps the tunnel alive through NAT

Enable and start:
```bash
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0
```

Verify the tunnel is up:
```bash
ip -6 addr show dev wg0
ping6 2a11:6c7:f06:af::1
```

You should get ping replies from Route64's end of the tunnel (`::1`) within ~10ms.

---

## 5. Assign Your IPv6 Addresses

You need two addresses from your `/56` pool:

- `2a11:6c7:1400:af00::1/56` — your server's public-facing address
- `2a11:6c7:1400:af01::1/64` — your LAN gateway address (for routing to clients)

Edit your netplan config (adjust filename to match yours):

```bash
sudo nano /etc/netplan/01_en0.yaml
```

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    en0:
      ipv6-privacy: false
      addresses:
        - 10.0.0.123/24
        - 2a11:6c7:1400:af00::1/56
        - 2a11:6c7:1400:af01::1/64
      nameservers:
        search: [lan]
        addresses: [10.0.0.1]
      routes:
        - to: default
          via: 10.0.0.1
```

Apply:
```bash
sudo netplan apply
```

Verify:
```bash
ip -6 addr show dev en0
```

You should see both `7700::1` and `7701::1` addresses.

---

## 6. Add the Routing Config for wg0

Create a systemd-networkd config for the wg0 interface to make routes persistent
(wg-quick sets these but they can be lost on systemd-networkd restarts):

```bash
sudo nano /etc/systemd/network/wg0.network
```

```ini
[Match]
Name=wg0

[Network]
Address=2a11:6c7:f06:af::2/64

[Route]
Destination=2a11:6c7:1400:af00::/56
Metric=100

[Route]
Destination=::/1
Scope=global
Metric=512

[Route]
Destination=8000::/1
Scope=global
Metric=512
```

```bash
sudo systemctl restart systemd-networkd
```

Verify routes:
```bash
ip -6 route show | grep -E "::/1|8000::|7700"
```

You should see all three routes via `wg0`.

---

## 7. Suppress SLAAC Address on the Server

The server will autoconfigure an EUI-64 address from the RA it sends to the LAN.
This causes source address selection problems (services reply from the wrong address).
Suppress it with a systemd-networkd drop-in:

```bash
sudo mkdir -p /etc/systemd/network/10-netplan-en0.network.d
sudo tee /etc/systemd/network/10-netplan-en0.network.d/no-slaac.conf << 'EOF'
[Network]
IPv6AcceptRA=no

[IPv6AcceptRA]
UseAutonomousPrefix=no
EOF
```

```bash
sudo systemctl restart systemd-networkd
```

Verify only static addresses remain:
```bash
ip -6 addr show dev en0
```

You should see only `7700::1`, `7701::1`, and the `fe80::` link-local — no dynamic addresses.

---

## 8. Enable IPv6 Forwarding

```bash
sudo tee /etc/sysctl.d/99-ipv6-forward.conf << 'EOF'
net.ipv6.conf.all.forwarding=1
net.ipv6.conf.en0.forwarding=1
EOF

sudo sysctl -w net.ipv6.conf.all.forwarding=1
```

---

## 9. Configure nftables

Add IPv6 firewall rules. Adjust the sets and ports to match your services.
This example includes Jamulus (a music collaboration app) as a template for UDP services.

```bash
# Create sets
sudo nft add set ip6 filter TcpOpen '{ type inet_service; elements = { 80, 443, 1022 } }'
sudo nft add set ip6 filter TcpLocal '{ type inet_service; flags interval; elements = { 22, 139, 445, 1714-1764, 5357-5358, 8022 } }'

# Create INPUT chain with drop policy
sudo nft add chain ip6 filter INPUT '{ type filter hook input priority filter; policy drop; }'
sudo nft add rule ip6 filter INPUT ct state established,related accept
sudo nft add rule ip6 filter INPUT ct state invalid drop
sudo nft add rule ip6 filter INPUT iif lo accept
sudo nft add rule ip6 filter INPUT meta l4proto ipv6-icmp accept
sudo nft add rule ip6 filter INPUT iif en0 ip6 saddr { fd5e::/16, fd5f::/16 } tcp dport @TcpLocal accept
sudo nft add rule ip6 filter INPUT tcp dport @TcpOpen accept
# Add your service-specific UDP rules here, e.g.:
# sudo nft add rule ip6 filter INPUT udp dport @JamulusServers accept
```

Tighten the FORWARD chain (get existing rule handles first):
```bash
sudo nft -a list chain ip6 filter FORWARD
# Note the handle numbers of the existing Docker jump rules, then:
sudo nft delete rule ip6 filter FORWARD handle <N>
sudo nft delete rule ip6 filter FORWARD handle <N>

sudo nft add rule ip6 filter FORWARD ct state established,related accept
sudo nft add rule ip6 filter FORWARD ct state invalid drop
sudo nft add rule ip6 filter FORWARD iifname "en0" oifname "wg0" accept
sudo nft add rule ip6 filter FORWARD iifname "wg0" oifname "en0" accept
sudo nft add rule ip6 filter FORWARD counter jump DOCKER-USER
sudo nft add rule ip6 filter FORWARD counter jump DOCKER-FORWARD
sudo nft chain ip6 filter FORWARD '{ policy drop; }'
```

**Important:** Use `iifname`/`oifname` (string match) rather than `iif`/`oif` (index match)
for wg0 rules — the interface must exist at rule load time for `iif`, but wg0 may not be
up when nftables starts at boot.

Save the ruleset:
```bash
sudo nft list ruleset | sudo tee /etc/nftables.conf
sudo systemctl enable nftables
```

---

## 10. Set Up radvd for LAN Clients

Install radvd to advertise your IPv6 prefix to LAN clients via SLAAC:

```bash
sudo apt install radvd
sudo nano /etc/radvd.conf
```

```
interface en0 {
    AdvSendAdvert on;
    AdvManagedFlag off;
    AdvOtherConfigFlag off;
    MinRtrAdvInterval 5;
    MaxRtrAdvInterval 10;
    AdvDefaultLifetime 1800;
    prefix 2a11:6c7:1400:af01::/64 {
        AdvOnLink on;
        AdvAutonomous on;
        AdvRouterAddr on;
    };
    RDNSS 2606:4700:4700::1111 2001:4860:4860::8888 {
        AdvRDNSSLifetime 600;
    };
};
```

Notes:
- `AdvDefaultLifetime 1800` — critical for Android; too short a lifetime causes Android
  to not set a default IPv6 route
- `MinRtrAdvInterval 5` / `MaxRtrAdvInterval 10` — send RAs frequently enough that
  clients don't lose their default route between advertisements
- `RDNSS` — provides IPv6 DNS servers; without this Android won't use IPv6 for name resolution

```bash
sudo systemctl enable radvd
sudo systemctl start radvd
```

---

## 11. Test External Connectivity

**Test your server's public address:**

```bash
ping6 2a11:6c7:1400:af00::1   # from the server itself
```

Then use the HE.net looking glass at [https://lg.he.net/](https://lg.he.net/):
- Select a node (e.g. London)
- Choose **ping**
- Enter `2a11:6c7:1400:af00::1`

You should get 0% packet loss replies.

**Test LAN client routing (Windows):**

```cmd
ping -6 ipv6.google.com
```

Should reply with ~10ms to a Google IPv6 address.

**Test LAN client routing (Android):**

In a network tool app, check that the WiFi connection shows:
- An address starting `2a11:6c7:1400:af01:`
- A route `::/0 -> fe80::<server link-local> wlan0`

Then ping `2606:4700:4700::1111` — should reply successfully.

**Test via test-ipv6.com:**

Visit [https://test-ipv6.com](https://test-ipv6.com) from any LAN client.
It should show your IPv6 address as `2a11:6c7:1400:af01:...` and score 10/10.

---

## 12. Verify Everything Survives Reboot

```bash
sudo reboot
```

After reboot check:

```bash
# Tunnel up
ping6 2a11:6c7:f06:af::1

# Addresses present
ip -6 addr show dev en0 | grep -E "7700|7701"

# Routes present
ip -6 route show | grep -E "::/1|8000::|7700"

# radvd running
systemctl is-active radvd

# nftables loaded
sudo nft list chain ip6 filter INPUT | grep policy
```

All should be healthy without any manual intervention.

---

## Troubleshooting

### BGP not needed
Route64 uses static routing — your `/56` is routed to your tunnel IP automatically.
Do not install FRR or configure BGP.

### Tunnel up but no external IPv6
Check the default routes are present:
```bash
ip -6 route show | grep -E "::/1|8000::"
```
If missing, restart wg-quick:
```bash
sudo systemctl restart wg-quick@wg0
```

### LAN clients have IPv6 address but no internet
Check IPv6 forwarding is enabled:
```bash
sysctl net.ipv6.conf.all.forwarding
```
Check the default routes are present (see above).
Check the FORWARD chain allows `en0 → wg0`.

### Android not getting default IPv6 route
- Ensure `AdvDefaultLifetime` is at least 1800 in radvd.conf
- Ensure the router/modem is NOT sending Router Advertisements
  (check with `sudo tcpdump -i en0 -v "icmp6 and dst ff02::1"`)
- Toggle WiFi off/on on the phone after changing radvd config

### Services replying from wrong IPv6 address
The server is autoconfiguring a SLAAC address and using it as the source.
Apply the no-slaac drop-in (Step 7) and verify only static addresses remain.

### nftables fails to load at boot with "Interface does not exist"
Use `iifname`/`oifname` instead of `iif`/`oif` for wg0 rules — the string
form doesn't require the interface to exist at load time.
