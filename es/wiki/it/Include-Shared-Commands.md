
[commento]: # (Questo è un file di inclusione da utilizzare in più
documenti)

- `-h` or `--help` Visualizza il testo della guida
- `-i` or `--inifile` Set location of initialization file (overrides
  default. On macOS simply provide a filename only, since config files can
  only be read from
  `/Users/<username>/Library/Containers/app.jamulussoftware.Jamulus/Data/`.
  For the server replace `app.jamulussoftware.Jamulus` with
  `app.jamulussoftware.JamulusServer`. Turn on "Show Library folder" in
  "Show view options" in Finder to see this folder.)
- `-n` or `--nogui` Disabilita la GUI (usato per essere lanciato senza
  interfaccia grafica)
- `-p` or `--port` Imposta la porta UDP del server. Di default è 22124
- `--jsonrpcport` Consente al server API JSON-RPC di controllare l'app,
  impostare il numero di porta TCP (SPERIMENTALE, le API potrebbero
  cambiare; accessibile solo da localhost). Vedere il [file di
  documentazione dell'API
  JSON-RPC](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Obbligatorio quando si utilizza
  `--jsonrpcport`. Imposta il percorso di un file di testo contenente una
  stringa di autenticazione per ottenere l'accesso all'API JSON-RPC.
- `--jsonrpcbindip` The IP address the JSON-RPC server should bind
  to. (optional, defaults to 127.0.0.1)
- `-Q` o `--qos` Imposta il byte del campo DS della qualità del servizio. Il
  valore predefinito è 128 (DSCP/CS4). Il QoS è ignorato da Windows. Per
  abilitarlo, [vedere questa pagina](QOS-Windows)
- `-t` o `--notranslation` Disabilita le traduzioni della lingua
  dell'interfaccia utente
- `-6` o `--enableipv6` Abilita l'indirizzamento IPv6 (IPv4 è sempre
  abilitato)
- `-v` o `--version` Stampa informazioni sulla versione ed esci
