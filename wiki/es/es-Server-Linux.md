---
layout: wiki
title: "Instalación de Servidor - Linux"
lang: "es"
permalink: "/wiki/Server-Linux"
---

{% include breadcrumb.html root="Más" branch1="Ejecutar un Servidor" branch1-url="Running-a-Server" %}

# Instalación de Servidor - Linux

**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**


## Ejecutar el servidor con interfaz gráfica en un PC de escritorio

Si has instalado el cliente Jamulus, puedes ejecutarlo en el [modo de servidor](Choosing-a-Server-Type) que escojas ejecutando Jamulus con la opción `-s` como sigue:

1. Abre una terminal (`CTRL+ALT+t` en Ubuntu y distros relacionadas).
1. Suponiendo que Jamulus se encuentra en `/usr/local/bin`, teclea `Jamulus -s`

Dale a Enter y deberías ver la ventana del servidor. Puedes detener el servidor cerrando la ventana o tecleando `CTRL+C` en la terminal.

**Para configurar el servidor**, por favor consulta [las instrucciones para Windows y macOS](Server-Win-Mac), y las [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.

## Ejecutar un servidor "headless"

La siguiente guía es para ejecutar Jamulus como un servidor "puro" en **hardware sin audio** (por ej. en una máquina externa/host en la nube) y presupone el uso de distribuciones Ubuntu/Debian utilizando systemd. También tenemos instrucciones para [Raspberry Pi](Server-Rpi).

1. Descarga el [último archivo .deb para headless]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }})
1. Actualiza apt para asegurarte de que tienes la lista actual de paquetes estándares: `sudo apt update`
1. Instala el paquete de Jamulus: `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Habilita el servidor 'headless' con systemd: `sudo systemctl enable jamulus-headless`
1. Añade las [opciones de línea de comandos](Command-Line-Options) a la línea `ExecStart` en el archivo de servicio de systemd en `/lib/systemd/system/jamulus-headless.service` (Por defecto estarás ejecutando un servidor privado).
1. Vuelve a cargar los archivos de sistemd `sudo systemctl daemon-reload` y reinicia el servidor "headless": `sudo systemctl restart jamulus-headless`
1. Comprueba que todo va bien con `service jamulus-headless status` (dale a `q` para volver a la línea de comandos).

## Notas

Puedes controlar Jamulus con el comando `service`. Por ejemplo, para detener el servidor limpiamente:

`sudo service jamulus-headless stop`

### Ver los Registros

Jamulus dejará registros en el archivo del sistema si dejaste la configuración `StandardOutput=journal` en el archivo de unidad. Se recomienda dejar registros en el registro del sistema, ya que el sistema gestionará el archivo de registro por tí, sin necesidad de volver luego para purgarlo, o preocuparte por llenar espacio en el disco.

Para ver el registro, utiliza `journalctl` (para salir pulsa Ctrl-C). Por ejemplo, para leer el archivo de registro del sistema, filtrado para el servicio Jamulus:

`journalctl -u jamulus`

Para los registros de hoy:

`journalctl -u jamulus --since today`

Para la última hora:

`journalctl -u jamulus --since "1 hour ago"`

Filtrar el registro para ver mensajes de conexión de tu servidor Jamulus:

`journalctl -u jamulus | grep connected`

Mostrar (en pantalla) mensajes de registro de Jamulus según ocurren:

`journalctl -f -u jamulus`

### Actualización

Para actualizar tu servidor a una versión nueva, simplemente descarga el nuevo archivo .deb y reinstala como en el paso 3.

### Grabación

Ver [esta información](/wiki/Tips-Tricks-More#controlar-grabaciones-en-servidores-linux-headless) sobre controlar las grabaciones en servidores "headless".
