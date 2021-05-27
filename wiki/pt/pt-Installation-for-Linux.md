---
layout: wiki
title: "Installation for Linux"
lang: "pt"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Usand Jamulus" branch1="Começando" branch1-url="Getting-Started" %}

# Instalação no Linux
Primeiro tenha certeza que você já leu a página [Começando](Getting-Started)

### Debian e Ubuntu

1. Baixe o [pacote .deb atual]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }})
1. Atualize o apt: `sudo apt-get update`
1. Instale o pacote de onde você o baixou: `sudo apt install {{ site.download_file_names.deb-gui }}`.
1. Uma vez que Jamulus precisa do servidor JACK, você tem que instalá-lo também. Nós recomendamos usar `QjackCtl` para configurar o JACK. Você o instala com `sudo apt-get install qjackctl`

Note que se você precisar atualizar o Jamulus para uma nova versão, simplesmente baixe o novo arquivo .deb e reinstale como descrito acima.

Para pacotes de instalação em outras distribuições, dê uma olhada em [Repology](https://repology.org/project/jamulus/versions).
Você também pode querer usar um dos [scripts de instalação](https://github.com/jamulussoftware/installscripts) de terceiros.

## Configurando o hardware

### Configure JACK com QjackCtl

Clientes Jamulus precisam de [JACK](https://jackaudio.org/) para rodar, mas você tem que configurá-lo primeiro. O método recomendado é usando `QjackCtl`.
1. Abra a linha de comando, por exemplo com Ctrl-Alt-T e
1. Execute o comando `qjackctl`. Você vai ver a **Página principal do utilitário Qt JACK**
2. Configure seu equipamento de áudio da seguinte maneira (as exatas configurações do JACK vão depender seu equipamento):

- Configure a **Interface** de áudio usando a que você quiser (pode haver várias na lista)
- Configure o **Taxa de Samples em 48000**
- Configure os **Frames/Período em 128** e Períodos/Buffer em 2 para começar

Restarte o JACK para os novos valores entrarem em efeito.

### Abra o Jamulus

Com o JACK configurado e rodando, abra o Jamulus no seu desktop launcher (ou usando o terminal execute o comando `jamulus`)

Se você tiver problemas com o som interrompendo (em particular erros XRUN que o JACK/QjackCtl reportar) tente usar valores maiores (por exemplo 256 quadros ou 3 períodos). Valores menores (p.e. 64 frames) podem melhorar a performance, mas talvez causar mais problemas de som. Veja a seção [Problemas e solucões](Client-Troubleshooting).


## Instalou tudo?

Dê uma olhada na página

[Configurando o Jamulus](Getting-Started){: .button}
