
[comment]: # (This is an include file for use in multiple documents)

- `-h` o `--help` Mostrar texto de ayuda
- `-i` o `--inifile` Establece la ubicación del archivo de inicialización
  (sustituye al predeterminado. En macOS simplemente proporciona un nombre
  de archivo, ya que los archivos de configuración sólo se pueden leer desde
  `/Usuarios/<nombreUsuario>/Biblioteca/Contenedores/app.jamulussoftware.Jamulus/Data/`.
  Para el servidor sustituye `app.jamulussoftware.Jamulus` por
  `app.jamulussoftware.JamulusServer`. Activa la opción "Mostrar carpeta de
  biblioteca" en "Mostrar opciones de previsualización" en Finder para ver
  esta carpeta.)
- `-n` o `--nogui` Desactivar interfaz gráfica (para usar en modo headless)
- `-p` o `--port` Establece el número de puerto UDP local. Por defecto es
  22124
- `--jsonrpcport` Activa el servidor JSON-RPC API para controlar la
  aplicación, establecer número de puerto TCP (EXPERIMENTAL, las APIs pueden
  cambiar; solo accesible desde localhost). Por favor ver [la documentación
  sobre JSON-RPC
  API](https://github.com/jamulussoftware/jamulus/blob/main/docs/JSON-RPC.md).
- `--jsonrpcsecretfile` Necesario cuando se utiliza
  `--jsonrpcport`. Establece una ruta a un archivo de texto que contiene la
  cadena de caracteres de autenticación para acceder a la API de JSON-RPC.
- `--jsonrpcbindip` La dirección IP al que debe vincularse el servidor
  JSON-RPC. (opcional, por defecto 127.0.0.1)
- `-Q` o `--qos` Establece el DS Field byte de la calidad de servicio
  (QoS). Por defecto 128 (DSCP/CS4). QoS es ignorado por Windows. Para
  habilitarlo, [ver esta página](QOS-Windows)
- `-t` o `--notranslation` Deshabilitar traducciones de la interfaz gráfica
- `-6` o `--enableipv6` Habilita direccionado IPv6 (IPv4 siempre está
  habilitado)
- `-v` o `--version` Mostrar información de la versión y salir
