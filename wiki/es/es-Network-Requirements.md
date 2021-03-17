---
layout: wiki
title: "Calidad, Retardo y Ancho de Banda"
lang: "es"
permalink: "/wiki/Network-Requirements"
---

{% include breadcrumb.html root="Más" branch1="Ejecutar un Servidor" branch1-url="Running-a-Server"  %}

# Requisitos de Red

## Ancho de banda de audio

La configuración de audio tiene un impacto en el ancho de banda de red requerido. La tabla siguiente resume los requisitos con respecto a la configuración de:
* Canales: estéreo/mono
* Calidad: alta/media/baja
* Duración buffer audio: 2,67 ms, 5,33 ms, 10,67 ms, 21,33 ms

Con las siguientes unidades
* ms : milisegundos
* Kbit/s : Kilo-bits por segundo (Recordatorio : 1 Mbit/s = 1024 Kbit/s, 1 KByte/s = 8 Kbit/s)
* Mbit/s : Mega-bits por segundo

| Canales | Calidad | Ancho de banda (para buffer : 2,67 ms) | Ancho de banda (para buffer : 5,33 ms) | Ancho de banda (para buffer : 10,67 ms) | Ancho de banda (para buffer : 21,33 ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Estéreo | Alta | 894 Kbit/s | 657 Kbit/s | 541 Kbit/s | 483 Kbit/s |
| Estéreo | Media | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s |
| Estéreo | Baja | 606 Kbit/s | 372 Kbit/s | 256 Kbit/s | 198 Kbit/s |
| Mono | Alta | 672 Kbit/s | 444 Kbit/s | 328 Kbit/s | 270 Kbit/s |
| Mono | Media | 594 Kbit/s | 366 Kbit/s | 250 Kbit/s | 192 Kbit/s |
| Mono | Baja | 534 Kbit/s | 306 Kbit/s | 190 Kbit/s | 132 Kbit/s |

## Ancho de banda de red

Hay un flujo hacia arriba (músico enviando al servidor) y otro hacia abajo (el servidor enviando la mezcla de vuelta al músico)
![image](https://user-images.githubusercontent.com/9976944/79274940-999b0b00-7ea5-11ea-85be-3ded5ee198d5.png)

Nótese que la tasa de transferencia media de ADSL2 es de 10 Mbit/s para bajada y 1 Mbit/s para subida. El rendimiento real depende de la distancia al proveedor, que puede [variar en teoría de 24 Mbit/s a 0,3 km hasta 1,5 Mbit/s a 5,2 km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) para la tasa de descarga.

