
[comment]: # (Detta är en inkluderingsfil för användning i flera dokument)

- `-h` eller `--help` Visa hjälptext
- `-i` eller `--inifile` Ange platsen för initieringsfilen (ersätter
  standard). På macOS anger du bara ett filnamn, eftersom
  konfigurationsfiler endast kan läsas från
  `/Users/<användarnamn>/Library/Containers/app.jamulussoftware.Jamulus/Data/`.
  För servern ersätter du `app.jamulussoftware.Jamulus` med
  `app.jamulussoftware.JamulusServer`. Aktivera "Visa Library-mappen" i
  "Visa alternativ" i Finder för att se denna mapp.)
- `-n` eller `--nogui` Inaktivera GUI (för användning i headless-läge)
- `-p` eller `--port` Sätter det lokala UDP-portnumret. Standard är 22124
- `--jsonrpcport` Aktiverar JSON-RPC API-server för att styra appen, ställ
  in TCP-portnummer (EXPERIMENTELLT, API:er kan ändras; endast tillgängligt
  från localhost). Se [JSON-RPC
  API-dokumentationsfilen](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Krävs när `--jsonrpcport` används. Anger en sökväg
  till en textfil som innehåller en autentiseringstextsträng för att få
  åtkomst till JSON-RPC API:et.
- `--jsonrpcbindip` Den IP-adress som JSON-RPC-servern ska binda
  till. (valfritt, standard är 127.0.0.1)
- `-Q` eller `--qos` Ställer in kvaliteten på tjänstens
  DS-fältbyte. Standard är 128 (DSCP/CS4). QoS ignoreras av Windows. För att
  aktivera det, se [denna sida](QOS-Windows)
- `-t` eller `--notranslation` Inaktivera översättningar av
  användargränssnittets språk
- `-6` eller `--enableipv6` Aktivera IPv6-adressering (IPv4 är alltid
  aktiverat)
- `-v` eller `--version` Skriv ut versionsinformation och avsluta
