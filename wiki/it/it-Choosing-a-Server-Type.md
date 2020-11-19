---
layout: wiki
title: "Scegliere come avviare il Server"
lang: "it"
permalink: "/wiki/Choosing-a-Server-Type"
---

# Tipi di Server

Puoi eseguire il tuo server in una delle tre "modalità" (a casa o su un host di terze parti):

### 1. Pubblico

Il tuo server sarà registrato su di un [server centralizzato](Central-Servers) e visibile in una lista di default. I Musicisti vedranno, e quindi potrranno connettersi, al tuo server.  Non è necessario creare un server pubblico per suonare ne esistono già tanti. Per divertirsi, cerca un server della lista con latenza bassa e suona.

![PublicServer](https://user-images.githubusercontent.com/4561747/79310856-7e0b2100-7ef4-11ea-9511-b2e3339cab6f.png)

Questa modalità viene attivata quando la voce "Rendi il server Pubblico" è selezionata, puoi inserire informazioni aggiuntive al tuo server compilando i campi correlati.

Quando avvii il server senza interfaccia ("headless"), bisogna configurare il server come segue per renderlo pubblico:

~~~
Jamulus --nogui --server \
        --centralserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Nota**: **Non è** necessario configurare il "port-forwarding" o altri parametri del router per rendere visibile un server pubblico.

Consultare la pagina [opzioni da linea di comando](Command-Line-Options) per vedere quali parametri è possibile usare per i settaggi.


### 2. Privato

Questi server non vengono registrati nelle liste di server centrali. Dovrai comunicare ai musicisti l'indirizzo del tuo server. Leggi [Avviare un server privato](Running-a-Private-Server) per sapere cosa è necessario fare per consentire agli altri di connettersi ad esso.

![PrivateServer](https://user-images.githubusercontent.com/4561747/79310944-9f6c0d00-7ef4-11ea-9d8a-ecb0e668c22d.png)

Questa modalità viene attivata quando la voce "Rendi il server Pubblico" non è selezionata.

Quando avvii il server senza interfaccia ("headless"), bisogna configurare il server come segue per renderlo privato:

```shell
Jamulus --nogui --server
```

Consultare la pagina [opzioni da linea di comando](Command-Line-Options) per vedere quali parametri è possibile usare per i settaggi.


### 3. Centrale

La configurazione del server come server centrale deve essere eseguita solo in circostanze speciali (es. eventi online o associazioni musicali). La maggior parte delle persone può ignorare questa modalità.

Per visualizzare i server elencati da un server centrale personalizzato, i musicisti devono inserire l'indirizzo nell'apposito campo delle impostazioni "Server centrale alternativo" del client. I musicist vedranno quindi un elenco generato da quel server centrale.

Chi gestisce i server può registrarsi al tuo server centrale per essere visibile nell'elenco tramite l'opzione `--centralserver`.

Per eseguire un server come server centrale, è necessario configurarlo con il comando `--centralserver localhost` (ovvero, si imposta come server centrale da interrogare).

Se desideri controllare quali server possono registrarsi con il tuo server centrale, puoi abilitare una whitelist con l'estensione `--listfilter`. Leggere la pagina [opzioni da linea di comando](Command-Line-Options) per maggiori informazioni su questa funzione.

Consultare la pagina [opzioni da linea di comando](Command-Line-Options) per vedere quali parametri è possibile usare per i settaggi.
