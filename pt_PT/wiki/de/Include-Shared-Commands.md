
[Kommentar]: # (Dies ist eine Include-Datei zur Verwendung in mehreren
Dokumenten)

- `-h` oder `--help` Hilfetext anzeigen
- `-i` oder `--inifile` Setzt Speicherort der ini-Datei (überschreibt
  Standardeinstellung. Gebe unter macOS nur einen Dateinamen
  an. Konfigurationsdateien können nur aus
  `/Users/<Benutzername>/Library/Containers/io.jamulus.Jamulus/Data/`
  gelesen werden. Für den Server ersetze `io.jamulus.Jamulus` durch
  `io.jamulus.JamulusServer`. Aktiviere ‚Ordner „Library“ anzeigen’ unter
  „Darstellung“ im Finder um den Ordner anzuzeigen.)
- `-n` oder `--nogui` GUI deaktivieren (zur Verwendung im Headless-Modus)
- `-p` oder `--port` Legt die lokale UDP-Portnummer fest. Standard ist 22124
- `--jsonrpcport` Ermöglicht die Steuerung der App durch den
  JSON-RPC-API-Server, setzt die TCP-Portnummer (EXPERIMENTELL, APIs können
  sich ändern; nur von localhost aus zugänglich). Siehe [die
  JSON-RPC-API-Dokumentationsdatei](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Erforderlich bei Verwendung von
  `--jsonrpcport`. Legt einen Pfad zu einer Textdatei fest, die eine
  Authentifizierungszeichenfolge für den Zugriff auf die JSON-RPC-API
  enthält.
- '--jsonrpcbindip' Die IP-Adresse, auf die der JSON-RPC-Server hören
  soll. (optional, Standardwert ist 127.0.0.1)
- `-Q` oder `--qos` Legt den Wert des DS Byte für den Quality of Service
  fest. Standard ist 128 (DSCP/CS4). QoS wird von Windows ignoriert. Um es
  zu aktivieren, [siehe diese Seite](QOS-Windows)
- `-t` oder `--notranslation` UI-Sprachübersetzungen deaktivieren
- `-6` oder `--enableipv6` IPv6-Adressierung aktivieren (IPv4 ist immer
  aktiviert)
- `-v` oder `--version` Versionsinformationen ausgeben und beenden
