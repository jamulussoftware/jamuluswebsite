<!-- OBS: Detta måste gälla både klient och server, samt alla operativsystem -->

När du har installerat och kört programmet kan du vilja behålla en kopia av
dina inställningar. Att ha en säkerhetskopia är alltid en bra idé, och
inställningsfiler är inte bakåtkompatibla mellan versioner av Jamulus. Så om
du vill återgå till den tidigare versionen, kommer du att behöva återställa
de inställningar du hade.

För att hitta din inställningsfil på Windows, skriv `%APPDATA%` i sökfältet
och leta efter en mapp som heter `Jamulus`. Det kommer att finnas en eller
flera `.ini`-filer i denna mapp. Säkerhetskopiera nu Jamulus' inställningar.

För alla andra plattformar, kör följande från kommandoraden för att hitta
var filerna finns och kopiera dem till en annan plats:

`find ~ -name Jamulus.ini -ls`

Om du använde parametern `--inifile` för att spara en ini-fil på en annan
plats, glöm inte att också säkerhetskopiera dessa filer. **Viktiga punkter
att notera**

* Säkerhetskopiera eller återställ inte inställningsfiler när Jamulus är
  igång.
* Det rekommenderas inte att manuellt redigera inställningsfiler (de är inte
  avsedda för det).
* Du kan återställa alla inställningar till standardvärdena genom att bara
  ta bort inställningsfilen (efter att ha stängt Jamulus).
