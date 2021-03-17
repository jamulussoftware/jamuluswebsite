---
layout: wiki
title: "Installazione per Windows"
lang: "it"
permalink: "/wiki/Installation-for-Windows"
---

# Installazione per Windows

Assicurati di aver letto la pagina [Primi Passi](Getting-Started).

1. **Scarica e installa i driver ASIO**. Si raccomanda di usare una scheda audio con driver ASIO proprietario. In alternativa [installare i driver (ASIO4All)](http://www.asio4all.org){: target="_blank" rel="noopener noreferrer"} prima di installare Jamulus.
1. **Scarica e installa Jamulus** dal sito [Jamulus](https://github.com/jamulussoftware/jamulus/releases/latest){: target="_blank" rel="noopener noreferrer"}. Se ricevi un avviso, fai clic su "Ulteriori informazioni" e "Esegui comunque" per installare Jamulus.
1. **Configura la tua scheda audio**. Dopo l'installazione passa a configurare il tuo hardware. Dai un'occhiata a come configurare i driver ASIO4All (scorri verso il basso), e poi su [Configurazione Hardware](Hardware-Setup).

In alternativa puoi [compilare l'applicativo](Compiling) avendo le conoscenze necessarie.

## Configura i driver ASIO4All
*Non è consigliabile usare gli ASIO4All se la tua scheda ha dei driver proprietari.*

Prima di ogni cosa **chiudi tutte le applicazioni** (in particolare quelle che hanno accesso alla scheda audio come il browser) per evitare conflitti. Se non si sente nulla assicurarsi di aver impostato correttamente gli **inputs/outputs** nel pannello di controllo e verificare che lo **switch sia su on**.
Sicuramente si dovrà effettuare qualche tentativo prima di trovare una corretta impostazione poiché essa è diversa per ogni computer. Per le prove puoi collegarti ad un server ed ascoltare la qualità audio del tuo strumento o della voce e verificare che tutto sia funzionante secondo le proprie esigenze.

### Configurare gli Input sui driver ASIO4All (Guida)

1. Aprire le impostazioni di Jamulus
1. Cliccare su _"Settaggi ASIO"_
1. Abilitare _advanced view_ su ASIO4All (cliccare sull'icona in basso a destra)
1. Abilitare l'input della scheda audio cliccando sull' _icona più_ vicino al nome della scheda audio.
1. Ora abilitare/disabilitare gli inputs/outputs corretti.

La maggior parte delle schede audio integrate nei PC sono chiamate: Realtek High Definition Audio, Conexant o qualcosa di simile.
Le cuffie e gli altoparlanti sono inseriti nella lista degli output e i microfoni nella lista degli input.

### Difficolta con i settaggi dei driver ASIO4All?

Di solito la configurazione di base è sufficiente per funzionare ma spesso si possono avere problemi con i settaggi.

Se non si sente nulla per prima cosa bisogna **riavviare Jamulus e/o il PC**.

In seguito, se il problema persiste, **settare nuovamente i dispositivi di input/output**. A sinistra dei dispositivi di ingesso-uscita è presente un icona di "acceso (se illuminato) - spento" e un'icona di riproduzione. Se è presente una croce rossa o un simbolo giallo, potrebbe essere necessario chiudere altri applicazioni come il browser, Zoom, ecc...

Puoi vedere [questo video](https://youtu.be/_GzOsitVgLI){: target="_blank" rel="noopener noreferrer"} realizzato da @trombonepizza che raccoglie informazioni dettagliate sui dirver ASIO4All.

La documentazione ufficiale e dettagliata sui driver ASIO4All è disponibile [sulla FAQ del sito ufficile](http://www.asio4all.org/faq.html){: target="_blank" rel="noopener noreferrer"} e nel manuale dei driver ASIO4All. Il manuale si trova nella cartella di installazione dei driver (solitamente `C:\Program Files (x86)\ASIO4ALL v2\`).

## Tutto Installato?
Ora puoi usare Jamulus. Se non hai ancora settato la tua scheda audio puoi visitare [Configurazione Hardware](Hardware-Setup).

Per informazioni più dettagliate su come usare Jamulus puoi visitare la [pagina del manuale ufficiale](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md).
