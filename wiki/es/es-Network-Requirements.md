---
layout: wiki
title: "Calidad, Retardo y Ancho de Banda"
lang: "es"
permalink: "/wiki/Network-Requirements"
---

# Requisitos de Red

## Ancho de banda de audio

La configuración de audio tiene un impacto en el ancho de banda de red requerido. La tabla siguiente resume los requisitos con respecto a la configuración de:
* canales : estéreo/mono
* calidad : alta/media/baja
* duración buffer audio : 2,67ms, 5,33ms, 10,67ms, 21,33ms

Con las siguientes unidades
* ms : milisegundos
* Kbps : Kilo-bits por segundo (Recordatorio : 1Mbps = 1024Kbps, 1KByte = 8Kbits)
* Mbps : Mega-bits por segundo

| Canales | Calidad | Ancho de banda (para buffer : 2,67ms) | Ancho de banda (para buffer : 5,33ms) | Ancho de banda (para buffer : 10,67ms) | Ancho de banda (para buffer : 21,33ms) |
| --------- | ------ | -------- | -------- | -------- | -------- |
| Estéreo | Alta | 894 Kbps | 657 Kbps | 541 Kbps | 483 Kbps |
| Estéreo | Media | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Estéreo | Baja | 606 Kbps | 372 Kbps | 256 Kbps | 198 Kbps |
| Mono | Alta | 672 Kbps | 444 Kbps | 328 Kbps | 270 Kbps |
| Mono | Media | 594 Kbps | 366 Kbps | 250 Kbps | 192 Kbps |
| Mono | Baja | 534 Kbps | 306 Kbps | 190 Kbps | 132 Kbps |

## Ancho de banda de red

Hay un flujo hacia arriba (músico enviando al servidor) y otro hacia abajo (el servidor enviando la mezcla de vuelta al músico)
![image](https://user-images.githubusercontent.com/9976944/79274940-999b0b00-7ea5-11ea-85be-3ded5ee198d5.png)

Nótese que la tasa de transferencia media de ADSL2 es de 10 Mbits/segundo para bajada y 1 Mbit/segundo para subida. El rendimiento real depende de la diatancia al proveedor, que puede [variar en teoría de 24Mb/s a 0,3km hasta 1,5Mb/s a 5,2km](https://en.wikipedia.org/wiki/Asymmetric_digital_subscriber_line) para la tasa de descarga.

