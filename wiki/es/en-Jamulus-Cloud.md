---
layout: wiki
title: "Jamulus en la Nube"
lang: "es"
permalink: "/wiki/Jamulus-Cloud"
---

# Jamulus en la Nube

El usuario de Jamulus [skrul](https://sourceforge.net/u/skrulx/profile/) ha proporcionado unas AMI públicas en EC2 de Ubuntu 18.04 ejecutando Jamulus.


Lanza una instancia desde la AMI en la región que quieres (puedes utilizar m3.small) y asegúrate de añadir la regla "All UDP / Anywhere" al grupo de seguridad antes de lanzarla.


**Nota a fecha de abril 2020**: Estas instancias vienen con v3.5.0. Antes de ejecutar tu servidor, se recomienda encarecidamente que [compruebes la última versión](https://github.com/corrados/jamulus/releases) y te actualices a esa.

### AMIs Disponibles

| Región | AMI |   |
|---|---|---|
| us-west-1 | AMI | https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
| us-west-1 | AMI | https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
| us-west-1 | AMI | https://console.aws.amazon.com/ec2/home?region=us-west-1#launchAmi=ami-09d918ccde05958cb |
