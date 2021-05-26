---
lang: es
layout: wiki
permalink: /wiki/Command-Line-Options
title: 'Opciones de Línea de Comandos'
---

# Opciones de Línea de Comandos

Las funciones más comunes de Jamulus pueden configurarse usando la interfaz gráfica, pero estas y otras también pueden ser controladas utilizando la línea de comandos. Exactamente cómo se hace dependerá de tu sistema operativo.

Por ejemplo, en Windows, para que un cliente utilice un archivo específico de configuración, haz clic derecho en el acceso directo de Jamulus y elige "Propiedades" > Destino. Añade los argumentos necesarios a Jamulus.exe:

```shell "C:\Program Files (x86)\Jamulus\Jamulus.exe" --inifile "C:\path\to\myinifile.ini" ```

Para macOS, arranca una ventana de Terminal y ejecuta Jamulus con las opciones deseadas como sigue:

/Applications/Jamulus.app/Contents/MacOS/Jamulus --inifile "/ruta/a/myinifile.ini"

***

Puedes ver todas las opciones posibles soportadas por tu versión arrancando Jamulus con la opción `-h`.

_Nótese que las siguientes opciones no alterarán las configuraciónes hechas en la interfaz gráfica._

### Configuraciones generales (modos cliente y servidor)

| Corto | Nombre largo | `[...]` significa parámetro opcional | Notas |
|---------|-------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| `-h,-?` | `--help` | Este texto de ayuda |                                                          |
| `-i` | `--inifile` | Establece ubicación de archivo de inicialización (anula la predeterminada) | Cliente (siempre) y servidor (con interfaz gráfica) |
| `-n` | `--nogui` | Deshabilitar interfaz gráfica |                                                          |
| `-p` | `--port` | Número de puerto UDP local. El predeterminado es 22124 |                                                          |
| `-Q` | `--qos` | Establece el valor de la calidad de servicio (QoS) DSCP. Por defecto 128. Desactivado con 0. | QoS es ignorado por Windows, pero consulta [Consejos y Trucos](Tips-Tricks-More#quality-of-service) para ver cómo aplicarlo. |
| `-t` | `--notranslation` | Deshabilitar traducciones |                                                          |
| `-v` | `--version` | Mostrar información de la versión y salir | |

### Solo servidor

| Corto | Nombre largo | `[...]` significa parámetro opcional | Notas |
|-------|-------------------|----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| `-d` | `--discononquit` | Desconectar todos los clientes al salir |                                                                          |
| `-e` | `--centralserver` | Hace que el servidor sea público y establece el género. Ver también `-o` | Ver [tipos de servidores](Choosing-a-Server-Type#3-directorio) |
| `-f` | `--listfilter` | Lista blanca de servidores registrándose en la lista de servidores, formato `dirección ip 1[;dirección ip 2]` | Solo servidores de directorio. [Ver nota](Choosing-a-Server-Type#3-directorio) |
| `-F` | `--fastupdate` | Reduce la latencia si el cliente se conecta con la opción "Activar Buffers Pequeños". Requiere un procesador potente para evitar cortes, y más ancho de banda hacia clientes activados. |                                                                          |
| `-l` | `--log` | Habilitar registro, establece ruta y nombre del archivo |                                                                          |
| `-L` | `--licence` | Muestra una ventana de aceptación para que los usuarios se puedan conectar |                                                                          |
| `-m` | `--htmlstatus` | Habilita un archivo de estado HTML, establece una ruta y un nombre de archivo |                                                                          |
| `-o` | `--serverinfo` | Detalles de localización del servidor en el formato: `[nombre];[ciudad];[valor locale]` (ver [valores](https://doc.qt.io/qt-5/qlocale.html#Country-enum)) | Solo servidores públicos |
| `-P` | `--delaypan` | Iniciar con paneo con retardo | Ver [Configuración del Servidor](https://jamulus.io/wiki/Server-Win-Mac#otras-opciones) |
| `-R` | `--recording` | Incluye una ruta editable donde se deben guardar los archivos (entrecomillado si procede). | Ver [Configuración del Servidor](Server-Win-Mac#grabación). |
|       | `--norecord` | Desactiva la grabación cuando se habilita por defecto con `-R` |                                                                          |
|       | `--serverbindip` | Especifica la dirección IP a la que vincularse |

### Solo cliente

| Corto | Nombre largo | `[...]` significa parámetro opcional | Notas |
|-------|-------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| `-M` | `--mutestream` | Inicia Jamulus en estado muteado |                                                                             |
|       | `--mutemyown` | Silenciarme en mi mezcla personal | Solo headless |
| `-c` | `--connect` | Conectar con una dirección de servidor al arrancar, formato `dirección[:puerto]` |                                                                             |
| `-j` | `--nojackconnect` | Deshabilitar conexiones automáticas de JACK |                                                                             |
|       | `--ctrlmidich` | Canal para recibir mensajes de controlador MIDI, compensación de número de control y números CC consecutivos (canales). Formato: `canal[;f<comp>*<canales>][;p<comp>*<canales>][;s<comp>*<canales>][;m<comp>*<canales>]` | Ver [Consejos y Trucos](Tips-Tricks-More#utilizar-ctrlmidich-para-controladores-midi) |
|       | `--clientname` | Título de ventana y nombre de cliente en JACK |                                                                             |



