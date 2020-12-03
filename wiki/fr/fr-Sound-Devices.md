---
layout: wiki
title: "Périphériques audio"
lang: "fr"
permalink: "/wiki/Sound-Devices"
---

# Périphériques audio

Cette page liste (grâce aux utilisateurs de Jamulus), les périphérique connus pour fonctionner (ou pas) avec Jamulus.  
_**Note**: dépend du fonctionnement du périphérique sous votre système (Linux, macOS, Windows, etc.)_.

Vous pouvez la mettre à jour avec les informations dont vous disposez. **En indiquant la (les) plateforme(s) vous avez utilisée(s) !**.

## Périphériques audio connus pour fonctionner avec Jamulus

### Périphériques USB/USB-C

#### Micros

* **[Blue Yeti](https://www.bluemic.com/fr-fr/products/yeti/)**, micro USB   
Fonctionne bien sous **macOS** (il y a une option à cocher pour désactiver le monitoring local).  
Fonctionne bien sous **Windows 10 avec ASIO4All**, un peu plus de latence que sous macOS. Vous pouvez désactiver le monitoring local en allant en profondeur dans les paramètres.  
La latence est bonne sous **Linux**. À priori on ne peut pas désactiver le monitoring local (ou on pas trouvé comment faire, n'hésitez pas à faire remonter l'information si vous savez comment faire).

* **[Shure X2u](https://www.shure.com/en-GB/products/accessories/x2u-xlr-usb-interface)**, interface audio USB vers XLR avec connecteur Jack pour casque qui convertit un micro filaire en micro USB.  
Configurez la boîte de dialogue PC/Mix à 100% PC pour écouter le mixage de Jamulus sur la sortie casque.  
Testé avec un Raspberry Pi 4 sous **Raspberry Pi OS Buster**, version du noyau 4.19.

* **[Behringer UGC102](https://www.behringer.com/behringer/product?modelCode=P0198)**, interface audio numérique USB pour guitare et basse  
Sur **macOS**, est reconnue comme « USB Audio Codec ». La prise casque Jack de la **UGC102** est la sortie, et ne peut donc être utilisée comme entrée. 

#### Interfaces audio / consoles de mixage

* **[Solid State Logic SSL2+](https://www.solidstatelogic.com/products/ssl2-plus)**, interface audio numérique USB-C/USB 2 entrées / 4 sorties  
Fonctionne à merveille, que ce soit sous **Linux** (Ubunutu 20.04 ou Raspberry Pi OS (Buster)), **macOS** (pas testé sur Big Sure) ou **Windows 10** avec le [pilote ASIO natif](http://eu1.download.solidstatelogic.com/SSL%202/SolidStateLogic_UsbAudio_v4.67.0_2019-10-21_setup%20(3).exe).  
Le monitoring du mixage de Jamulus se fait en déplaçant complètement le potentiomètre « MONITOR MIX » vers la droite sur « USB ». Voir le [mode d'emploi](http://eu1.download.solidstatelogic.com/2%20Plus%20/SSL%202%20Plus%20User%20Guide_ENGLISH.pdf) (en anglais).

* **[Ammoon AGM02](https://www.ammoon.com/p-i3974.html)** et **[Ammoon AGM04](https://www.ammoon.com/p-i4049.html)**, consoles de mixages audio compactes USB 2 et 4 canaux petit budget  
Les deux testées sous **macOS Catalina**.  
La **AMG02** a été testé sous **Windows 10**. Sous Windows 10, avec ASIO4All, la **AMG02** peut être utilisée en entrée et la carte son interne de l'ordinateur en sortie pour écouter le mix de Jamulus. Il n'y a pas de solution pour écouter uniquement le signal retour de Jamulus sur la **AMG02**. 
_**Note:** L'AGM04 d'Ammoon semble être la même que la **[ART USBMix4](https://artproaudio.com/product/usbmix4-four-channel-mixer-usb-audio-interface/)**_.

* **ART USBMix4**, console de mixage audio numérique USB 4 canaux (_voir ci-dessus_)

* **[Audient EVO 4](https://evo.audio/fr/produits/evo-4/presentation/)**, interface audio numérique USB 2 entrées / 2 sorties  
[Installation et téléchargement des pilotes](https://evo.audio/fr/produits/evo-4/telechargements/),

* **[Behringer UCA222](https://www.behringer.com/product.html?modelCode=P0A31)** & **Behringer UCA202 U-Control**, interface audio USB numérique 2 entrées / 2 sorties  
_Note: fonctionnent mieux sous **macOS** ou **Linux**._  
Sous **Windows**, le pilote [ASIO4ALL](http://www.asio4all.org/) fonctionne mais pas très bien. Il y a aussi le [pilote natif](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip) dont Behringer a abandonné le support il y a un certain temps, et donc supprimé de la section de téléchargement.   

* **[Behringer UMC202HD](https://www.behringer.com/product.html?modelCode=P0BJZ)**, **UMC204HD**, et **UMC404HD** interfaces audio numériques USB  
[pilotes ASIO pour Windows 7 à 10](http://downloads.music-group.com/software/behringer/UMC/UMC-Driver_4-59-0.zip)  

* **[Behringer X32](https://www.behringer.com/behringer/product?modelCode=P0ASF)** console de mixage numérique X-USB, 32 entrées/32 sorties  

* **[Behringer XR18](https://www.behringer.com/product.html?modelCode=P0BI8)** (série XR), console de mixage numériques USB  

* **[Berhinger Série XENYX](https://www.behringer.com/series.html?category=R-BEHRINGER-XENYXSERIES)**  
[Pilote ASIO Behringer](http://www.behringerdownload.de/_software/BEHRINGER_2902_X64_2.8.40.zip), ce pilote ASIO Berhinger n'apparait pas être très bon. La latence audio avec ce pilote « non pris en charge » semble médiocre, pas mieux avec ASIO4All. C'est un bon périphérique pour **macOS** et **Linux** mais probablement pas pour Windows.  
Des tests plus poussés sont requis.

* **[Focusrite Scarlett](https://focusrite.com/en/scarlett)**, interfaces audio numériques USB.
_Note: si vous avez des problèmes avec le tampon qui va à 136, téléchargez la dernière version du driver`4.64.15.598` depuis [http://beta.focusrite.com/](http://beta.focusrite.com/)_

* **[iConnectivity AUDIO4+](https://www.iconnectivity.com/products/audio/iconnectaudio4plus)**, interface audio numérique USB  

* **[Lexicon Omega](conpro.com/en/products/omega)**, mixeur audio numérique USB  
_Note: fonctionne mieux sous **macOS** et **Linux**. Il y a un pilote pour Windows mais il ne permet pas d'utiliser un tampon de 64 échantillons et ajoute de la latence comparé au, par ex., pilote macOS._

* **[Native Instruments Komplete Audio 2](https://www.native-instruments.com/fr/products/komplete/audio-interfaces/komplete-audio-1-audio-2/)**, interface audio numérique USB  
Testé sous **Windows 10** avec un tampon de 64 échantillons, on obtient un bon son et une latence totale autour des 15ms de temps de réponse.

* **[Steinberg UR22C](https://new.steinberg.net/fr/audio-interfaces/ur22c/)** interface audio numérique USB3/USB-C   
Fonctionne directement sur macOS avec un très bon son même avec un Jack asymétrique.  
Fonctionne sur un Raspberry Pi4 et la version de `jackd` se trouvant dans `/usr/bin` (`raspijamulus.sh` modifié).  
Pas testé sur PC.

* **[Steinberg UR22 MKII](https://www.steinberg.fr/fr/produits/interfaces_audio/ur_series/modeles/ur22mkii.html)**, interface audio USB  
Génial, peut atteindre une mémoire tampon de 32 échantillons et fonctionne sous **Windows** et **Linux**.  
Pas testé sur macOS.

* **[Yamaha AG03](https://fr.yamaha.com/fr/products/music_production/interfaces/ag_series/index.html)**, interface audio/MIDI USB

#### Modéliseurs ampli (instruments)

* **[Line 6 HX Stomp](https://fr.line6.com/hx-stomp/)**, pédale multi-effets pour guitare USB  
Lisez [Jam à distance avec Helix et Jamulus](https://jimamsden.wordpress.com/2020/04/04/remote-jamming-with-helix-and-jamulus/) (en anglais) pour la configuration sur un Mac.

#### Enregistreurs numériques

* **Tascam DR-07X** enregistreur stéréo avec l'audio USB dans l'ordinateur,  casque sur la sortie ligne de l'enregistreur.
Il peut aussi être utilisé avec un micro externe branché sur l'entrée ligne (nécessite un pré-ampli micro pour ça). Testé sous **Windows 10**.

* **Tascam DR-40X** enregistreur stéréo comme ci-dessus. Configurez "Monitor" sur "PC/Mac". **Linux Ubuntu 18.04**.

* **[Zoom H4](https://zoomcorp.com/en/us/handheld-recorders/handheld-recorders/h4/)**, enregistreur portable USB
Fonctionne aussi bien sur Mac, PC et Raspberry Pi4

### Périphériques Firewire

* **[Presonus StudioLive 16.4.2 AI](https://www.presonus.com/products/StudioLive-1642AI)** (série AI Firewire), console de mixage numérique Firewire  
Fonctionne parfaitement avec Jamulus sous **macOS** (pas testé sur Big Sure). Affectez les entrées individuelles dans Jamulus ou les entrées correspondants à un mix auxiliaire stéréo (à patcher dans « Universal Control ») si plus de deux canaux. Utilisez les sorties 17-18 pour le monitoring du mix de Jamulus.  
Ces consoles fonctionnent sous Windows, elles devraient fonctionner avec Jamulus sous cet OS (pas testé).  
Pas testé sous Linux, pourraient fonctionner (ou pas), voir [ici](https://forums.presonus.com/viewtopic.php?f=67&t=2717) (en anglais).

* **[Edirol (Roland) FA-66](https://www.roland.com/fr/products/fa-66/)** Interface audio numérique Firewire  
Bon sur **macOS**, **Linux**, et **Windows**, [Pilote ASIO](https://www.roland.com/global/products/fa-66/downloads/).

* **[MOTU Ultralite](https://motu.com/products/motuaudio/copy_of_ultralite/body-old.html)** (2010 modèles MK1/MK2), interface audio numérique Firewire  
Testé avec un MacBook Pro 2015, **Mac OS X** 10.11.6 (El Capitan), adaptateur Thunderbolt/Firewire Apple.


### Périphériques Thunderbolt

* **[Focusrite Clarett 4Pre](https://focusrite.com/fr/node/43)**, interface audio numérique Thunderbolt 2  

* **[Resident Audio T4](http://www.residentaudio.com/t4overview)**, interface audio numérique Thunderbolt 2

* **[Universal Audio Arrow](https://www.uaudio.fr/audio-interfaces/arrow.html)**, interface audio numérique Thunderbolt 3  
Ce périphérique permet d'obtenir la latence la plus faible.

* **[Zoom TAC-2](https://zoomcorp.com/fr/fr/interfaces-audio/audio-interfaces/tac-2/)**, interface audio numérique Thunderbolt 2

### Cartes son

* **[HiFiBerry DAC+ ADC](https://www.hifiberry.com/shop/boards/hifiberry-dac-adc/)**, carte son interne HAC compatible Raspberry Pi.  
Virtuellement pas de gigues et une bonne latence (20 millseconds). Pas d'ampli casque, donc vous en aurez besoin d'un. Utilisé avec une mini console [Rolls MX122](https://rolls.com/product/MX22s). Testé sur Raspberry Pi 4 sous **Raspberry Pi OS Buster**, noyau version 4.19.

* **[Soundblaster Live!](https://en.wikipedia.org/wiki/Sound_Blaster_Live!)**, carte son PCI
Avec [kX ASIO driver](https://www.kxproject.com/)

* **[Soundblaster Audigy 4](https://en.wikipedia.org/wiki/Sound_Blaster_Audigy#Sound_Blaster_Audigy_4)**, carte son PCI  

### Périphériques audio connus pour ne pas fonctionner avec Jamulus

* **Zoom B3**, pédale de modélisation d'amplificateur pour basse USB. **Ne supporte pas le 48 KHz**.

* **Line6 Bass POD**, pédale de modélisation d'amplificateur pour basse USB. **Ne supporte pas le 48 KHz**.




