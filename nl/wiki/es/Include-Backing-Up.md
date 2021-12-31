<!-- NOTE: This must apply to both client and server, and all operating systems -->

Una vez instalado y en marcha, quizá quieras guardar una copia de tu configuración. Tener una copia de seguridad siempre es buena idea, y los archivos de configuración no son compatibles con versiones previas de Jamulus. Por lo que si quieres volver a la versión anterior, deberás reestablecer la configuración que tenías.

Para encontrar el archivo de configuración en Windows, mira en la carpeta `%APPDATA%`. Habrá uno o más archivos `.ini` en una carpeta llamada `Jamulus`.

Para las demás plataformas, ejecuta lo siguiente desde la línea de comandos para encontrar su ubicación:

`find ~ -name Jamulus.ini -ls`

**Puntos a tener en cuenta**

* No realices copias de seguridad ni restaures archivos de configuración mientras se ejecuta Jamulus.
* No se recomienda editar los archivos de configuración a mano (no están diseñados para eso).
* Puedes revertir toda la configuración a los valores predeterminados simplemente eliminando el archivo de configuración (tras cerrar Jamulus).
