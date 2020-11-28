---
layout: wiki
title: "Bons périphériques connus"
lang: "fr"
permalink: "/wiki/Sound-Devices"
---

# Bons périphériques connus

Cette page recense les périphérique connus pour fonctionner ou non avec Jamulus (bien que ça puisse différer entre Windows, Mac ou Linux).

Vous pouvez la mettre à jour avec les informations dont vous disposez (en indiquant la (les) plateforme(s) vous avez utilisée(s)).

### Connu pour fonctionner avec Jamulus

#### Micros USB

* Blue Yeti microphone. Fonctionnent bien sous Mac (il y a une option à cocher pour désactiver le monitoring local). Fonctionne bien sous Windows avec ASIO4all avec un peu plus de latence que sur Mac. Vous pouvez désactiver le monitoring local en allant en profondeur dans les paramètres. La latence est bonne sous Linux, mais je n'ai pas trouvé comment désactiver le monitoring local. 

* [Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface) Interface audio USB vers XLR avec connecteur jack pour le casque, convertit un micro filaire XLR en un micro USB. Configurez la boîte de dialogue PC/Mix à 100% PC et écoutez la sortie casque. Testé avec un Raspberry Pi 4 sous Raspberry Pi OS Buster, version du noyau 4.19.


#### Interfaces audio

* Ammoon [AGM02](https://www.ammoon.com/p-i3974.html) et [AGM04](https://www.ammoon.com/p-i4049.html) USB mixer : 
consoles de mixages USB 4 canaux relativement peu coûteuses, leux deux testées sous macOS Catalina. La AMG02 a été testé sous Windows 10. Sous Windows 10, avec ASIO4ALL, la AMG02 peut être utilisée en entrée, et la carte son interne en sortie. Il n'y a pas de solution pour monitorer seulement le signal retour USB sur la AMG04. (Audio USB)
**Note:** La Ammoon AGM04 semble être sous une nouvelle marque : [ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/).

* ART USB Mix4 (Console/interface audio USB 4 canaux). 

* Audient EVO 4, [installation et téléchargement des pilotes](https://evo.audio/driver-installation/) (Audio USB)

* Behringer UCA222 & UCA202 U-Control (USB audio) _Note: fonctionnent mieux sous Mac ou Linux. Sous Windows, le pilote [ASIO4ALL](http://www.asio4all.org/) fonctionne mais pas très bien. Il y a aussi le [pilote natif](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) dont Behringer a abandonné le support il y a un certain temps, et donc supprimé de leur section de téléchargement.

* Behringer UGC102 (interface USB pour guitare et basss) _Note: Sur Mac, est reconnue comme "USB Audio Codec", quand utilisé comme entrée et sortie avec Jamulus, la prise casque Jack de la UGC102 est la sortie (et ne peut être utilisée comme entrée)_

* Behringer UMC202HD, UMC204HD, and UMC404HD interfaces, [pilotes ASIO pour Windows 7 à 10](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip) (Audio USB)

* Behringer X32 console de mixage numérique X-USB, 32 entrées/32 sorties (Audio USB)

* Behringer XENYX 302USB (USB audio) [Pilote ASIO Behringer](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q502USB (USB audio) [Pilote ASIO Behringer](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip)

* Behringer XENYX Q802USB (USB audio) [Pilote ASIO Behringer](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip). Ce pilote ASIO Berhinger n'apparait pas être très bon. La latence audio avec ce pilote « non pris en charge » semble médiocre, pas mieux avec ASIO4All. C'est un bon périphérique pour Mac et Linux mais probablement pas pour Windows. Des tests plus poussés sont requis. 

* Consoles de mixage numériques Behringer XR18, XR16, XR12 (Audio USB)

* Edirol FA-66 (Firewire), bon sur Mac, Linux, et Windows. [Pilote ASIO](https://www.roland.com/global/products/fa-66/downloads/)

* Interface Thuderbolt 2 Focusrite Clarett 4Pre

* Interface audio USB Focusrite Scarlett _Note: si vous avez des problèmes avec le tampons qui va à 136, téléchargez la dernière version du driver`4.64.15.598` depuis [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* HiFiBerry DAC +ADC (HAT). Virtuellement pas de gigues et une bonne latence (20 millseconds). Pas d'ampli casque, donc vous en aurez besoin d'un. J'ai utilisé une mini console Rolls MX122. Testé sur Raspberry Pi 4 sous Raspberry Pi OS Buster, noyau version 4.19. 

* Interface audio USB iConnectivity AUDIO4+

* Interface audio USB Lexicon Omega _Note: fonctionne mieux sous Mac et Linux. Il y a un pilote pour Windows mais il ne permet pas d'utiliser un tampons de 64 échantillons et ajoute de la latence comparé au, par ex., pilote Mac._

* Interface audio USB Line 6 Helix Stomp, lisez [Jam à distance avec Helix et Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) (en anglais) pour la configuration sur un Mac.

* MOTU Ultralite (2010 firewire modèles mk1/mk2), 2015 MacBook Pro, OS X El Capitan 10.11.6, adaptateur Thunderbolt/Firewire Apple.

* Intreface audio USB Native Instruments Komplete Audio 2, Testé sous Windows 10 avec un tampon de 64 échantillons et j'ai obtenu un bon son et une latence total autour des 15ms de temps de réponse.

* Resident Audio T4 (Thunderbolt 2)

* Soundblaster live with kX ASIO driver

* Soundblaster Audigy 4

* Steinberg UR22C (USB3, USBC 32bits 192khz). Fonctionne directement sur Mac avec un très bon son même avec un Jack assymétrique. Fonctionne sur un Raspberry Pi4 et la version de jackd se trouvant dans /usr/bin (raspijamulus.sh modifié).  Pas testé sur PC.

* Steinberg UR22 MKII. Génial, peut atteindre une mémoire tampon de 32 échantillons et fonctionne sous Windows et Linux. Pas testé sur Mac.

* Tascam DR-07X enregistreur stéréo avec l'audio USB dans l'ordinateur,  casque sur la sortie ligne de l'enregistreur.
Il peut aussi être utilisé avec un micro externe branché sur l'entrée ligne (nécéssite un pré-ampli micro pour ça). Windows 10.

* Tascam DR-40X enregistreur stéréo comme ci-dessus. Configurez "Monitor" sur "PC/Mac". Ubuntu 18.04.

* Universal Audio Arrow (Thunderbolt 3). Ce périphérique permet d'obtenir la latence la plus faible.

* Yamaha AG03 (USB audio)

* Zoom H4 (regular USB), fonctionne aussi bien sur Mac, PC et Raspberry Pi4

* Zoom TAC-2 (Thunderbolt 2)

### Connu pour ne pas fonctionner avec Jamulus
* Zoom B3 pédale de modélisation d'amplificateur pour basse. Ne supporte pas le 48 KHz. (Audio USB)

