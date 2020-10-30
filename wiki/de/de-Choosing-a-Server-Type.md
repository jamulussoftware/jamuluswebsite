---
layout: wiki
title: "Auswählen eines Servertyps"
lang: "de"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Servertypen

Du kannst einen Server in einem von drei "Modi" betreiben (entweder bei dir zu Hause oder auf einem 3rd-Party-Host):

### 1. Öffentlich
Ihr Server wird in der Liste [Zentralserver](Central-Servers) aufgeführt, die Clients standardmäßig verwenden. Die Musiker können dann Ihren Server entdecken und sich mit ihm verbinden.  Es ist nicht notwendig, als öffentlicher Server zu laufen, da viele andere Personen ihn bereits betreiben. Verbinde dich einfach mit einem Server mit geringer Latenz und beginne zu jammen.

![PublicServer](https://user-images.githubusercontent.com/4561747/79310856-7e0b2100-7ef4-11ea-9511-b2e3339cab6f.png)

Dieser Modus wird aktiviert, indem du das Kontrollkästchen "Meinen Server registrieren..." markierst und (optional) deine Serverinformationen eingibst.

Beim Betrieb ohne die Oberfläche ("headless") würde das Folgende einen öffentlichen Server konfigurieren:

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Anmerkung**: Es ist **nicht** notwendig eine Portweiterleitung an Ihrem Router einzurichten um einen öffentlichen Server zu betreiben.

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Du einstellen kannst.


### 2. Privat
Dieser Servertyp wird nicht in einer zentralen Serverliste aufgeführt. Du musst den Musikern Deine Serveradresse geben, mit der sie ihre Clients verbinden können. Unter [Ausführen eines privaten Servers](Running-a-Private-Server) findest Du Informationen darüber, was zu tun ist, damit andere sich mit ihm verbinden können.

![PrivateServer](https://user-images.githubusercontent.com/4561747/79310944-9f6c0d00-7ef4-11ea-9d8a-ecb0e668c22d.png)

Dieser Modus wird aktiviert, indem Du die Markierung von "Meinen Server registrieren..." entfernst.

Beim Betrieb ohne die Oberfläche ("headless") würde folgendes einen privaten Server konfigurieren:

```shell
Jamulus --nogui --server
```

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Du einstellen kannst.

### 3. Zentral
Die Konfiguration Ihres Servers als Zentralserver muss nur unter besonderen Umständen (z.B. für Online-Veranstaltungen oder Musikvereine) vorgenommen werden. Die meisten Leute können diesen Typ ignorieren.

Um Server anzuzeigen, die von einem benutzerdefinierten zentralen Server aufgelistet werden, müssen Musiker die Adresse in das Einstellungsfeld "Benutzerdefinierter zentraler Server" ihres Clients eingeben. Sie sehen dann eine Verbindungsaufbau-Liste, die von diesem zentralen Server generiert wird.

Normale Server-Betreiber können sich auch bei Ihrem eigenen zentralen Server registrieren lassen, so dass ihre Server in Ihrer Server-Liste auftauchen können, indem sie Ihren als ihre `--centralserver`-Option einstellen.

Um einen Server als zentralen Server zu betreiben, sollte er mit `--centralserver localhost` konfiguriert werden (d.h. sich selbst als den zentralen Server für Abfragen angeben).

Wenn Du steuern möchtest, welche Server sich bei deinem zentralen Server registrieren können, kannst Du eine Whitelist mit der Befehlszeilenoption `--listfilter` aktivieren. Weitere Informationen zu dieser Funktion findest Du auf der Seite [Kommandozeilen-Optionen](Command-Line-Options).

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Du einstellen kannst.
