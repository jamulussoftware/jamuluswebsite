<!-- NOTE: This must apply to both Client and Server, and all operating systems -->

Una vez instalado y en marcha, quizá quieras guardar una copia de tu
configuración. Tener una copia de seguridad siempre es buena idea, y los
archivos de configuración no son compatibles con versiones previas de
Jamulus. Por lo que si quieres volver a la versión anterior, deberás
reestablecer la configuración que tenías.

Para encontrar el archivo de configuración en Windows, teclea `%APPDATA%` en
la barra de búsqueda y busca una carpeta llamada `Jamulus`. Habrá uno o más
archivos `.ini` en esta carpeta. Ahora haz una copia de seguridad de la
configuración de Jamulus.

Para las demás plataformas, ejecuta lo siguiente desde la línea de comandos
para encontrar dónde están y copia los archivos a otra ubicación:

`find ~ -name Jamulus.ini -ls`

Si has utilizado el parámetro `--inifile` para guaradar un archivo .ini en
una ubicación diferente, no te olvides de también hacer una copia de
seguridad de estos archivos.  **Puntos a tener en cuenta**

* No realices copias de seguridad ni restaures archivos de configuración
  mientras se ejecuta Jamulus.
* No se recomienda editar los archivos de configuración manualmente (no
  están diseñados para eso).
* Puedes revertir toda la configuración a los valores predeterminados
  simplemente eliminando el archivo de configuración (tras cerrar Jamulus).
