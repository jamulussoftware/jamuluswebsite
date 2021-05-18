---
layout: wiki
title: "Installation for Windows"
lang: "pt"
permalink: "/wiki/Installation-for-Windows"
---
{% include breadcrumb.html root="Usand Jamulus" branch1="Começando" branch1-url="Getting-Started" %}

# Instalação no Windows
Primeiro tenha certeza que você já leu a página [Começando](Getting-Started)

1. **Baixe e instale um driver ASIO**. É recomendável usar uma placa ou interface de som com um driver ASIO nativo. Se você não possui uma placa de som externa, você provavelmente deve instalar um driver genérico como ASIO4ALL. Para mais informações vá até a seção [ASIO](#asio) abaixo.
1. [Baixe o Jamulus]({{ site.download_root_link }}{{ site.download_file_names.windows }}){: .button}\\
**Mirror 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Instale o Jamulus**: Dê um clique duplo no instalador para rodá-lo. Se você vir uma mensagem de alerta do SmartScreen, clique em "Mais informações" e "Iniciar assim mesmo" para instalar o Jamulus. (Se você for uma das primeiras pessoas a baixar uma nova versão do Jamulus, ele ainda não vai estar na lista do SmartScreen. Nós não pagamos por assinatura de código.)
1. **Inicie o Jamulus**. Agora você vai poder abrir o Jamulus como qualquer outro aplicativo.
1. **Configure sua placa de som**. Em seguida você deve configurar o seu hardware de áudio. Dê uma olhada de como configurar ASIO4ALL se você estiver usando este driver e/ou [Hardware Setup](Hardware-Setup).

***

## ASIO
Jamulus faz uso do [ASIO](https://pt.wikipedia.org/wiki/Audio_Stream_Input/Output) para poder trabalhar com a menor latência possível.
* Se você usa uma placa ou interface de áudio externa, use seu driver ASIO oficial (eles oferecem a melhor qualidade).
* Se você não possui uma placa externa de som, provavelmente não existe tem um driver ASIO específico. Nesse caso instale um driver genérico, como ASIO4ALL:

Você pode experimentar duas versões diferentes de ASIO4ALL. A versão 2.14 inclui uma solução para um bug que pode causar conflito com outras funções.

[ASIO4ALL v2.15 Beta 1 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.15/ASIO4ALL_2_15_Beta1_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL v2.14 Download](https://github.com/jamulussoftware/assets/raw/main/ASIO4ALL/v2.14/ASIO4ALL_2_14_English.exe){: .button target="_blank" rel="noopener noreferrer"}

[ASIO4ALL website](https://www.asio4all.org/){: target="_blank" rel="noopener noreferrer"}


### Configurando o ASIO4ALL
*ASIO4ALL não é recomendado se sua placa ou interface de áudio fornecer seu próprio driver ASIO, uma vez que este tem a melhor latência.*

No ASIO4ALL você pode ter que experimentar até achar a configuração certa, já que computadores diferem um pouco um do outro.

**Dica:** Configure sua placa de som enquanto estiver [conectado com um servidor](Onboarding#2-connecting-to-a-server) para poder ouvir sua própria voz ou instrumento e checar se tudo está correto; mas antes disso continue lendo.

Antes de começar a usar o Jamulus:

1. **Feche todos os programas** (especialmente aqueles que acessam sua placa de som, como navegador ou reprodutor de mídia) pois Jamulus precisa de acesso exclusivo à sua placa de som. Outros programas não vão poder usar o áudio se ASIO4ALL e Jamulus estiverem rodando.

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
1. Via de regra Stereo Mix não é o input/output que você está procurando, e portanto deve ser desabilitado, caso você o veja.

### Problemas na configuração do ASIO4ALL?

Se nada funcionar, primeiro reinicie o Jamulus e/ou seu PC para terminar processos em segundo plano que possam estar acessando sua placa de som.

Feito isso, *configure as entradas e saídas de novo*. As entradas/saídas que estiverem acessíveis e ativas aparecem com botões acesos (liga/desliga ou play). Se ao invés disso você vir uma cruz vermelha ou um símbolo amarelo, feche outras aplicações que podem estar acessando seu dispositivo de som (como browser, Zoom, etc).

Dê uma olhada [nesse vídeo](https://youtu.be/_GzOsitVgLI) feito por [trombonepizza](https://github.com/trombonepizza) que dá informações detalhadas sobre a configuração do ASIO4ALL.

Outras informações, oficiais e informais, sobre como configurar ASIO4ALL você encontra nos [FAQs ASIO4ALL no site ASIO4ALL](https://www.asio4all.org/index.php/help/faq/){: target="_blank" rel="noopener noreferrer"} e no manual ASIO4ALL que você encontra no seu desktop ou na pasta onde os arquivos ASIO4ALL foram instalados (normalmente `C:\Program Files (x86)\ASIO4ALL v2\`)).

## Tudo instalado?

Jamulus foi instalado e pode ser usado agora. Talvez você queira dar uma olhada na página

[Jamulus Onboarding](Onboarding){: .button}
