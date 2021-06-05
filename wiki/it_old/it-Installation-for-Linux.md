---
layout: wiki
title: "Installazione su Linux"
lang: "it"
permalink: "/wiki/Installation-for-Linux"
---


# Installazione su Linux

Assicurati di aver letto la pagina [Primi Passi](Getting-Started).

**Al momento, non esiste un pacchetto ufficiale per Jamulus**

C'è una lista di pacchetti non ufficiali [per diverse distribuzioni su questa pagina](https://github.com/corrados/jamulus/issues/223#issue-619038918){: target="_blank" rel="noopener noreferrer"}. Si può usare in alternativa [uno script "all-in-one"](Linux-Client-Install-Script).

Altrimenti, niente paura, compilare i sorgenti non è impossibile:

## Scaricare i sorgenti di Jamulus

1. Aprire il terminale (su Ubuntu o altre distro si può digitare - `CTRL+ALT+t`)
1. Scaricare e scompattare l'ultima versione digitando i seguenti comandi:
```shell
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
```


## Installare le dipendenze

Per prima cosa aggiornare la lista dei pacchetti (es. sulle distro basate su Debbian `sudo apt-get update`).

Su **Distro basate su Ubuntu 18.04+**, o **Debian 9 oppure 10** digitare:

```shell
sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Su **Debian** 11 (bullseye) o successive, e su Raspberry Pi Raspbian Buster release o successive, digitare:

```shell
sudo apt-get install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
```

Su **Fedora** digitare:

```shell
sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel
```

### Qjackctl: Un tool non indispensabile ma utile

[QjackCtl](https://qjackctl.sourceforge.io) è un tool grafico per la gestione dei settaggi del server audio Jack (non fà parte della lista delle dipendenze). Si installa con il comando:

```shell
sudo apt-get install qjackctl
```

Sarebbe opportuno usare un [kernel a bassa latenza]( https://help.ubuntu.com/community/UbuntuStudio/RealTimeKernel) (es. per Ubuntu 18.04: `sudo apt-get install linux-lowlatency-hwe-18.04`).

## Compilare Jamulus

Entriamo nella cartella Jamulu appena scaricata e scompattata:

```shell
cd jamulus-latest
```
Compiliamo il codice con i seguenti comandi(il comando `make` avrà bisogno di qualche minuto per essere completato):

```shell
qmake Jamulus.pro
make clean
make
sudo make install
```


## Configuriamo la scheda audio

### Configurare Jack tramite QJackCtl

Il client Jamulus per funzionare ha bisogno che [Jack](https://jackaudio.org/){: target="_blank" rel="noopener noreferrer"} sia attivo, ma è necessario configurarlo. E' fortemente raccomandato usare `QjackCtl` per le configurazioni.
1. Aprire il Terminale (Shell) per es. con Crtl-Alt-T ed
1. Eseguire il comando `qjackctl`, si aprirà una finestra nominata: **Jack Audio Connection Kit**
2. E' possibile configurare l'Hardware audio secondo le indicazioni riportate sotto (è possibile testare settaggi differenti secondo le prestazioni della strumentazione a disposizione):

- Selezionare l' **Interfaccia** da usare (selezionare dall'elenco tra le schede audio disponibili)
- Settare il **Sample Rate a 48000**
- Settare i **Frames/Period to 128** e la voce Periods/Buffer a 2 per cominciare.

Riavviare Jack per rendere effettive le modifiche apportate.

### Avviare Jamulus

1. Aprire il Terminale (Shell) per es. con Crtl-Alt-T ed
1. Eseguire il comando `Jamulus` (con la 'J' Maiuscola) per avviare il client

Jamulus verrà installato su `/usr/local/bin`. Adesso puoi rimuovere la cartella contenete i sorgenti.

Se si riscontrano problemi nell'ascolto (in particolare "XRUN errors" riportati nel log di Jack/QJackCtl) provare con valori più alti (es. 256 "frames" o 3 "periods") rispetto a qualli riportati al punto 3. Valori più bassi (es. 64 frames) migliorano le performance ma aumentano le probabilità di avere un ascolto pessimo. Altrimenti consultare [la pagina di Risoluzione Dei Prblemi](Client-Troubleshooting).

## Installato?
Consulta la pagina di [Configurazione Hardware](Hardware-Setup).
Per informazioni dettagliate su come usare Jamulus, consultare la pagina [del manuale utente](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).


## Per aggiornare il software quando esce una nuova Release

Scaricare i sorgenti tramite il comandi per [ottenere Jamulus](Installation-for-Linux#get-jamulus-sources) e ripetere le [istruzioni per compilare il software](Installation-for-Linux#compile-this-bad-boy) come se fosse una nuova installazione.

## Notes for geeks

* Il "make clean" è essenziale per rimuovere i file Qt generati automaticamente che sono presenti nel file .tar.gz e potrebbero non corrispondere alla versione Qt che stai utilizzando.

* Per usare una libreria OPUS condivisa esterna invece dell'integrata usa qmake `" CONFIG + = opus_shared_lib "Jamulus.pro`.

* Usare `qmake" CONFIG + = noupcasename "Jamulus.pro` affinché il nome di destinazione dell'output di questo software sia ** j ** amulus invece di ** J ** amulus.

* Per gli untenti di Raspberry Pi: potrebbe essere necessario compilare l client su un altra macchina ed eseguirlo sul Raspberry Pi. In tal caso, le uniche librarie di cui hai bisogno sono quelle necessarie per un [server headless](Server-Linux#running-a-headless-server), ma con in più i pacchetti per Jack.

* A partire dalla versione 3.5.3, Jamulus non è più compatibile con Qt4.
