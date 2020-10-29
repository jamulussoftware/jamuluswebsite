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

Varios usuarios han comentado que han tenido éxito a la hora de organizar un "público virtual" para una sesión de Jamulus utilizando [Jack audio](https://jackaudio.org) para conectar la señal de Jamulus a través de JackRouter a la aplicación de destino (en este caso, Zoom).

También puedes usar [VoiceMeeter](https://www.vb-audio.com/Voicemeeter/banana.htm) (Banana) para Windows o [BlackHole](https://github.com/ExistentialAudio/BlackHole) para Mac para conectar la salida de Jamulus a mútliples destinos; por ejemplo a tus auriculares y a la aplicación de videoconferencia a la vez.


## Grabar con Jamulus en Windows y Reaper

El usuario de Jamulus [Rob Durkin](https://sourceforge.net/u/bentwrench/profile/) ha escrito una [guía para grabar la salida de Jamulus](https://docs.google.com/document/d/1tENfNKTWHasuTg33OdLLEo4-OOhWJolOo42ffSARxhY/edit) (Google Doc, inglés) usando ReaRoute en [Reaper](https://www.reaper.fm/).


## Compartir partituras

El usuario de Jamulus [BTDT](https://sourceforge.net/u/btdt/profile/) ha escrito un sistema llamado [305keepers](https://github.com/keepers305/Song-Sheet-Sharing-Web-Pages), una aplicación web que permite a un "Jam leader" repartir partituras (en formato PDF) entre "Jammers"en tiempo real utilizando navegadores de red estándares.

## Hacer una página de estado del servidor

Con el argumento de la línea de comandos `-m`, se puede generar información estadística sobre el servidor para incluirla en una página web.

Este es un ejemplo de de un script php utilizando el archivo de estado del servidor para mostrar el estado actual del servidor en una página html (suponiendo que se utiliza el siguiente argumento de la línea de comandos: `-m /var/www/stat1.dat`):

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

## Guardar estado de mezcla de clientes entre sesiones

Puede que quieras guardar y restaurar la mezcla que tienes para los ensayos con tu grupo (fader, mute, pan, solo, etc.). Hazlo arrancando Jamulus con la configuración `--inifile` (por ej. `Jamulus --inifile "c:\temp\jamulussetup1.ini"`) en la línea de comandos.

Haz tu sesión, luego desconecta y cierra Jamulus. Toda la configuración de los faders se guardan en el archivo de inicio.Si quieres guardar otra sesión, simplemente copia el archivo `jamulussetup1.ini` a `jamulussetup2.ini` y arranca con `--inifile "c:\temp\jamulussetup2.ini"`. Si quieres volver a la primera sesión, simplemente arranca Jamulus con el promer archivo de nuevo.


## Script de arranque para cliente en Linux

Aquí va un script de arranque para Jamulus utilizando una vieja tarjeta de audio Audigy4. El gran número de faders de audio disponibles hace que sea difícil establecer la configuración correcta.

Por tanto, este script incluye la configuración más importante para los faders de audio. La segunda parte del script se ocupa de las conexiones en Jack, Utilizo Guitarix como procesador de efectos de guitarra y lo inserto en la ruta del audio.

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



## Usar la opción --ctrlmidich para utilizar un controlador MIDI

El usuario de Jamulus [Ignotus](https://sourceforge.net/u/jammerman/profile/) escribe: Si quieres utilizar un controlador MIDI genérico, necesitarás hacer ajustes a tu controlador o recompilar las fuentes de Jamulus:

Nota: solo disponible para usar con MacOS y Linux.

Los mensajes MIDI CC consisten en un Número de Control (Control Number), Valor de Control (Controller Value), y Canal (Channel). Jamulus reacciona al Número de Control para saber qué fader mover, en el Canal que especifiques al arrancar Jamulus con `--ctrlmidich`.

Por defecto, el cliente de Jamulus está configurado para su uso con el Behringer X-Touch, que por lo visto envía Números de Control empezando por 70, cuando los faders de Jamulus tienen índice 0, lo que significa que hay una compensación de -70 en el código para convertir ese Número de Control en 0 para el primer fader, 71 para el siguiente, etc.

Si puedes cambiar el Número de Control en tu controlador MIDI, simplemente establécelo en 70 (71, 72, etc. para los faders siguientes). Arranca Jamulus con `--ctrlmidich x` donde 'x' es el canal MIDI que estás usando, o arráncalo con `--ctrlmidich 0` para recibir por todos los canales, y ya está. Asegúrate de conectar la salida MIDI de tu controlador a la entrada MIDI de Jamulus (Qjackctl (Linux), MIDI Studio (MacOS) o lo que sea que uses para gestionar las conexiones). En Linux tendrás que instalar y lanzar a2jmidid para que tu dispositivo aparezca en la pestaña de MIDI en Qjackctl.

Si no puedes cambiar los Números de Control en tu controlador, tendrás que modificar y recompilar las fuentes:
En el archivo `src/soundbase.cpp`, ve a la línea 290, elimina el `- 70` al final (no el punto y coma) para utilizar el Número de Control 0 para el primer fader, o reemplaza ese número con el Número de Control inicial que envía tu dispositivo MIDI. Guarda, [compila](Compiling) e instala.

## Utilizar in sinte de software con Jamulus

El maestro sónico [Engelbert Niehaus](https://github.com/niebert) describe cómo se puede utilizar la entrada MIDI de JACK para [tocar un sinte de software a través de Jamulus](Software-Synth). Este ejemplo utiliza Linux, pero un enfoque similar fuincionaría para Windows y Mac.

## Ejecutar Jamulus con Múltiples Interfaces de Audio

Es posible ejecutar Jamulus con múltiples interfaces de audio en los tres sistemas operativos. Esto es útil cuando necesitamos sacar el audio de un instrumento a través de una tarjeta de audio externa para una latencia mínima, y usar el micrófono del ordenador para la comunicación. Otros casos de uso pueden ser aplicables. [Ver esta guía para más detalles](Running-Jamulus-with-Multiple-Audio-Interfaces)
