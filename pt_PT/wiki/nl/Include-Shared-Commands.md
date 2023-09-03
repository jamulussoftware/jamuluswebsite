
[comment]: # (Dit bestand is opgenomen in meerdere documenten)

- `-h` of `--help` Laat de help tekst zien
- `-i` of `--inifile` Stel de locatie van het initialisatiebestand in (heeft
  voorrang op de standaardinstelling. Geef op macOS alleen een bestandsnaam
  op, aangezien configuratiebestanden alleen kunnen worden gelezen vanuit
  `/Users/<gebruikersnaam>/Library/Containers/io.jamulus
  .Jamulus/Data/`. Vervang voor de server `io.jamulus.Jamulus` door
  `io.jamulus.JamulusServer`. Schakel "Toon bibliotheekmap" in "Toon
  weergaveopties" in Finder in om deze map te zien.)
- `-n` of `--nogui` Schakel de GUI uit (voor gebruik in headless mode)
- `-p` of `--port` Stelt het lokale UDP poort nummer in. Standaard is dit:
  22124
- `--jsonrpcport` Schakelt de JSON-RPC API-server in om de app te besturen,
  het TCP-poortnummer in te stellen (EXPERIMENTEEL, API's kunnen veranderen;
  alleen toegankelijk vanaf localhost). Zie ook [het JSON-RPC API
  documentatie bestand
  (engelstalig)](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Vereist bij gebruik van `--jsonrpcport`. Stelt een
  pad in naar een tekstbestand dat een authenticatietekenreeks bevat om
  toegang te krijgen tot de JSON-RPC API.
- `--jsonrpcbindip` Het IP-adres waaraan de JSON-RPC-server moet binden
  (optioneel, standaard is dit 127.0.0.1).
- `-Q` of `--qos` Stelt de DS Field byte van de Quality of Service
  in. Standaard is dit: 128 (DSCP/CS4). QoS wordt genegeerd door Windows. Om
  het in te schakelen, [zie deze pagina](QOS-Windows)
- `-t` of `--notranslation` Schakelt UI-vertaling uit
- `-6` of `--enableipv6` Schakelt IPv6 adressen in (IPv4 is altijd
  ingeschakeld)
- `-v` of `--version` Laat de versie informatie zien
