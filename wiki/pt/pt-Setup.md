---
layout: wiki
title: "Setup"
lang: "pt"
permalink: "/wiki/Setup"
---

# Setup - começando com Jamulus

Para obter o melhor de Jamulus, você precisa no mínimo de:

1. **Uma conexão de internet a cabo** (não wi-fi - veja o [FAQ](/wiki/FAQ))
1. **Fones de ouvido com cabo** (nem Bluetooth e nem Auto-falantes - veja o [FAQ](/wiki/FAQ))
1. **Uma interface de áudio ou placa de som razoavelmente boa e/ou microfone** ([veja essa lista](/kb/2021/01/05/Jamulus-Sound-Devices.html) para exemplos)


Se tiver alguma dúvida, dê uma olhada na página de [Discussões](https://github.com/jamulussoftware/jamulus/discussions)

## Instalação
Para fazer Jamulus funcionar com o seu hardware, siga as seguintes instruções de acordo com sua plataforma:

* [Windows](/wiki/Installation-for-Windows)
* [macOS](/wiki/Installation-for-Macintosh)
* [Linux](/wiki/Installation-for-Linux)

E feche todos os outros programas por ora. É melhor começar de maneira simples.


## Jamulus - Janela principal

Quando você abre o Jamulus, você vê a seguinte janela parecida com essa:

<figure>
  <img src="{{site.url}}/assets/img/pt-screenshots/main-screen-default.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Janela principal antes de se conectar com um servidor</figcaption>
</figure>


## Configurando um perfil

Primeiro, deixe os outros saberem quem você é. Clique em “Ver” (barra superior) > “Meu perfil…” Então você vai ver isso:
<figure>
  <img src="{{site.url}}/assets/img/en-screenshots/profile-window.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Deixe as pessoas saberem quem você é</figcaption>
</figure>


Fill in at least “Alias/Name” and close the window.
Preencha pelo menos o campo “Apelido/Nome” e feche a janela.

## Conectando a um servidor e testando o som

**Antes de começar a tocar com outros, é recomendável se conectar a um servidor vazio para testar o seu setup**, para ter certeza que você está ouvindo o sinal vindo direto do servidor (se possível) e não o seu próprio som.

Antes de se conectar a um servidor, você **não** deve conseguir ouvir a si mesmo. A “Regra de ouro” do Jamulus é ouvir seu próprio som através do programa (e não direto de você mesmo). Isso possibilita tocar em tempo com os outros ([see the FAQ](/wiki/FAQ)).

Agora use o botão “Conectar” na janela principal do Jamulus para se juntar a um servidor. A seguinte janela vai se abrir:

<figure>
  <img src="{{site.url}}/assets/img/en-screenshots/connection-setup-window.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Conectar a um servidor</figcaption>
</figure>

A coisa mais importante sobre servidores é o “ping”. Quanto maior o número, mais difícil será tocar em tempo com outros. Em regra você deverá escolher um servidor cujo ping seja menor que 15ms se possível.

Uma vez conectado a um servidor, tenha certeza de que você se ouve bem e corrija o volume de entrada ou qualquer outro problema. E claro, não esqueça de obedecer [a regra de ouro](/wiki/Client-Troubleshooting).

## Tocando pela primeira vez

Com o sistema configurado, você está pronto para começar. Quando você se conectar a um servidor (escolha um gênero da lista se quiser), os controles que você vê à direita é a sua mesa de som pessoal. Tudo o que você alterar ali vai mudar o que você ouve, mas isso não afeta os outros. Se você mover um botão para baixo, esse canal vai ficar mais fraco, se você movê-lo para cima, o canal ficará mais forte para você.

<figure>
  <img src="{{site.url}}/assets/img/en-screenshots/main-screen-medium.png" loading="lazy" alt="Screenshot" style="width:100%; float:none;">
  <figcaption>Janela principal quando você está conectado</figcaption>
</figure>

Se você não quer que outros ouçam o seu áudio, clique no botão “Silenciar-me”. Isso vai fazer com que seu áudio não seja mais transmitido para outras pessoas, mas eles não vão poder ver que você fez isso. No entanto, se você vir um ícone “mudo” em cima de um controle, isso significa que eles não podem ouvi-lo porque eles silenciaram o seu canal no mix deles.

Preste atenção que você pode usar a função Chat a qualquer momento em que você estiver conectado para mandar mensages para outros participantes. A mensage de boas-vindas também pode informá-lo sobre as regras de uso.

Mais informações sobre como usar Jamulus você encontra no [Manual do software](/wiki/Software-Manual).

## Solução de Problemas

Você está tendo problemas com o áudio? Não consegue ver os servidores, ou algum outro problema? Dá uma olhada em [Troubleshooting page](/wiki/Client-Troubleshooting), ou fique livre para postar sua pergunta nas [Discussões](https://github.com/jamulussoftware/jamulus/discussions).
