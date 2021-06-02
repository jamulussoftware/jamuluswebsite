---
lang: es
layout: wiki
permalink: /wiki/Installation-for-Linux
title: 'Instalación en Linux'
---

{% include breadcrumb.html root="Utilización de Jamulus" branch1="Cómo Empezar" branch1-url="Getting-Started" %}

# Instalación en Linux

Asegúrate de haber leído la página de [Cómo Empezar](Getting-Started).

### Debian y Ubuntu

1. Descarga el [archivo .deb más reciente]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Actualiza apt abriendo una consola (CTRL+ALT+T debería funcionar) y escribe: `sudo apt-get update`
1. Navega hasta donde descargaste el instalador y, o bien haz doble-clic sobre él, o utiliza la línea de comandos: `sudo apt install ./{{ site.download_file_names.deb-gui }}`.
1. Una vez instalado, puedes eliminar el archivo y cerrar las ventanas de consolas.

Ten en cuenta que si necesitas actualizar Jamulus a una nueva versión, simplemente descarga el archivo .deb nuevo y reinstala como arriba.

Para los instaladores de otras distribuciones, ver [Repology](https://repology.org/project/jamulus/versions). Quizá también quieras utilizar alguno de los [scripts de instalación](https://github.com/jamulussoftware/installscripts).


## Configura tu hardware

### Configura Jack con QJackCtl

Los clientes de Jamulus necesitan [Jack](https://jackaudio.org/) para funcionar, pero hay que configurarlo primero. El método recomendado es utilizar `QjackCtl`.
1. Inicia QjackCtl. Verás la **ventana principal de Qt JACK Control**
2. Configura tu hardware de audio como sigue (la configuración exacta de JACK dependerá de lo que es capaz tu hardware de audio):

- Elige el **Interfaz** que quieres utilizar (puede haber varios en la lista)
- Establece la **Frecuencia de Muestreo en 48000**
- Establece los **Cuadros/Periodo en 128** y Periodos/Buffer en 2 para empezar

Reinicia JACK para que surta efecto la nueva configuración

### Arranca Jamulus

Con JACK configurado y ejecutándose, inicia Jamulus.

Si tienes problemas con cortes de sonido (en particular errores de XRUN mostrados por JACK/QjackCtl) prueba con valores más altos (por ej. 256 cuadros o 3 periodos). Valores más bajos (por ej. 64 cuadros) pueden ofrecer un mejor rendimiento pero también quizá más problemas con el audio. Ver la [página de resolución de problemas](Client-Troubleshooting).

## ¿Todo instalado?

Echa un vistazo a la

[página de Iniciación a Jamulus](Getting-Started){: .button}
