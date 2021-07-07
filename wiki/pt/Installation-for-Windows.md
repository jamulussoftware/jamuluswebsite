---
lang: pt
layout: wiki
permalink: /wiki/Installation-for-Windows
title: 'Instalação no Windows'
---

{% include breadcrumb.html root="Usand Jamulus" branch1="Começando" branch1-url="Getting-Started" %}

# Instalação no Windows

Primeiro tenha certeza que você já leu a página [Começando](Getting-Started)
1. **Baixe e instale um driver ASIO**. É recomendável usar uma placa ou interface de som com um driver ASIO nativo. Se você não possui uma placa de som externa, você provavelmente deve instalar um driver genérico como ASIO4ALL. Para mais informações vá até a seção [ASIO](#asio) abaixo.
1. [Baixe o Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
 **Mirror 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Instale o Jamulus**: Dê um clique duplo no instalador para rodá-lo. Se você vir uma mensagem de alerta do SmartScreen, clique em "Mais informações" e "Iniciar assim mesmo" para instalar o Jamulus. (Se você for uma das primeiras pessoas a baixar uma nova versão do Jamulus, ele ainda não vai estar na lista do SmartScreen. Nós não pagamos por assinatura de código.)
1. **Inicie o Jamulus**. Agora você vai poder abrir o Jamulus como qualquer outro aplicativo.
1. **Set up your sound card**. When you're done, you need to set up your audio hardware. Have a look at how to set up ASIO4ALL below, if you're using that.

***

## ASIO

Jamulus faz uso do [ASIO](https://pt.wikipedia.org/wiki/Audio_Stream_Input/Output) para poder trabalhar com a menor latência possível.
* Se você usa uma placa ou interface de áudio externa, use seu driver ASIO oficial (eles oferecem a melhor qualidade).
* Se você não possui uma placa externa de som, provavelmente não existe tem um driver ASIO específico. Nesse caso instale um driver genérico, como ASIO4ALL:

Você pode experimentar duas versões diferentes de ASIO4ALL. A versão 2.14 inclui uma solução para um bug que pode causar conflito com outras funções.

[ASIO4ALL v2.15 Beta 2 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta2_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### Configurando o ASIO4ALL

*ASIO4ALL não é recomendado se sua placa ou interface de áudio fornecer seu próprio driver ASIO, uma vez que este tem a melhor latência.*

For ASIO4ALL, you may or may not need to experiment a bit depending on your sound hardware. If everything works out of the box, you don't need to do anything.

**Tip:** Set up your sound card while you're [connected to a server](Getting-Started#connecting-to-a-server-and-testing-your-sound) to hear your instrument or voice and check if everything is correctly set up; but first read on.


Antes de começar a usar o Jamulus:
1. **Close all applications** (especially those which could access your sound card like your browser/media player). ASIO4ALL needs exclusive access to your sound card which means that other programs will not be able to use audio if ASIO4ALL and Jamulus are running.
1. Se o áudio do Jamulus não funcionar diretamente, assegure-se que somente as **entradas e saídas corretas** no ASIO4ALL **estejam ativadas**. Todo o resto deve estar desligado. Procure nas [listas comunitárias de configurações válidas para ASIO4ALL](/kb/2021/03/20/ASIO4ALL-Examples.html) para o seu sistema ou configure-o manualmente se não achá-lo:

### Como configurar as entradas no ASIO4ALL (Guia)

1. Abra as definições do Jamulus.
1. Vá até _"Definições do dispositivo ASIO"_ (coluna à esquerda, direto sob a seleção do driver)
1. Habilite _Configuração avançada_ no ASIO4ALL (clique na ferramente embaixo à direita)
1. Habilite somente o dispositivo de som que você quer usar, clicando no botão próximo ao seu nome
1. Abra as entradas e saídas de sua placa de som clicando no _sinal de mais_ próximo do nome da placa
1. Agora habilite as entradas/saídas corretas na lista abaixo do dispositivo de áudio e desabilite todo o resto. Você pode passar o mouse por cima das opções para ver quais delas suportam o sample rate requirido de 48kHz para Jamulus (qualidade DVD).

**Dicas:**
1. Várias placas de som internas têm o nome Realtek High Definition Audio, Conexant ou similar.
1. Fones de ouvido e auto-falantes são frequentemente nomeados "output" e microfones "input" ou "capture".
1. Stereo Mix/Stereo Input is usually not the input/output you're looking for. Therefore, switch it off if you see it.

### Problemas na configuração do ASIO4ALL?

Se nada funcionar, primeiro reinicie o Jamulus e/ou seu PC para terminar processos em segundo plano que possam estar acessando sua placa de som.

Feito isso, *configure as entradas e saídas de novo*. As entradas/saídas que estiverem acessíveis e ativas aparecem com botões acesos (liga/desliga ou play). Se ao invés disso você vir uma cruz vermelha ou um símbolo amarelo, feche outras aplicações que podem estar acessando seu dispositivo de som (como browser, Zoom, etc).

Dê uma olhada [nesse vídeo](https://youtu.be/_GzOsitVgLI) feito por [trombonepizza](https://github.com/trombonepizza) que dá informações detalhadas sobre a configuração do ASIO4ALL.

Official and further information about how to configure ASIO4ALL is documented in the official [ASIO4ALL FAQs on the ASIO4ALL website](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"}.

## Tudo instalado?

Jamulus foi instalado e pode ser usado agora. Talvez você queira dar uma olhada na página

[Jamulus setup page](Getting-Started){: .button}
