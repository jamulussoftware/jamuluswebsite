
[comment]: # (This is an include file for use in multiple documents)

# Quality of Service (QoS)

Jamulus utiliza DSCP/CS4 oportunísticamente para ocuparse de "bufferbloat" (valor DSCP/CS4 de 128 (o 0x80). Esto es compatible con IPv4 y IPv6. Se pueden establecer otros valores utilizando la opción -Q, por ejemplo -Q [0..255] (donde 0 deshabilita QoS). Si quieres explorar el efecto de configuraciones no predeterminadas, ver RFC4594. Sin embargo, la mayoría de las personas no tendrán necesidad de hacer esto.

## Utilizar Quality of Service en Windows

La configuración de QoS en Jamulus (incluyendo la predeterminada) no tiene efecto en Windows porque el sistema operativo la ignora. Para habilitarlo, debes seguir estas instrucciones. También ten en cuenta que quizá tengas que repetir este procedimiento cada vez que se actualiza Jamulus.

En el campo de Búsqueda al lado del menú de Arranque teclea: Editor de Directivas de Grupo Local (enter)<br>En la nueva ventana, (clic) en el icono del menú para mostrar el tercer panel de Acción<br>Mirando el primer panel del Editor de Directivas de Grupo Local<br>&nbsp;Local Computer Policy<br>&nbsp;&nbsp;Computer Configuration<br>&nbsp;&nbsp;&nbsp;Windows Settings<br>&nbsp;&nbsp;&nbsp;&nbsp;Policy-based QoS (clic)<br>Mirando el tercer panel (Acción) del Editor de Directivas de Grupo Local<br>&nbsp;Policy-based QoS<br>&nbsp;&nbsp;Más Acciones<br>&nbsp;&nbsp;&nbsp;Crear nueva Directiva (clic)<br>&nbsp;&nbsp;&nbsp;&nbsp;Nombre Directiva: Jamulus<br>&nbsp;&nbsp;&nbsp;&nbsp;Especificar valor DSCP: 32<br>&nbsp;&nbsp;&nbsp;&nbsp;Siguiente<br>&nbsp;&nbsp;&nbsp;&nbsp;Esta directiva QoS se aplica solo a las aplicaciones con el nombre Jamulus.exe<br>&nbsp;&nbsp;&nbsp;&nbsp;Siguiente<br>&nbsp;&nbsp;&nbsp;&nbsp;Siguiente<br>&nbsp;&nbsp;&nbsp;&nbsp;UDP<br>&nbsp;&nbsp;&nbsp;&nbsp;Terminar<br>

(Nota: la directiva para Jamulus en el panel central puede editarse)

