
[comment]: # (Dit bestand is opgenomen in meerdere documenten)

# Quality of Service (QoS)

Jamulus gebruikt DSCP/CS4 opportunistisch om bufferophoping aan te pakken en gebruikt een standaard DSCP/CS4-waarde van 128 (of 0x80). Dit is compatibel met IPv4 en IPv6. Andere waarden kunnen worden ingesteld met de optie -Q, bijv. -Q [0..255] (waarbij 0 QoS uitschakelt). Zie RFC4594 als je het effect van niet-standaardinstellingen wilt onderzoeken. De meeste mensen zullen dit echter niet nodig hebben.

## Gebruik van QoS in Windows

De QoS-instellingen van Jamulus (inclusief de standaard) hebben geen effect op Windows omdat het besturingssysteem ze negeert. Om het in te schakelen, moet je deze instructies volgen. Houd er ook rekening mee dat je deze procedure mogelijk iedere keer moet herhalen wanneer Jamulus wordt bijgewerkt.

Typ in het zoekvak naast het menu Start: gpedit.msc (enter)<br> In het nieuwe venster, (klik) op het menu icoon om het Actievenster weer te geven<br>Gebruik nu het linker paneel in de editor voor lokaal groepsbeleid<br> &nbsp;Beleid voor Lokale computer<br> &nbsp;&nbsp;Computerconfiguratie<br> &nbsp;&nbsp;&nbsp;Windows-instellingen<br> &nbsp;&nbsp;&nbsp;Op beleid gebaseerde QoS (klik)<br>Gebruik het derde (Acties) paneel in de editor voor lokaal groepsbeleid<br> &nbsp;Op beleidgebasseerde QoS<br> &nbsp; &nbsp;Meer acties<br> &nbsp; &nbsp; &nbsp;Nieuwe beleidsinstelling maken (klik)<br> &nbsp; &nbsp; &nbsp; &nbsp;Beleidsnaam: Jamulus<br> &nbsp; &nbsp; &nbsp; &nbsp;DSCP-waarde opgeven: 32<br> &nbsp; &nbsp; &nbsp; &nbsp;Volgende<br> &nbsp; &nbsp; &nbsp; &nbsp;Alleen toepassingen met deze naam (uitvoerbaar): Jamulus.exe<br> &nbsp; &nbsp; &nbsp; &nbsp;Volgende<br> &nbsp; &nbsp; &nbsp; &nbsp;Volgende<br> &nbsp; &nbsp; &nbsp; &nbsp;UDP<br> &nbsp; &nbsp; &nbsp; &nbsp;Voltooien<br>

(Let op het Jamulus-beleid kan in het middenpaneel kan worden bewerkt)

