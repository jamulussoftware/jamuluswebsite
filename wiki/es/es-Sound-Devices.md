---
layout: wiki
title: "Dispositivos Comprobados"
lang: "es"
permalink: "/wiki/Sound-Devices"
---

# Dispositivos Comprobados

Esta página contiene una lista de dispositivos de hardware que funcionan o no funcionan con Jamulus (aunque puede variar entre Windows, Mac y Linux). Por favor actualízala con cualquier información nueva que tengas (e indica la(s) platforma(s) que has utilizado).

### Se sabe que funcionan con Jamulus

#### Micrófonos USB

* Micrófono Blue Yeti. Funciona bien en Mac (hay una casilla para desactivar monitoreo local). Funciona bien en Windows con ASIO4all pero con un poco más de latencia que en Mac. Puedes apagar el monitoreo local si exploras la configuración. La latencia en Linux es buena pero no encontré la manera de apagar el monitoreo local.

* Interfaz de audio XLR a USB [Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface) con entrada de auriculares; convierte un micrófono XLR en uno USB. Sube la mezcla PC/Mic a 100% PC y escucha la salida por los auriculares. Probado con un Raspberry Pi 4 ejecutando Raspberry Pi OS Buster, versión del kernel 4.19.


#### Interfaces de audio

* Mezcladora USB Ammoon [AGM02](https://www.ammoon.com/p-i3974.html) y [AGM04](https://www.ammoon.com/p-i4049.html): mezcladoras USB de 4 canales relativamente baratas, ambas probadas en MacOS Catalina, la AGM02 probada en Windows 10. En Windows 10, con ASIO4ALL, la AGM02 se puede utilizar como una entrada, y el audio integrado como salida. No hay manera de monitorear solo la señal USB de retorno en la AGM02. (USB Audio)
   **Nota:** La Ammoon AGM04 parece ser una [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/) bajo otra marca.

* ART USB Mix4 (interfaz de audio USB + mezcladora de 4 canales).

* Audient EVO 4, [descarga e instalación del driver](https://evo.audio/driver-installation/) (USB Audio)

* Behringer UCA222 & UCA202 U-Control (USB audio) _Nota: Funciona mejor en Mac y Linux. En Windows, el driver [ASIO4ALL](http://www.asio4all.org/) funciona bien pero tampoco espectacular. También está el [ driver nativo](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) para el cual Behringer retiró el soporte hace tiempo y por tanto retiró de su página de descargas._

* Behringer UGC102 (interfaz USB para guitarra/bajo) _Nota: En Mac, aparece como "USB Audio Codec" - cuando se selecciona para entrada y salida en Jamulus, el puerto del auricular del UGC102 es la salida (y no se puede utilizar como entrada)._

* Interfaces Behringer UMC202HD, UMC204HD, y UMC404HD, [Windows 7 a 10 ASIO Driver](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip) (USB Audio)

* Mezcladora digital Behringer X32 con X-USB 32-entradas/32-salidas (USB audio)

* Behringer XENYX 302USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX 302USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q802USB (USB audio) [Behringer ASIO Driver](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip). Este driver ASIO de Behringer ASIO no parece ser muy bueno. La latencia con este driver 'no soportado' parece pobre - no es mejor que el ASIO4all. Es un buen dispositivo para Mac y Linux, pero quizá no tanto para Windows. Se precisarían más pruebas.

* Mezcladoras digitales Behringer XR18/XR16/XR12 (USB Audio)

* Edirol FA-66 (Firewire) - bueno en Mac, Linux, y Windows [ASIO driver](https://www.roland.com/global/products/fa-66/downloads/)

* Interfaz Focusrite Clarett 4Pre (Thunderbolt 2)

* Interfaces Focusrite Scarlett (USB Audio) _Nota: si tienes problemas con el buffer donde cambia él solo a 136, descarga la versión actualizada del driver `4.64.15.598` desde [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* HiFiBerry DAC + ADC (HAT). Prácticamente sin jitter y buena latencia (20 milisegundos). No tiene amplificador de auriculares, así que necesitarás uno. Yo usé un Rolls MX122 mini mixer. Probado con Raspberry Pi 4 ejecutando Raspberry Pi OS Buster, versión de kernel 4.19.

* Interfaz iConnectivity AUDIO4+ (USB)

* Lexicon Omega (USB audio) _Nota: Funciona mejor en Mac y Linux. Existe un driver para Windows pero no permite usar un tamaño de buffer de 64 y añade algo de latencia en comparación a, por ejemplo, el driver para Mac._

* Line 6 Helix Stomp, lee [Jams remotas con Helix y Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) para la configuración en Mac. (USB Audio)

* MOTU Ultralite (modelo firewire 2010 mk1/mk2), 2015 MacBook Pro, OS X El Capitan 10.11.6, adaptador Apple Thunderbolt/Firewire.

* Native Instruments Komplete Audio 2, probado en Win10 con buffer de 64; sonido limpio y una latencia total de unos 15ms + tiempo ping. (USB Audio)

* Resident Audio T4 (Thunderbolt 2)

* Soundblaster live con driver kX ASIO

* Soundblaster Audigy 4

* Steinberg UR22C (USB3, USBC 32bits 192khz). Funciona directamente en Mac con sonido buenísimo incluso con jack sin balancear. Funciona en un Raspberry PI4 siempre que la versión de jackd sea la de /usr/bin (configurando raspijamulus.sh). No probado en PC.

* Steinberg UR22 MKII. Suena genial, puede utilizar un buffer de 32 y funciona en Windows y Linux. No probado en Mac.

* Grabadora estéreo Tascam DR-07X con entrada de USB audio al ordenador, auriculares en el line-out de la grabadora. También se puede utilizar con un micrófono externo en el line-in (para esto tuve que utilizar un preamplificador). Windows 10.

* Grabadora estéreo Tascam DR-40X como arriba. Pon "Monitor" en "PC/Mac". Ubuntu 18.04.

* Universal Audio Arrow (Thunderbolt 3). Conseguí la latencia más baja jamás con este dispositivo.

* Yamaha AG03 (USB audio)

* Zoom H4 (USB normal) - Funciona también en Mac, PC y Raspberry Pi4

* Zoom TAC-2 (Thunderbolt 2)

### Se sabe que NO funcionan con Jamulus
* Pedal de modelado de amplificador de bajo Zoom B3. No da soporte para 48000 Hz. (USB Audio)
