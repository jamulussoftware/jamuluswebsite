- `-d` oder `--discononquit`   Trennt alle Clients beim Beenden. Wenn ein Server gestoppt oder neu gestartet wird, werden normalerweise alle Clients, die ihre „Trennen“-Schaltflächen nicht benutzt haben, die Verbindung wiederherstellen, wenn der Server wieder hochfährt. Mit dieser Option werden die Clients gezwungen, ihre Verbindungen zum Server manuell wiederherzustellen.  
- `-e`  oder `--directoryserver`  Registriert den Server in einem Verzeichnis (z.B. um sein Genre zu setzen (siehe auch `-o`)). Siehe [Server-Typen](/wiki/Running-a-Server#server-typen) für weitere Informationen.
- `--directoryfile` Registrierte Server speichern, auch wenn das Verzeichnis neu gestartet wird. Nur für Verzeichnis-Server. Siehe [diese Anleitung](Custom-Directories) für weitere Informationen. 
- `-f` oder `--listfilter`     Erlaubte (Whitelist) Server, die in der Serverliste registriert sind, Format `ip address 1[;ip address 2]` Nur Verzeichnisse
-  `-F` oder `--fastupdate`     Verringert die Latenz, wenn Clients mit der Option „Aktiviere kleine Netzwerkpuffer“ verbunden sind. Erfordert eine schnelle CPU, um Aussetzer zu vermeiden, und mehr Bandbreite für aktivierte Clients.
-  `-l`  oder `--log`            Protokollierung einschalten, Pfad und Dateiname festlegen                                                                    
   
- `-L`  oder --licence`        Zeigt ein Zustimmungsfenster an, bevor Benutzer eine Verbindung herstellen können
- `-m`  oder `--htmlstatus`     HTML-Statusdatei aktivieren, Pfad und Dateiname festlegen
- `-o`  oder `--serverinfo`     Ortsangaben im Format:  `[Name];[Stadt];[Gebietsschema-Wert]` (siehe [Werte](https://doc.qt.io/qt-5/qlocale.html#Country-enum)) Nur registrierte Server
- `-P`  oder `--delaypan`       Start mit aktiviertem Delay-Panning Siehe [Notizen](/wiki/Running-a-Server#verzögertes-panning)
- `-R`  oder `--recording`      Gib einen beschreibbaren Pfad ein, in dem die Dateien gespeichert werden sollen (in Anführungszeichen, falls erforderlich). Siehe [Optionen](#optionen).  
- `--norecord`       Aufnahme deaktivieren. Durch Angabe von `-R` wird die Aufnahme standardmäßig aktiviert                                                 
  
- `-s` oder `--server` Start in Server Modus
- `--serverbindip`  Spezifiziert die IP Adresse auf die der Server hört              
  
-  `-T` oder `--multithreading`  Multithreading verwenden, um Mehrkern-CPUs besser zu nutzen und mehr Clients zu unterstützen
-  `-u` oder `--numchannels`  Maximale Anzahl von Clients (Kanälen) 
-  `-w` oder `--welcomemessage`  Willkommens Nachricht für neue Teilnehmer nach Aufbau der Verbindung. Kann als Zeichenkette oder Dateiname angegeben werden und kann HTML enthalten.
-  `-z` oder `--startminimized`  Start minimiert
-  `--serverpublicip`  Die öffentliche IP-Adresse des Servers, wenn eine Verbindung zu einem Verzeichnis hinter demselben NAT besteht. Siehe [Informationen zum Verzeichnisse](Custom-Directories#wissenswertes-über-verzeichnisse)
