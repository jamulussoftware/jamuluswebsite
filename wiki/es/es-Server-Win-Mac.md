---
layout: wiki
title: "Server Installation - Windows and macOS"
lang: "en"
permalink: "/wiki/Server-Win-Mac"
---

{% include breadcrumb.html root="Más" branch1="Ejecutar un Servidor" branch1-url="Running-a-Server" %}

# Instalación en Windows y macOS


**_Primero asegúrate de leer la [descripción de servidores](Running-a-Server)_**

* **Usuarios de Windows** - Arranca el servidor utilizando la entrada de "Jamulus server" en el menú de inicio de Windows.

* **Usuarios de macOS** - Haz doble cilc en el icono de "Jamulus server" en Aplicaciones (suponiendo que has depositado los archivos allí siguiendo [estas instrucciones](Installation-for-Macintosh)).

* **Usuarios de Linux** - Consulta las [instrucciones para el servidor con interfaz gráfica](Server-Linux#running-a-server-with-the-gui).

<figure><img src="{{site.url}}/assets/img/en-screenshots/server-window-setup.png" loading="lazy" alt="Image of the Jamulus server setup window"></figure>

### Configuración de servidor público

1. Al activar "Mi Servidor es Público" deberías ver un mensaje de confirmación de que tu servidor se ha registrado correctamente.

1. Escribe el nombre, la ciudad y el país para que otros usuarios puedan identificarte con facilidad.

1. Especifica un género musical. Esto hará que tu servidor aparezca en la lista relevante para los clientes (ver más [detalles sobre los Servidores de Directorio](Directory-Servers)).

_La ventana del Mensaje de Bienvenida aparece a todos los usuarios cuando se conectan al servidor (para ellos se abrirá la ventana automáticamente)._

### Configuración de servidor privado

Si no activas "Mi Servidor es Público", estarás ejecutando un servidor privado y debes [leer estas instrucciones](Running-a-Private-Server).

_Si quieres **ejecutar un cliente en la misma máquina** tienes que **conectar el cliente a `127.0.0.1`** para un rendimiento óptimo. (Similarmente, si quieres conectar un cliente en otra máquina de tu red local, utiliza la dirección IP de red local del servidor)._


### Otras opciones

<img width="549" alt="jamulus-server" src="https://user-images.githubusercontent.com/4561747/114275476-79e7e580-9a1a-11eb-8e6b-09d9f956c689.png">

### Grabación

Primero activa la grabación por parte del servidor estableciendo el Directorio de Grabación en la pestaña de Opciones. La grabación comienza cuando la primera persona se conecta al servidor y se para cuando la última persona se marcha. Utiliza el botón de "Nueva Grabación" para crear un nuevo sub-directorio en el cual se guardarán las grabaciones. Nota: las grabaciones son por pistas en el formato `.lof` de [Audacity](https://www.audacityteam.org/) y `.rpp` de [REAPER](https://en.wikipedia.org/wiki/REAPER). Abre los archivos respectivos para escucharlos en estas aplicaciones.

_Nota: Cuando tu servidor está grabando, los clientes mostrarán un mensaje informando de que la grabación está activa._

Para servidores "headless": puedes controlar la función de grabación [siguiendo estas instrucciones](Server-Linux#controlling-recordings).

### Paneo con retardo

Esta opción utiliza las pequeñas diferencias en el tiempo de llegada del sonido a nuestros dos oídos. Produce un efecto estéreo similar a la audición humana cuando se compara a un paneo de "volumen" normal. Ten en cuenta que para conseguir este efecto, los clientes deben estar configurados con 'entrada mono / salida estéreo' (o a 'estéreo', pero solo si transmiten una señal estéreo).

### Dirección Personalizada del Servidor de Directorio


<figure><img src="{{site.url}}/assets/img/en-screenshots/server-window-options.png" loading="lazy" alt="Image of Jamulus server window options"></figure>

Deja este campo vacío a menos que necesites listar tu servidor en un [servidor de directorio privado](Choosing-a-Server-Type#3-central))


**Usuarios de Windows** - Si quieres que el servidor arranque automáticamente al iniciar el sistema, activa la casilla correspondiente.

(Deja el campo de "Dirección Personalizada Servidor de Directorio" vacío a menos que necesites listar tu servidor en un [servidor de directorio privado](Choosing-a-Server-Type#3-directory))


***

Ver también [Opciones de Línea de Comandos](Command-Line-Options) para ver otros parámetros que se pueden establecer.
