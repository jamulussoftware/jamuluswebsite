---
layout: wiki
title: "Instalación en Linux"
lang: "es"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Utilización de Jamulus" branch1="Cómo Empezar" branch1-url="Getting-Started" %}

# Instalación en Linux
Asegúrate de leer la página de [Cómo Empezar](Getting-Started).

### Debian y Ubuntu

1. Descarga el [archivo .deb más reciente]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Update apt: `sudo apt-get update`
1. Instala el paquete desde donde lo descargaste: `sudo apt install {{ site.download_file_names.deb-gui }}`.
1. Puesto que Jamulus requiere el servidor JACK, también lo tienes que instalar. Recomendamos `QjackCtl` para configurar JACK. Lo puedes instalar con `sudo apt-get install qjackctl`

Ten en cuenta que si necesitas actualizar Jamulus a una nueva versión, simplemente descarga el archivo .deb nuevo y reinstalar como arriba.

Para los instaladores de otras distribuciones, ver [Repology](https://repology.org/project/jamulus/versions). Quizá también quieras utilizar alguno de los [scripts de instalación](https://github.com/jamulussoftware/installscripts) contribuidos.


## Configura tu hardware

### Configura JACK con QjackCtl
Los clientes de Jamulus necesitan [JACK](https://jackaudio.org/) para funcionar, pero hay que configurarlo primero. El método recomendado es utilizar `QjackCtl`.
1. Abre la terminal, por ej. con Crtl-Alt-T, y
1. Ejecuta el comando `qjackctl`. Verás la ventana principal de **Qt JACK Control**
2. Configura tu hardware de audio como sigue (la configuración exacta de JACK dependerá de lo que es capaz tu hardware de audio):

- Elige el **Interfaz** que quieres utilizar (puede haber varios en la lista)
- Establece la **Frecuencia de Muestreo en 48000**
- Establece los **Cuadros/Periodo en 128** y Periodos/Buffer en 2 para empezar

Reinicia JACK para que surta efecto la nueva configuración

### Arranca Jamulus

Con JACK abierto y configurado, arranca Jamulus desde el lanzador del escritorio (o desde la línea de comandos ejecuta `jamulus`).

Si tienes problemas con cortes de sonido (en particular errores de XRUN mostrados por Jack/QJackctl) prueba con valores más altos (por ej. 256 cuadros o 3 periodos). Valores más bajos (por ej. 64 cuadros) pueden ofrecer un mejor rendimiento pero también quizá más problemas con el audio. Ver la [página de resolución de problemas](Client-Troubleshooting).

## ¿Todo instalado?

Echa un vistazo a la

[página de configuración de Jamulus](Setup){: .button}
