
[commento]: # (Questo è un file di inclusione da utilizzare in più documenti)

- `-h` or `--help`           Visualizza il testo della guida         
- `-i` o `--inifile` Imposta la posizione del file di inizializzazione (sostituisce l'impostazione predefinita)
- `-n` or `--nogui`          Disabilita la GUI (usato per essere lanciato senza interfaccia grafica)                      
- `-p` or `--port`           Imposta la porta UDP del server. Di default è 22124
- `--jsonrpcport`            Enables JSON-RPC API server to control the app, set TCP port number (EXPERIMENTAL, APIs might change; only accessible from localhost). Please see [the JSON-RPC API Documentation file](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile`      Required when using `--jsonrpcport`. Sets a path to a text file containing an authentication string for getting access to the JSON-RPC API.
- `-Q` or `--qos`            Sets the quality of service DS Field byte. Default is 128 (DSCP/CS4). QoS is ignored by Windows. To enable it, [see this page](QOS-Windows)
- `-t` or `--notranslation`  Disable UI language translations
- `-6` or `--enableipv6`     Enable IPv6 addressing (IPv4 is always enabled)
- `-v` or `--version`        Output version information and exit
