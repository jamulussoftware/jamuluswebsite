
[comment]: # (This is an include file for use in multiple documents)

- `-h` o `--help`           Mostrar texto de ayuda         
- `-i` o `--inifile`        Establece ubicación de archivo de inicialización (anula la predeterminada)
- `-n` o `--nogui`          Desactivar interfaz gráfica (para usar en modo "headless")                      
- `-p` o `--port`           Establece el número de puerto UDP local. Por defecto es 22124
- `--jsonrpcport`            Activa el servidor JSON-RPC API para controlar la aplicación, establecer número de puerto TCP (EXPERIMENTAL, las APIs pueden cambiar; solo accesible desde localhost). Por favor ver [la documentación sobre JSON-RPC API](https://github.com/jamulussoftware/jamulus/blob/master/docs/JSON-RPC.md).
- `--jsonrpcsecretfile`      Necesario cuando se utiliza `--jsonrpcport`. Establece una ruta a un archivo de texto que contiene la cadena de caracteres de autenticación para acceder a la API de JSON-RPC.
- `-Q` o `--qos`            Establece el DS Field byte de la calidad de servicio (QoS). Por defecto 128 (DSCP/CS4). QoS es ignorado por Windows. Para habilitarlo, [ver esta página](QOS-Windows)
- `-t` o `--notranslation`  Deshabilitar traducciones de la interfaz gráfica
- `-6` o `--enableipv6`     Habilita direccionado IPv6 (IPv4 siempre está habilitado)
- `-v` o `--version`        Mostrar información de la versión y salir
