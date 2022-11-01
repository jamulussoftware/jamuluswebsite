
[Kommentar]: # (Dies ist eine Include-Datei zur Verwendung in mehreren Dokumenten)

- `-h` oder `--help`           Hilfetext anzeigen         
  
- `-i` oder `--inifile`        Speicherort der Initialisierungsdatei festlegen (überschreibt die Vorgabe)
- `-n` oder `--nogui`          GUI abschalten (zur Verwendung im Headless-Modus)                      
  
- `-p` oder `--port`           Legt die lokale UDP-Portnummer fest. Standard ist 22124
- `--jsonrpcport`           Ermöglicht die Steuerung der App durch den JSON-RPC-API-Server, setzt die TCP-Portnummer (EXPERIMENTAL, APIs können sich ändern; nur von localhost aus zugänglich). Siehe [die JSON-RPC-API-Dokumentationsdatei](https://github.com/jamulussoftware/jamulus/blob/master/docs/JSON-RPC.md).
- `--jsonrpcsecretfile`     Erforderlich bei Verwendung von `--jsonrpcport`. Legt einen Pfad zu einer Textdatei fest, die eine Authentifizierungszeichenfolge für den Zugriff auf die JSON-RPC-API enthält.
- `-Q` oder `--qos`            Legt den Wert des DS Byte für den Quality of Service fest. Standard ist 128 (DSCP/CS4). QoS wird von Windows ignoriert. Um es zu aktivieren, [siehe diese Seite](QOS-Windows)
- `-t` oder `--notranslation`  UI-Sprachübersetzungen deaktivieren
- `-6` oder `--enableipv6`     Aktivieren der IPv6-Adressierung (IPv4 ist immer aktiviert)
- `-v` oder `--version`        Versionsinformationen ausgeben und beenden
