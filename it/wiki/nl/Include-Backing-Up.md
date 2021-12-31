<!-- OPMERKING: Dit moet werken voor de client en de server en alle besturingssystemen -->

Eenmaal geïnstalleerd en actief, dan wil je misschien een kopie van de instellingen bewaren. Het hebben van een back-up is altijd een goed idee en de bestanden waarin de instellingen zijn opgeslagen zijn niet compatibel met vorige versies van Jamulus. Dus als je terug wilt naar de vorige versie, dan moet je de instellingen herstellen die je had.

Om het instellingenbestand op Windows te vinden kijk je in de map `%APPDATA%`. Er zullen een of meer `.ini`-bestanden in een map staan met de naam `Jamulus`.

Voor alle andere platformen voer je het volgende uit vanaf de opdrachtregel om te zien waar ze zich bevinden:

`find ~ -name Jamulus.ini -ls`

**Aandachtspunten**

* Maak geen back-up of herstel geen instellingenbestanden wanneer Jamulus actief is.
* Het wordt niet aanbevolen om instellingenbestanden met de hand te bewerken (daar zijn ze niet voor ontworpen).
* Je kunt alle instellingen terugzetten naar hun standaardwaarden door gewoon het instellingenbestand te verwijderen (na het sluiten van Jamulus).
