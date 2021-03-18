---
layout: wiki
title: "Contribuciones"
lang: "es"
permalink: "/wiki/Contribution"
---

# Contribuir al Proyecto Jamulus

## Software Jamulus
* Si quieres contribuir código o quieres pedir la implementación de una función, escribe tu idea en [abre un 'issue' en GitHub (en inglés)](https://github.com/jamulussoftware/jamulus/issues/) (preferiblemente) o [publica tu idea en el foro](hhttps://github.com/jamulussoftware/jamulus/discussions) si no tienes cuenta de GitHub. Esto nos permite debatir los cambio, por ejemplo, antes de hacer un "pull request" (asegúrate de leer el [manifiesto de Volker para contribuciones en GitHub (en inglés)](https://github.com/jamulussoftware/jamulus/discussions/915) y el [archivo de CONTRIBUTING](https://github.com/jamulussoftware/jamulus/blob/master/CONTRIBUTING.md))

Ver el [repositorio de Jamulus en GitHub](https://github.com/jamulussoftware/jamulus) para más información.

## Página web de Jamulus

* Si observas algún error de contenido o tipográfico, o algo que está desfasado (en cualquier idioma), puedes [abrir un 'issue' en GitHub](https://github.com/jamulussoftware/jamuluswebsite/issues).

* Si crees que falta o se puede mejorar alguna documentación o información, abre un post en [el foro de discusión](https://github.com/jamulussoftware/jamulus/discussions) para que se pueda discutir primero.

Echa un vistazo al [archivo de CONTRIBUTING](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md) para la página web y al [repositorio GitHub de la página web](https://github.com/jamulussoftware/jamuluswebsite) para más información.

### No estoy familiarizad@ con GitHub. Qué necesito saber?

**¡El siguiente contenido solo es para la documentación en jamulus.io, no para el software de Jamulus!**

Si no te manejas con 'Pull Requests', 'commits', etc. simplemente abre un 'issue'. Nos ocuparemos de los cambios. Si quieres realizar los cambios por tu cuenta y abrir un 'Pull Request', sigue estas instrucciones:

1. Haz un 'fork' del repositorio (hay un botón para ello arriba a la derecha en la página de GitHub.
2. Decide a qué 'branch' tienes que hacer el 'commit' de tus cambios (en resumen: todo lo que necesita traducción tiene que ir al 'branch' de `changes`, errores tipográficos a `release`; se puede encontrar más información en el [archivo de CONTRIBUTING](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md)). Crea un nuevo 'branch' del 'branch' actualizado que has elegido.
3. Realiza tus cambios
4. Si has hecho los cambios offline, haz un 'push' a tu repositorio
5. Envía tu 'Pull Request', escribe una breve descripción de tus cambios y enlaza al 'issue' que abriste
6. Espera a la revisión y el 'merge'

**Consejo (para git)** *No hagas un 'merge' de tu trabajo* a tu 'branch' local de `changes`; solo manténlo sincronizado con el repositorio remoto de la página web de Jamulus. Crea un nuevo 'branch' para los cambios que propones.
Si el 'branch' de `changes` se modifica antes de enviar tu 'Pull Request', mantén el 'branch' local de `changes` sincronizado con el oficial, haz un 'merge' del 'branch' local de `changes` al que estás trabajando, resuelve los conflictos, haz un 'push' con tus cambios y crea el 'Pull Request'.
