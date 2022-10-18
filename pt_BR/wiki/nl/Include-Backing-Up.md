<!-- OPMERKING: Dit moet werken voor de client en de server en alle besturingssystemen -->

Eenmaal geïnstalleerd en actief, dan wil je misschien een kopie van de instellingen bewaren. Het hebben van een back-up is altijd een goed idee en de bestanden waarin de instellingen zijn opgeslagen zijn niet compatibel met vorige versies van Jamulus. Dus als je terug wilt naar de vorige versie, dan moet je de instellingen herstellen die je had.

Om je instellingenbestand op Windows te vinden, typ je `%APPDATA%` in de zoekbalk en zoek je naar een map met de naam `Jamulus`. Er zullen een of meer `.ini`-bestanden in deze map staan. Maak nu een back-up van de instellingen van Jamulus.

Voor alle andere platformen voer je het volgende uit vanaf de opdrachtregel om te zien waar ze zich bevinden en kopieer de bestanden naar een andere locatie:

`find ~ -name Jamulus.ini -ls`

Als je de parameter `--inifile` hebt gebruikt om een ini-bestand op een andere locatie op te slaan, vergeet dan niet om ook een back-up van deze bestanden te maken. **Aandachtspunten**

* Maak geen back-up of herstel geen instellingenbestanden wanneer Jamulus actief is.
* Het wordt niet aanbevolen om instellingenbestanden handmatig te bewerken (daar zijn ze niet voor ontworpen).
* Je kunt alle instellingen terugzetten naar hun standaardwaarden door gewoon het instellingenbestand te verwijderen (na het sluiten van Jamulus).
