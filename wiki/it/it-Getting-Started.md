---
layout: wiki
title: "Primi Passi"
lang: "it"
permalink: "/wiki/Getting-Started"
---

# Primi Passi su Jamulus

## Avrai bisogno di

1. **Un computer** con installato **Windows 10**, **macOS** (**MacOS X** El Capitan v10.11 o versioni successive), oppure **Linux**.
1. **Una connessione cablata ad internet** (non usare il Wi-Fi, rende problematico l'uso del software creando problemi di ascolto). Una connessione in fibra offre le caratteristiche ideali per l'utilizzo[^1].
1. **Usare le cuffie - non le casse** per prevenire effetti di echo o larsen e minimizzare il delay[^2].

## Massimizza la qualità, minimizza i ritardi

### 1. Limitare il traffico internet e chiudere tutti i programmi

Accertati che nessun programma possa andare in conflitto sulla rete con Jamulus (come programmi di video conferenza o streaming video) mentre partecipi ad una sessione.

### 2. Usa una scheda audio esterna e non quella integrata nel PC

Raccomandiamo - anche se per cominciare ne puoi fare a meno - di usare una scheda audio esterna (dove potrai collegare il tuo Microno e/o il tuo strumento e connetterli al PC via USB) per avere maggiore qualità audio e bassa latenza durante una sessione su Jamulus. E' possibile usare un microfono USB. Poi consultare la pagina sull'[hardware consigliato](#recommended-hardware).

### 3. Connettersi a server con latenza bassa

E' consigliabile scegliere server dalla lista che riportano ping inferiori o uguali a 15ms per un ottima esperienza di utilizzo (anche se ci sono altre cose che possono influenzare le prestazioni). Collegarsi a server con ping più alti potrebbe compromettere il corretto funzionamento del software.

Ora che hai acquisito le nozioni di base, possiamo cominciare:

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Installazione su Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Installazione su macOS</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Per utenti Linux</a>
</div>

Altrimenti - [Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/) Puoi usare Jamulus su qualsiasi computer tramite una penna USB (solo per sistemi a 64-bit). Verifica il tuo hardware e comincia questa nuova esperienza!

## Configurazione Hardware

Visita [la lista delle interfacce testate](Sound-Devices) e la pagina di [configurazione dell'Hardware](Hardware-Setup).

## Altre guide
* [Eccellente Guida](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/){: target="_blank" rel="noopener noreferrer"} by [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a){: target="_blank" rel="noopener noreferrer"} (_Facebook_) che vale la pena di leggere.

## Problemi? Non riesci ad andare a tempo?

**ASCOLTA SOLO IL SEGNALE CHE PROVIENE DAL SERVER!**

In altre parole **evita** di ascoltare il segnale diretto del tuo strumento/microfono.

Risulta sicuramente complicato per cantanti o musicisti di strumenti acustici ma, anche se la connessione è buona, quando non si ascolta il **segnale che proviene dal server**, la scincronizzazione con gli altri ne risentirà. _(A scanso di equivoci: questo non ha nulla a che fare con i controlli “mute” in Jamulus.)_

Further information about how to avoid listening to yourself (and help with other problems) can be found in the [Troubleshooting FAQ section](Client-Troubleshooting) (_currently under construction_)

## Come funziona Jamulus (in generale)

**Ecco come milioni di persone utilizzano Jamulus per suonare, cantare e insegnare musica in tempo reale, in tutto il mondo:**

![Overview](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus funziona secondo il principio del client-server. L’audio di tutti viene inviato a un server, mixato ed elaborato. Successivamente l’audio viene inviato a ogni client. Se un server viene reso pubblico e registrato su un server centrale, le sue informazioni verranno trasmesse a tutti i client._

## Note a pié di pagina
[^1]: [Dettagli di connessione](Network-Requirements){: target="_blank" rel="noopener noreferrer"}. Una connessione con 10Mbits in down e 1Mbps in up non è sufficiente, è probabile riscontrare problemi relativi alla connettività.
[^2]: Cuffie-Bluetooth  di solito inseriscono latenza. Per questo è consigliabile usare cuffie con filo. In particolare per cantanti e musicisti di strumenti acustici (leggere [il paragrafo relativo](Getting-Started#having-trouble-cant-keep-in-time) per maggiori informazioni).
