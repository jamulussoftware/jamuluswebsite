---
layout: wiki
title: "Consejos, Trucos y Más"
lang: "es"
permalink: "/wiki/Tips-Tricks-More"
---

# <g1>Consejos y Trucos</g1>

## Aprendiendo sobre ensayos a distancia

El usuario de Jamulus [Chris Rimple](https://sourceforge.net/u/chrisrimple/profile/) ha reunido una gran cantidad de información sobre [Ensayos a Distancia](https://docs.google.com/document/d/1smcvsxdaaViPQvGMQHmah_6BQeqowhmGSFMHfnlY2FI/) (Google doc, en inglés), que cubre temas como la configuración de software y hardware, y con ejemplos y consejos para los neófitos. También incluye una sección sobre Jamulus, comparándolo con otras soluciones.



## Utilizar el audio de Jamulus en Zoom o en otras aplicaciones similares

Varios usuarios han comentado que han tenido éxito a la hora de organizar un "público virtual" para una sesión de Jamulus utilizando [JACK audio](https://jackaudio.org) para conectar la señal de Jamulus a través de JackRouter a la aplicación de destino (en este caso, Zoom).

También puedes usar [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) para Windows o [BlackHole](https://github.com/ExistentialAudio/BlackHole) para macOS para conectar la salida de Jamulus a mútliples destinos; por ejemplo a tus auriculares y a la aplicación de videoconferencia a la vez.


## Grabar con Jamulus en Windows y Reaper

El usuario de Jamulus [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) ha escrito una [guía para grabar la salida de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc, inglés) usando ReaRoute en [Reaper](https://www.reaper.fm/).


## Compartir partituras

El usuario de Jamulus [BTDT](https://sourceforge.net/u/btdt/profile/) ha escrito un sistema llamado [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), una aplicación web que permite a un "Jam leader" repartir partituras (en formato PDF) entre "Jammers" en tiempo real utilizando navegadores de red estándares.

## Hacer una página de estado del servidor

Con el argumento de la línea de comandos `-m`, se puede generar información estadística sobre el servidor para incluirla en una página web.

Este es un ejemplo de un script php utilizando el archivo de estado del servidor para mostrar el estado actual del servidor en una página html (suponiendo que se utiliza el siguiente argumento de la línea de comandos: `-m /var/www/stat1.dat`):

~~~
<?php
function loadserverstat ( $statfilename )
{
   $datei = fopen ( $statfilename, "r" );
   while ( !feof ( $datei ) )
   {
	  $buffer = fgets ( $datei, 4096 );
	  echo $buffer;
   }
   fclose($datei);
}
?>
<?php loadserverstat ( "stat1.dat" ); ?>
~~~

## Guardar y cargar estados de mezcla de clientes

Puedes guardar y restaurar la mezcla que tienes para los ensayos de tu grupo (fader, mute, pan, solo, etc.) y cargarlo en cualquier momento (incluso mientras tocas). Hazlo con "Archivo > Guardar Configuración Canales Mezclador" en tu cliente, y cárgalo con "Cargar Configuración Canales Mezclador" (o con arrastrar/dejar caer sobre la ventana del mezclador).

## Convertir un servidor público en privado sobre la marcha

Puedes ejecutar un servidor público el tiempo suficiente para que tu grupo se conecte, y luego hacerlo privado simplemente desactivando 'Mi Servidor es Público' en la ventana del servidor. Seguiréis conectados al servidor hasta que os desconectéis. (¡Gracias a [David Savinkoff](https://github.com/DavidSavinkoff) por este truco!)

## Script de arranque para cliente en Linux

Aquí va un script de arranque para Jamulus utilizando una vieja tarjeta de audio Audigy4. El gran número de faders de audio disponibles hace que sea difícil establecer la configuración correcta.

Por tanto, este script incluye la configuración más importante para los faders de audio. La segunda parte del script se ocupa de las conexiones en JACK. Utilizo Guitarix como procesador de efectos de guitarra y lo inserto en la ruta del audio.

Finalmente, arranco Jamulus automáticamente, conectándose al servidor central.

Este es el script:

~~~
amixer sset 'Mic' capture 30% cap
amixer sset 'Mic' playback 0%
amixer sset 'Line' playback 60% unmute
amixer sset 'Audigy Analog/Digital Output Jack' unmute
amixer sset 'Analog Mix' capture 100%
amixer sset 'Analog Mix' playback 0%
amixer sset 'Wave' 100%
amixer sset 'Master' capture 100% cap
amixer sset 'Master' playback 100%
amixer sset 'Master' playback 100%
amixer sset 'PCM' playback 100%
amixer sset 'PCM' capture 0%
guitarix &
/home/corrados/llcon/Jamulus -c myJamulusServer.domain.com &
sleep 3
jack_disconnect system:capture_1 Jamulus:'input left'
jack_disconnect system:capture_2 Jamulus:'input right'
jack_connect system:capture_1 gx_head_amp:in_0
jack_connect gx_head_amp:out_0 gx_head_fx:in_0
jack_connect gx_head_fx:out_0 Jamulus:'input left'
jack_connect gx_head_fx:out_1 Jamulus:'input right'
jack_connect Jamulus:'output left' system:playback_1
jack_connect Jamulus:'output right' system:playback_2
~~~



## Utilizar ctrlmidich para controladores MIDI

Los faders de volumen y paneo, y los botones de mute y solo en la ventana del mezclador del usuario se pueden controlar mediante un controlador MIDI usando el parámetro `--ctrlmidich` (nota: solo disponible para macOS y Linux). Para habilitar esta función, Jamulus debe arrancarse con `--ctrlmidich`. Hay un parámetro MIDI global que es el canal (1-16) y dos parámetros que puedes establecer para cada mando: `compensación` y `cifra de números CC consecutivos`. Establece el primer parámetro al canal MIDI por el que te comunicarás con Jamulus (0 para todos los canales) y luego especifica los mandos que quieres controlar (f = fader volumen; p = pan; m = mute; s = solo) con la compensación (número CC inicial) y cifra de números CC consecutivos. Observa el siguiente ejemplo:

`--ctrlmidich '1;f0*8;p16*8;s32*8;m48*8'`

Aquí, Jamulus recibe por el canal MIDI 1. Los números CC para los faders de volumen comienzan por 0 y hay 8 de ellos (por tanto van hasta el número CC 7). Los mandos de paneo comienzan en el número CC 16 y van hasta el 23; Solo de 32 a 39 y Mute de 48 a 55.

Las columnas de faders y controles de la ventana del mezclador se controlan en orden ascendente de izquierda a derecha. Continuando con el ejemplo de arriba, el fader de volumen de la columna número 1 (de más a la izquierda) se controlaría con el número CC 0; pan con 16; solo con 32 y mute con 48. Como hemos especificado 8 controladores consecutivos para cada parámetro, esto nos daría control sobre 8 columnas (cada una con volumen, pan, solo y mute) en la ventana del mezclador. La siguiente columna se controlaría con 1, 17, 33 y 49, y así sucesivamente.

*Nota:* Jamulus no proporciona información de vuelta via MIDI sobre el estado de los botones de Solo y Mute, lo cual significa que tu controlador debe conmutar los LEDs (si tiene) por sí solo.

Asegúrate de que el puerto de salida de tu dispositivo MIDI esté conectado al puerto de entrada MIDI de Jamulus (QjackCtl (Linux), MIDI Studio (macOS) o lo que sea que utilices para gestionar las conexiones). En Linux tendrás que instalar y arrancar a2jmidid para que tu dispositivo aparezca en la pestaña MIDI de QjackCtl.
