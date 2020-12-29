---
layout: wiki
title: "Resolución de Problemas del Cliente"
lang: "es"
permalink: "/wiki/Client-Troubleshooting"
---

# Resolución de Problemas

### ¿No escuchas nada/Otros no pueden escucharte?
Empieza por lo sencillo: asegúrate de que tu instrumento/micrófono y auriculares están conectados al puerto correcto. Asegúrate de que ninguna otra aplicación como el navegador, herramienta de videoconferencia, etc. está utilizando la tarjeta de sonido. Deberías cerrar estos programas al utilizar Jamulus. Si todo parece estar bien y el problema persiste, es probable que haya algún problema con la configuración del dispositivo de audio. Esto dependerá de tu configuración particular (plataforma, hardware, software y drivers), así que es mejor preguntar en [los foros](https://sourceforge.net/p/llcon/discussion/software/) para solicitar ayuda.

**Usuarios de Windows (ASIO4All)**: Si estás utilizando el driver ASIO4All, mira [la sección de configuración para ASIO4All](Installation-for-Windows#configurar-asio4all) 

### Todos suenan bien pero es difícil tocar todos juntos manteniendo el tiempo.

**Si es posible, NO escuches tu señal directa.** Intenta en lo posible escuchar la señal de tu instrumento/voz que viene _desde el servidor_. Esta señal lleva la mezcla sincronizada de tu audio y la de los demás músicos, y será la señal que los demás escuchen también. Por tanto, ceñirse a esa señal significa que estaréis todos sincronizados (suponiendo que todos tenéis una latencia razonablemente baja). Nótese que si uno o más músicos no siguen esta norma, irán ralentizándose según vayan tocando o cantando.

Puedes probar si estás escuchando correctamente tu señal haciendo lo siguiente:

1. Conecta tu fuente de audio (instrumento/micrófono) al ordenador.
1. Utiliza una aplicación de grabación de audio (como [Audacity](https://www.audacityteam.org/)) en tu ordenador para grabar esa fuente de audio y comprueba que funciona.
1. Asegúrate de que si muteas tu entrada de audio en la aplicación de grabación, no te escuchas.
1. Cierra la aplicación de grabación y abre Jamulus. Aún no deberías oírte.
1. Conéctate a un servidor y toca algo. Ahora deberías escucharte con el retardo del servidor.

**Si sigues teniendo problemas**, prueba a preguntar en el [foro de hardware](https://sourceforge.net/p/llcon/discussion/hardware/). Cómo evitas exactamente escuchar tu señal directa dependerá de tu configuración individual - tu interfaz de audio, mesa de mezclas, conexión de auriculares, etc. Por ejemplo, algunos interfaces de audio tienen botón de "monitor" (apágalo), u opciones similares.

Ten en cuenta que aunque escuches la señal del servidor y esto asegura que estás en sincronización con los demás músicos, puedes experimentar problemas si tu retardo total (indicado por la luz de "Retardo" en Jamulus) no está en verde o al menos en amarillo la mayor parte del tiempo. Consulta el [manual de software](https://github.com/corrados/jamulus/blob/master/src/res/homepage/manual.md) para entender cómo ajustar tu configuración para mejorar este aspecto.

### ¿Dificultades a la hora de configurar el micrófono?

Cuando utilizas un micrófono mientras tocas otro instrumento, puedes utilizar una señal de entrada estéreo en la configuración, donde un canal se conecta al instrumento y el otro canal a la señal del micrófono. En el canal del micrófono es posible aplicar un efecto de reverb opcional.

### ¿El LED del buffer se vuelve rojo, cortes, jitter, sonidos raros?

El procesador de tu ordenador podría estar sobrecargado. Intenta no dejar que otros programas compitan con Jamulus (como Zoom Meetings o streaming en directo de Facebook) en tu máquina. O al menos ciérralos mientras tocas. Evita cosas como escaneos del antivirus o actualizaciones de software, etc. Ten en cuenta que el efecto de reverb en Jamulus consume más CPU cuanto más reverb se aplique.

### Los tiempos del ping y la latencia empiezan bien pero luego empeoran, causando problemas

Esto puede indicar que algo está compitiendo con Jamulus en tu red, así que asegúrate de que nadie está viendo películas en HD en Netflix o realizando una videoconferencia por Zoom mientras tocas. Una solución más permanente para aquellas personas con más inclinación técnica podría ser investigando [el tema del "buffer bloat"](https://www.bufferbloat.net/projects/bloat/wiki/) en su router y si es posible implementar Smart Queue Management (SQM). [Más detalles aquí](https://www.bufferbloat.net/projects/bloat/wiki/What_can_I_do_about_Bufferbloat/).

### ¿Te frustras con los canales de software, ruteo de audio, tasas de muestro y demás?

Normalmente es mucho más fácil y fiable tener una [mesa de mezclas](https://www.thomann.de/pics/bdb/191244/7355025_800.jpg) para conectar tu equipo (instrumentos, micrófono, grabadora, etc.) y luego enviar una simple señal estéreo a tu interfaz de audio (¡pero asegúrate de escuchar el sonido resultante del servidor Jamulus a través del ordenador!). La enorme variedad de combinaciones posibles de hardware, software e instrumentos significa que configurar tu tarjeta de audio para funcionar con tu equipo en particular se puede complicar rápidamente.

### ¿Atronado cuando entra alguien nuevo a tu jam con feedback o ruido?

Puedes establecer el "Nivel Cliente Nuevo" a un valor bajo (por ej. 10), o configurar los músicos con quienes tocas a "Solo" (a la derecha en el panel del mezclador). De ese modo, los nuevos miembros que se unan estarán a un volumen bajo o silenciados.

### ¿No ves el servidor al que te quieres unir?

Primero comprueba que tienes el género de servidor correcto seleccionado en la ventana de Configuración de Conexión. Pero en ocasiones problemas de red hacen que tu cliente no muestre todos los servidores disponibles. Si conoces el nombre del servidor al que te quieres unir, puedes [mirar su dirección IP aquí](https://explorer.jamulus.io/). Introduce la dirección IP en el campo de "Nombre/Dirección Servidor" en la ventana de Configuración de Conexión para conectarte.

### ¿No ves ninguna lista de servidores?

En el Reino Unido (y posiblemente en otras regiones/routers) la configuración del Módem de Virgin Media Cable Internet puede ocasionar problemas. No se debería activar "Block Fragmented IP Packets". Para otros routers/ISPs, también prueba a desactivar SPI (Stateful Packet Inspection) y si eso lo arregla, puedes decidir si lo dejas desactivado o no.

En algunos casos, puede ser que tu ISP esté bloqueando Jamulus. Ver la nota en la página [resolución de problemas del servidor](Server-Troubleshooting#nadie-se-puede-conectar-a-mi-servidor---pero-yo-me-puedo-conectar-localmente) sobre "Nadie se puede conectar a mi servidor"

### Problemas al utilizar Garageband (u otro DAW) con Jamulus?

Ver [este hilo del foro](https://sourceforge.net/p/llcon/discussion/533517/thread/d3dd58eedc/#b994)

### ¿Usas un Mac y tu entrada no se escucha?

(Con agradecimientos a [Mark Anthony De Souza](https://www.facebook.com/groups/619274602254947/permalink/765122847670121/?comment_id=765525034296569))

Quizá no respondiste "Sí" al mensaje de `"Jamulus quiere acceder a tu micrófono"`. Para arreglarlo:
* Ve a `Preferencias` > `Seguridad & Privacidad` > pestaña de `Privacidad`
* Busca `Micrófono` a la izquierda y luego asegúrate de que `Jamulus` está activado en la lista de la derecha

***

Para cualquier otra cosa, por favor busca o publica un post en los [Foros de Discusión](https://sourceforge.net/p/llcon/discussion/software/)
