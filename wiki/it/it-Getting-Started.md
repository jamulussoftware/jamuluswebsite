---
layout: wiki
title: "Primi Passi"
lang: "it"
permalink: "/wiki/Getting-Started"
---
# Primi Passi
## Avrai bisogno di

1. Un PC con **Windows 10**, oppure con **MacOS X El Capitan (v10.11) o versione superiore**, o **Linux**. Requisiti mini sono una CPU da 1,5GHZ.
1. **Una connessione Ethernet via cavo e non WI-FI**(su connessione WI-FI si posso verificare difficolta di utilizzo e problemi di ascolto). Molte delle attuali linee sono sufficienti per garantire il buon funzionamento dell'applicazione([clicca qui per maggiori dettagli](Quality,-delay-and-network-bandwidth)). Si ricorda che una connessione con 10Mbits in down e 1Mbits in up non è sufficiente per garantire un buon funzionamento e non avere problemi di ascolto.
1. **E' consigliabile usare le cuffie e non le casse** per prevenire effetti di echo o larsen e (in particolare per cantanti o per chi suona strumenti acustici) per essere sicuri di andare a tempo con gli altri
_(aprire [questo link](Getting-Started#having-trouble-cant-keep-in-time) per comprendere le connessioni).

### Altamente Raccomandato: usare un interfaccia audio USB o Firewire!

A meno che tu non sia un cantante con un microfono (USB), per ottimizzare la latenza ti consigliamo vivamente di utilizzare un'interfaccia audio, alla quale puoi collegare i tuoi strumenti piuttosto che utilizzare la scheda audio incorporata del tuo computer. L'interfaccia si collegherà al tuo PC solitamente tramite USB. Vedere [Hardware Setup](Hardware-Setup).

### Riduci al minimo i disturbi!

Ridurre al minimo la "latenza" (ritardo del segnale) è fondamentale per suonare insieme. Durante l'utilizzo di Jamulus, cerca di assicurarti che nient'altro sulla tua macchina o sulla tua rete stia utilizzando banda. Consigliamo di non guardare YouTube / Netflix o non avere nient'altro in esecuzione sulla macchina su cui stai usando Jamulus.

#### Ping time!

Connettiti sempre ai server con i **ping più bassi** come mostrato nell'elenco dei server. Connettersi ad un server con 15 ms o meno ti darà la possibilità di divertirti (sebbene ci siano anche altri fattori che incidono sulle prestazioni). Connettersi a server con latenze più alte implica maggiore difficoltà di riuscire a suonare e quindi divertirsi.

## Pronti? Installiamo Jamulus!

<div class="fx-row fx-row-start-xs button-container">
  <a href="Installation-for-Windows" class="button fx-col-100-xs">Per Utenti Windows</a>
  <a href="Installation-for-Macintosh" class="button fx-col-100-xs">Per Utento MacOSX</a>
  <a href="Installation-for-Linux" class="button fx-col-100-xs">Per Utenti Linux</a>
</div>
[Jamulus OS!](https://sourceforge.net/projects/jamulus-os/files/JamulusOS/)

Puoi far girare Jamulus anche da chiavetta USB (solo per sistemi a 64bit). Configura l'Hardware e comincia a suonare!

## Tutto Installato?

Se devi configurare Jamulus puoi leggere [Hardware Setup](Hardware-Setup)

Per informazioni dettagliate su come usare Jamulus puoi vedere il [Manuale](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).

**Altrimenti [questa eccellente guida in inglese](https://www.facebook.com/notes/jamulus-online-musicianssingers-jamming/idiots-guide-to-jamulus-app/510044532903831/) by [Simon Tomlinson](https://www.facebook.com/simon.james.tomlinson?eid=ARBQoY3KcZAtS3pGdLJuqvQTeRSOo4gHdQZT7nNzOt1oPMGgZ4_3GERe-rOyH5PxsSHVYYXjWwcqd71a)** (_Facebook_)

## Problemi? Non riesci a tenere il tempo?

**ASCOLTA SOLO IL SEGNALE CHE PROVIENE DAL SERVER!**

In altre parole evita di ascoltare il segnale diretto del tuo strumento.

E' ovviamente difficile per cantanti e musicisti acustici ma, anche se la connessione è buona, quando i musicisti non stanno ascoltando il **segnale che proviene dal server**, la sincronizzazione con gli altri ne risentirà. _(A scanso di equivoci: questo non ha nulla a che fare con i controlli "mute" in Jamulus.)_

Ulteriori informazioni su come evitare di ascoltare se stessi (ed essere aiutati in altri problemi) possono essere trovate nella [Sezione domande Frequenti della FAQ](Client-Troubleshooting) (_attualmente in costruzione_)

## Come funziona Jamulus (in generale)

**Ecco come milioni di persone utilizzano Jamulus per suonare, cantare e insegnare musica con altre persone in tempo reale, in tutto il mondo:**

![Visita](https://user-images.githubusercontent.com/4561747/79309764-bd387280-7ef2-11ea-9d81-1e81302525e6.png)
_Jamulus funziona secondo il principio del client-server. L'audio di tutti viene inviato a un server, mixato ed elaborato. Successivamente l'audio viene inviato a ogni client. Se un server viene reso pubblico e registrato su un server centrale, le sue informazioni verranno trasmesse a tutti i client._
