---
layout: wiki
title: "Server Installation - Linux"
lang: "en"
permalink: "/wiki/Server-Linux"
---

# Instalación de Servidor - Linux


**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**


## Ejecutar el servidor con interfaz gráfica

Si tienes pensado ejecutar un servidor en tu ordenador (y ya has instalado el cliente de Jamulus), lo puedes hacer en el [modo de servidor](Choosing-a-Server-Type) que desees ejecutando Jamulus con la opción `-s` como sigue:

1. Abre una terminal (`CTRL+ALT+t` en Ubuntu y distros relacionadas).
1. Suponiendo que Jamulus se encuentra en `/usr/local/bin`, teclea `Jamulus -s`

Dale a Enter y deberías ver la ventana del servidor. Puedes detener el servidor cerrando la ventana o tecleando CTRL+C en la terminal.

**Para configurar el servidor**, por favor consulta [las instrucciones para Windows y Macintosh](Server-Win-Mac).

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.

## Ejecutar un servidor "headless"

La siguiente guía es para ejecutar Jamulus como un servidor "puro" en **hardware sin audio** (por ej. en una máquina externa/host en la nube) y presupone el uso de distribuciones Ubuntu/Debian utilizando systemd. También tenemos instrucciones para [Raspberry Pi](Server-Rpi), que va genial.

* _El usuario de Jamulus [Grigory](https://sourceforge.net/u/cidnurg/profile/) mantiene una imagen de **[Docker para Jamulus](https://hub.docker.com/r/grundic/jamulus)** que puedes utilizar._

* _El usuario de Jamulus [skrul](https://sourceforge.net/u/skrulx/profile/) también tiene disponibles algunas **AMI públicas de Amazon EC2** de Ubuntu 18.04 ejecutando Jamulus. [Ver esta página para más detalles](Jamulus-Cloud)._



### Compila las fuentes, crea un usuario


1. [Obtén las fuentes](Installation-for-Linux#get-jamulus-sources) e instala las [dependencias](Installation-for-Linux#install-dependencies) de acuerdo a la guía de instalación de Linux. Ten en cuenta que **no necesitas instalar los paquetes de JACK** para una instalación 'headless'. _Si tienes pensado ejecutar un servidor 'headless' en Gentoo, o estás compilando en Ubuntu para usarlo en otra máquina con Ubuntu, [ver la nota a pie de página](#what-does-the-headless-build-flag-do)._
1. Compila las fuentes para ignorar la librería de sonido de Jack:

~~~
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
~~~

3. Mueve el archivo binario resultante de `Jamulus` a una ubicación permanente, o utiliza `sudo make install`. Ahora puedes eliminar la carpeta de las fuentes si quieres.

**El resto de esta guía presupone que estás utilizando `/usr/local/bin/Jamulus`**

4. Crea un usuario de sistema sin privilegios para ejecutar el servidor (se ejecutará como usuario _jamulus_, grupo _nogroup_):

`sudo adduser --system --no-create-home jamulus`

### Crea un script de arranque

Una vez que has decidido en qué modo quieres ejecutar tu servidor, usa systemd para arrancarlo (el resto de esta guía presupone que lo harás en modo "público" - **Lee también esta [nota importante sobre Servidores Centrales](Central-Servers)).**

Crea un archivo de unidad de systemd, que iniciará el servidor al arrancar el ordenador (gracias a [David Harrold](https://sourceforge.net/u/dkxl/profile/) por esto).

El archivo de unidad aplica una prioridad alta al CPU y al I/O scheduling para el proceso del servidor (y puede ser ignorado en algunos hosts).

Ten en cuenta también que las entradas de registro del servidor irán a journalctl (utiliza [journald](https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs) para verlos).

~~~
[Unit]
Description=Jamulus-Server
After=network.target

[Service]
Type=simple
User=jamulus
Group=nogroup
NoNewPrivileges=true
ProtectSystem=true
ProtectHome=true
Nice=-20
IOSchedulingClass=realtime
IOSchedulingPriority=0

#### Change this to set genre, location and other parameters.
#### See [Command-Line-Options](Command-Line-Options) ####
ExecStart=/usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o "yourServerName;yourCity;[country ID]"

Restart=on-failure
RestartSec=30
StandardOutput=journal
StandardError=inherit
SyslogIdentifier=jamulus

[Install]
WantedBy=multi-user.target
~~~

Copia el archivo a `/etc/systemd/system` y dale permisos:


`sudo cp jamulus.service /etc/systemd/system/jamulus.service`

`sudo chmod 644 /etc/systemd/system/jamulus.service`


Prueba que arranca bien:

`sudo systemctl start jamulus`

`sudo systemctl status jamulus`


Deberías de ver algo así:

~~~
● jamulus.service
   Loaded: loaded (/lib/systemd/system/jamulus.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2020-03-26 11:52:34 GMT; 4s ago
 Main PID: 1308 (Jamulus)
    Tasks: 2 (limit: 4915)
   CGroup: /system.slice/jamulus.service
           └─1308 /usr/local/bin/Jamulus -s -n -e jamulus.fischvolk.de -o yourServerName;yourCity;[country ID]

Mar 26 11:52:34 oddjob systemd[1]: Started jamulus.service.
Mar 26 11:52:35 oddjob jamulus[1308]: - server mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - no GUI mode chosen
Mar 26 11:52:35 oddjob jamulus[1308]: - central server: jamulus.fischvolk.de
Mar 26 11:52:35 oddjob jamulus[1308]: - server info: yourServerName;yourCity;[country ID]
Mar 26 11:52:35 oddjob jamulus[1308]: - welcome message: Thanks for connecting!
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Jamulus, Version [version]
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Internet Jam Session Software
Mar 26 11:52:35 oddjob jamulus[1308]:  *** Under the GNU General Public License (GPL)
~~~

Si todo ha ido bien, activa el inicio del servicio al arrancar con:

`sudo systemctl enable jamulus`

Ahora también puedes controlar Jamulus con el comando de `service`. Por ejemplo:

`sudo service jamulus status`

muestra si Jamulus se está ejecutando bien, y las últimas líneas del registro (donde verás un registro de las conexiones).
Nota: Pulsa `q` para salir del estado del servicio.

### Para actualizar tu instalación a una nueva versión

Descarga las fuentes siguiendo las [instrucciones anteriores](Server-Linux#compile-sources-create-a-user) y repite el proceso de compilación del paso 2 como si fuera una nueva instalación. Cierra el servidor, copia el archivo binario de Jamulus encima del antiguo y reinicialo.

***

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.

## Notas

### Controlar las grabaciones

Cuando se utiliza la [función de grabación](Server-Win-Mac#recording) con la `opción de la línea de comandos` [-R](Command-Line-Options), si el servidor recibe una señal SIGUSR1 durante una grabación, comenzará una nueva grabación en un directorio nuevo. SIGUSR2 conmutará entre grabación activa/desactivada.

Para enviar estas señales utilizando systemd, crea los siguientes dos archivos `.service` en `/etc/systemd/system`, dándoles un nombre apropiado (por ej. `nuevaGrabación-Jamulus-server.service`).

Para encender o apagar la grabación (dependiendo del estado actual):

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

Para empezar una nueva grabación:

~~~
[Unit]
Description=Toggle recording state of Jamulus server
Requisite=Jamulus-Server

[Service]
Type=oneshot
ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

_Nota: El nombre del servicio Jamulus en la línea de `ExecStart` tiene que ser el mismo que el nombre del archivo `.service` que creaste cuando configuraste systemd para controlar tu servidor Jamulus. Así que en este ejemplo sería `Jamulus-Server.service`_

Ejecuta `sudo systemctl daemon-reload` para registrarlos para su primer uso.

Ahora puedes ejecutarlos con el comando `service start`, por ejemplo:

`sudo service jamulusTogglerec start` (suponiendo que has nombrado tu archivo de unidad `jamulusTogglerec.service`)

Puedes ver el resultado de estos comandos si ejecutas `service jamulus status`, o viendo los registros.

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

### ¿Qué hace el indicador de compilación "headless"?

Aunque no es estrictamente necesario, recomendamos utilizar el indicador `headless` para agilizar el proceso de compilación. Los usuarios de Gentoo también pueden evitar la instalación de algunas dependencias como consecuencia de esto. [Más información aquí](Compiling#the-headless-build-flag).
