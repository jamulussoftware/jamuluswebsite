---
layout: wiki
title: "Instalación de Servidor - Windows y macOS"
lang: "es"
permalink: "/wiki/Server-Win-Mac"
---

# Instalación para Windows y macOS


**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**

* **Usuarios de Windows** - Arranca el servidor utilizando la entrada de "Jamulus server" en el menú de inicio de Windows.

* **Usuarios de macOS** - Haz doble cilc en el icono de "Jamulus server" en Aplicaciones (suponiendo que has depositado los archivos allí siguiendo [estas instrucciones](Installation-for-Macintosh)).

* **Usuarios de Linux** - Consulta las [instrucciones para el servidor con interfaz gráfica](Server-Linux#ejecutar-el-servidor-con-interfaz-gráfica).

<img width="627" alt="server-setup" src="https://user-images.githubusercontent.com/4263412/102189958-af8b2080-3eb7-11eb-9120-5a0693f37b69.png">

### Configuración de servidor público

1. Al activar "Mi Servidor es Público" deberías ver un mensaje de confirmación de que tu servidor se ha registrado correctamente.

1. Escribe el nombre, la ciudad y el país para que otros usuarios puedan identificarte con facilidad.

1. Especifica un género musical si quieres. Esto hará que tu servidor aparezca en la lista relevante para los clientes (ver más [detalles sobre los Servidores Centrales](Central-Servers)).

_El Mensaje de Bienvenida del Chat aparece a todos los usuarios cuando se unen al servidor (la venta del chat se abrirá automáticamente)._

### Configuración de servidor privado

Si no quieres activar "Mi Servidor es Público", estarás ejecutando un servidor privado y debes [leer estas instrucciones](Running-a-Private-Server).

_Si quieres **ejecutar un cliente en la misma máquina** debes **conectar el cliente a `127.0.0.1`** para un rendimiento óptimo. (Similarmente, si quieres conectar un cliente de otra máquina de tu red local, utiliza la dirección IP local del servidor)._

### Grabación

Primero activa la grabación por parte del servidor estableciendo el Directorio de Grabación en la pestaña de Opciones. La grabación comienza cuando la primera persona se conecta al servidor y se detiene cuando la última persona se marcha. Utiliza el botón de "Nueva Grabación" para crear un nuevo sub-directorio en el cual se guardarán las grabaciones. Nota: las grabaciones son por pistas en el formato `.lof` de [Audacity](https://www.audacityteam.org/) y `.rpp` de [REAPER](https://en.wikipedia.org/wiki/REAPER). Abre los archivos respectivos para escucharlos en estas aplicaciones.

_Nota: Cuando tu servidor está grabando, los clientes mostrarán un mensaje informando de que la grabación está activa._

Para servidores "headless": puedes controlar la función de grabación [siguiendo estas instrucciones](Server-Linux#controlar-las-grabaciones).


### Otras opciones

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4263412/102190318-2de7c280-3eb8-11eb-86d3-3b87e7007b2b.png">

**Usuarios de Windows** - Si quieres que el servidor arranque automáticamente al iniciar el sistema, activa la casilla correspondiente.

(Deja el campo de "Dirección Personalizada Servidor Central" vacío a menos que necesites listar tu servidor en un [servidor central privado](Choosing-a-Server-Type#3-central))





***

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.
