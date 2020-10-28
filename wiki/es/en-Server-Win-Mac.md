---
layout: wiki
title: "Instalación de Servidor - Windows y Macintosh"
lang: "es"
permalink: "/wiki/Server-Win-Mac"
---

# Installation for Windows and Macintosh


**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**

* **Usuarios de Windows** - Arranca el servidor utilizando la entrada de "Jamulus server" en el menú de inicio de Windows.

* **Usuarios de Macintosh** - Haz doble cilc en el icono de "Jamulus server" en Aplicaciones (suponiendo que has depositado los archivos allí siguiendo [estas instrucciones](Installation-for-Macintosh)).

* **Usuarios de Linux** - Consulta las [instrucciones para el servidor con interfaz gráfica](Server-Linux#running-a-server-with-the-gui).

<img width="627" alt="server-setup" src="https://user-images.githubusercontent.com/4561747/87871031-19ed7280-c9a5-11ea-9104-6234a227ed62.png">

### Configuración de servidor público

1. Al activar "Mi Servidor es Público" deberías ver un mensaje de confirmación de que tu servidor se ha registrado correctamente.

1. Escribe el nombre, la ciudad y el país para que otros usuarios puedan identificarte con facilidad.

1. Especifica un género musical si quieres. Esto hará que tu servidor aparezca en la lista relevante para los clientes (ver más [detalles sobre los Servidores Centrales](Central-Servers)).

_The Chat Welcome Message appears to all users when they join the server (the chat window will open automatically for them)._

### Configuración de servidor privado

Si no quieres activar "Mi Servidor es Público", estarás ejecutando un servidor privado y debes [leer estas instrucciones](Running-a-Private-Server).

_If you want to **run a client on the same machine** you should **connect the client to `127.0.0.1`** for best performance. (Similarly, if you want to connect a client on another machine on your LAN, use the server's LAN IP address)._

### Grabación

Primero activa la grabación por parte del servidor estableciendo el Directorio de Grabación en la pestaña de Opciones. La grabación comienza cuando la primera persona se conecta al servidor y se para cuando la última persona se marcha. Utiliza el botón de "Nueva Grabación" para crear un nuevo sub-directorio en el cual se guardarán las grabaciones. Nota: las grabaciones son por pistas en el formato `.lof` de [Audacity](https://www.audacityteam.org/) y `.rpp` de [REAPER](https://en.wikipedia.org/wiki/REAPER). Abre los archivos respectivos para escucharlos en estas aplicaciones.

_Nota: Cuando tu servidor está grabando, los clientes mostrarán un mensaje informando de que la grabación está activa._

For headless servers: you can control the recording function [using these instructions](Server-Linux#controlling-recordings).


### Otras opciones

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/95724775-accd3e80-0c6e-11eb-90ba-7131e9c15316.png">

**Usuarios de Windows** - Si quieres que el servidor arranque automáticamente al iniciar el sistema, activa la casilla correspondiente.

(Deja el campo de "Dirección Personalizada Servidor Central" vacío a menos que necesites listar tu servidor en un [servidor central privado](Choosing-a-Server-Type#3-central))





***

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.
