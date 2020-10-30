---
layout: wiki
title: "Jamulus in der Cloud"
lang: "de"
permalink: "/wiki/Jamulus-Cloud"
---

# Jamulus in der Cloud

Der Jamulus-Benutzer [skrul](https://sourceforge.net/u/skrulx/profile/) hat einige öffentliche EC2 AMIs mit Ubuntu 18.04 als Basis mit Jamulus eingerichtet. 

Starte eine Instanz von der AMI in deiner gewünschten Region (man kann m3.small verwenden) und stelle sicher, dass vor dem Start die Regel "All UDP / Anywhere" zur Sicherheitsgruppe hinzugefügt ist.

**Anmerkung vom April 2020**: Diese Instanzen werden mit Jamulus v3.5.0 ausgeliefert. Bevor Du Server laufen lässt wird dringend empfohlen auf [die aktuellste Version](https://github.com/corrados/jamulus/releases) zu aktualisieren.

### verfügbare AMIs

| Region  | AMI  |   |
|---|---|---|
| us-west-1  |  ami-09d918ccde05958cb |  https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
| us-west-1  |  ami-09d918ccde05958cb |  https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
| us-west-1  |  ami-09d918ccde05958cb |  https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
