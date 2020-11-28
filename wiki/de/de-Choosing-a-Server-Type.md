---
layout: wiki
title: "Auswählen einer Serverart"
lang: "de"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Serverarten

Du kannst einen Server in einem von drei „Modi“ betreiben (entweder bei dir zu Hause oder auf einem externen Server):

### 1. Öffentlich
Dein Server wird auf einer [Zentralserver](Central-Servers) Liste, die alle Clients standardmäßig verwenden, gelistet. Musiker können dann deinen Server finden und sich mit ihm verbinden. Du musst keinen öffentlicher Server mehr aufsetzen, da viele andere Leute schon solche Server betreiben. Verbinde dich einfach mit einem Server mit geringer Latenz und beginne zu jammen.

![PublicServer](https://user-images.githubusercontent.com/4561747/79310856-7e0b2100-7ef4-11ea-9511-b2e3339cab6f.png)

Diesen Modus kannst du aktivieren, indem du das Kontrollkästchen „Meinen Server registrieren...“ markierst und (optional) deine Serverinformationen eingibst.

Beim Betrieb ohne Oberfläche („headless“) kannst du einen öffentlichen Server wie folgt konfigurieren:

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "deinServerName;deineStadt;[country ID]"
~~~

**Achtung**: Du musst **keine** Portweiterleitung in deinem Router einrichten, wenn du einen öffentlichen Server betreibst.

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die du einstellen kannst.


### 2. Privat
Diese Serverart wird nicht in einer öffentlichen Serverliste aufgeführt. Du musst den Musikern deine Serveradresse geben, damit sie sich mit deinem Server verbinden können. Auf der Seite zum [Ausführen eines privaten Servers](Running-a-Private-Server) findest du Informationen darüber, was du tun musst, damit andere sich mit diesem Servertyp verbinden können.

![PrivateServer](https://user-images.githubusercontent.com/4561747/79310944-9f6c0d00-7ef4-11ea-9d8a-ecb0e668c22d.png)

Dieser Modus wird aktiviert, indem du den Haken bei „Meinen Server registrieren...“ entfernst.

Beim Betrieb ohne die Oberfläche („headless“) kannst du einen privaten Server wie folgt konfigurieren:

```shell
Jamulus --nogui --server
```

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die du einstellen kannst.

### 3. Zentral
Die Konfiguration eines Servers als Zentralserver muss nur unter besonderen Umständen (z.B. für Onlineveranstaltungen oder Musikvereine) vorgenommen werden. Normalerweise kannst du diesen Typ ignorieren.

Um einen Server, der an einem benutzerdefinierten, zentralen Server registriert ist zu finden, müssen Musiker die Adresse dieses Zentralservers im Einstellungsfeld „Benutzerdefinierte Zentralserveradresse“ ihres Clients eingeben. Sie sehen dann eine Liste der an diesem zentralen Server registrierten Server.

Jeder Server kann sich an deinem zentralen Server registrieren, um in deiner Liste angezeigt zu werden. Dazu muss dann der anzumeldende Server mit dem Flag `--centralserver` und deiner IP/Domain gestartet werden.

Der Server, der als zentraler Server konfiguriert werden soll, muss mit `--centralserver localhost` gestartet werden (d.h. der zentrale Server, an dem sich dieser Server anmeldet ist er selbst).

Wenn du steuern möchtest, welche Server sich an deinem zentralen Server registrieren können, kannst du eine Whitelist mit der Option `--listfilter` aktivieren. Weitere Informationen zu dieser Funktion findest du auf der Seite [Kommandozeilen-Optionen](Command-Line-Options).

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Du einstellen kannst.
