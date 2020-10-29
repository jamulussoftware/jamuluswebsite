---
layout: wiki
title: "Auswählen eines Servertyps"
lang: "de"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Servertypen

Sie können Ihren Server in einem von drei "Modi" betreiben (entweder zu Hause oder auf einem 3rd-Party-Host):

### 1. Öffentlich
Ihr Server wird in der Liste [Zentralserver](Central-Servers) aufgeführt, die Clients standardmäßig verwenden. Die Musiker können dann Ihren Server entdecken und sich mit ihm verbinden.  Es ist nicht notwendig, als öffentlicher Server zu laufen, da viele andere Personen ihn bereits betreiben. Verbinden Sie sich einfach mit einem Server mit geringer Latenz und beginnen Sie mit dem Jamming.

![PublicServer](https://user-images.githubusercontent.com/4561747/79310856-7e0b2100-7ef4-11ea-9511-b2e3339cab6f.png)

Dieser Modus wird aktiviert, indem Sie das Kontrollkästchen "Meinen Server registrieren..." markieren und (optional) Ihre Serverinformationen eingeben.

Beim Betrieb ohne die Oberfläche ("headless") würde das Folgende einen öffentlichen Server konfigurieren:

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Anmerkung**: Es ist **nicht** notwendig eine Portweiterleitung an Ihrem Router einzurichten um einen öffentlichen Server zu betreiben.

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Sie einstellen können.


### 2. Privat
Dieser Servertyp wird nicht in einer zentralen Serverliste aufgeführt. Sie müssen den Musikern Ihre Serveradresse angeben, mit der sie ihre Clients verbinden können. Unter [Ausführen eines privaten Servers](Running-a-Private-Server) finden Sie Informationen darüber, was zu tun ist, damit andere sich mit ihm verbinden können.

![PrivateServer](https://user-images.githubusercontent.com/4561747/79310944-9f6c0d00-7ef4-11ea-9d8a-ecb0e668c22d.png)

Dieser Modus wird aktiviert, indem Sie die Markierung von "Meinen Server registrieren..." entfernen.

Beim Betrieb ohne die Oberfläche ("headless") würde das Folgende einen privaten Server konfigurieren:

```shell
Jamulus --nogui --server
```

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Sie einstellen können.

### 3. Zentral
Die Konfiguration Ihres Servers als Zentralserver muss nur unter besonderen Umständen (z.B. für Online-Veranstaltungen oder Musikvereine) vorgenommen werden. Die meisten Leute können diesen Typ ignorieren.

Um Server anzuzeigen, die von einem benutzerdefinierten zentralen Server aufgelistet werden, müssen Musiker die Adresse in das Einstellungsfeld "Benutzerdefinierter zentraler Server" ihres Clients eingeben.  Sie sehen dann eine Verbindungsaufbau-Liste, die von diesem zentralen Server generiert wird.

Normale Server-Betreiber können sich auch bei Ihrem eigenen zentralen Server registrieren lassen, so dass ihre Server in Ihrer Server-Liste auftauchen können, indem sie Ihren als ihre `--centralserver`-Option einstellen.

Um einen Server als zentralen Server zu betreiben, sollte er mit `--centralserver localhost` konfiguriert werden (d.h. sich selbst als den zentralen Server für Abfragen angeben).

Wenn Sie steuern möchten, welche Server sich bei Ihrem zentralen Server registrieren können, können Sie eine Whitelist mit der Befehlszeilenoption `--listfilter` aktivieren. Weitere Informationen zu dieser Funktion finden Sie auf der Seite [Kommandozeilen-Optionen](Command-Line-Options).

Siehe auch [Befehlszeilenoptionen](Command-Line-Options) für weitere Parameter, die Sie einstellen können.
