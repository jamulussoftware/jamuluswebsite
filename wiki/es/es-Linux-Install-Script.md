---
layout: wiki
title: "Consejos y Trucos para Jamulus - Bash Script de Instalación en Linux"
lang: "es"
permalink: "/wiki/Linux-Client-Install-Script"
---


# Bash Script de Linux para Descargar y Compilar

Si tienes intención de instalar Jamulus en muchas máquinas Linux, quizá te interese este script.

El siguiente ejemplo ha sido probado en Linux Mint y combina todos los comandos en un único script para Ubuntu/Linux Mint. Para incorporar los diferentes comandos para distribuciones distintas de Linux, hay variables que definen la distribución y la versión para la cual hay que ejecutar el script. El ejemplo se centra en Ubuntu con la versión 18.04 como ejemplo. Así que el nombre sugerido para el script sería `install4ubuntu18_4.sh`. Los comandos del script son genéricos para que la instalación pueda ser modificada para funcionar con otras distribuciones de Linux.

### Instalación dependiente de la Distribución de Linux
El siguiente script puede ejecutar diferentes comandos de instalación dependiendo de la distribución de Linux. La variable `DISTRO` define qué comandos son ejecutados. Establece la variable dependiendo de la distribusión de Linux que estés utilizando.
* `DISTRO="Ubuntu` para Ubuntu o Linux Mint
* `DISTRO="Debian` para Debian o Raspian Linux
* `DISTRO="Fedora` para Fedora Linux
   Además, si la instalación depende de la versión, entonces la variable `LINVERSION` se introduce pero actualmente no se usa. En la declaración`if` de Ubuntu hay un ejemplo de cómo se pueden ejecutar comandos de instalación dependientes de la versión.
```bash
if [ "$LINVERSION"  = "18.4" ]
then
    echo "Perform Installation Specifics for $DISTRO Version $DISTRO"
fi  
```
La variable `LINVERSION` no se utiliza en el script siguiente pero es solo una demostración de cómo utilizar comandos de instalación dependientes de la versión.

### Adaptación del Script de Instalación
Si quieres crear un script de instalación para Debian, simplemente copia el script `install4ubuntu18_4.sh` a `install4debian10_6.sh` y modifica las variables de distribución a
```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Debian"
LINVERSION="10.6"
```
Tras esto prueba la instalación en Debian y modifica los comandos para que el script de instalación funcione en Debian. Por favor comparte scripts de instalación funcionales en esta Wiki. El gestor de este repositorio puede añadir una carpeta `/install_scripts` para scripts de instalación funcionales. Crea un "pull request" para nuevos scripts de instalación o crea un "issue" con la petición, para pedir que se añada un script de instalación documentado y testado a este repositorio.

### El Script de Instalación
Copia el siguiente script de instalación a un archivo y guárdalo con el nombre `install4ubuntu18_4.sh`. Tras guardar el archivo por ejemplo en tu directorio de `Descargas`, cambia a ese directorio y ejecuta el siguiente script con `sh install4ubuntu18_4.sh`.
```bash
#!/bin/sh
# configura DISTRO como "Ubuntu", "Debian" o "Fedora"
DISTRO="Ubuntu"
LINVERSION="18.04"

# Obtén el nombre de la versión de Jamulus con "curl" y "grep"  
R=`curl -s https://api.github.com/repos/corrados/jamulus/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
echo "Script de instalación de Jamulus para $DISTRO $LINVERSION"
echo "Release: $R"
INSTALLJAMULUS="no"
while true; do
    read -p "Desea instalar Jamulus en $DISTRO $LINVERSION? (y/n) " yn
    case $yn in
        [Yy]* )
           echo "Comienza la instalación $DISTRO $LINVERSION"
           echo "(1) Fetch Release $R from GitHub"
           wget https://github.com/corrados/jamulus/archive/$R.tar.gz
           echo "(2) Extract Source Code for Jamulus Release $R from GitHub"
           tar -xvf $R.tar.gz
           echo "(3) Delete ${R}.tar.gz from GitHub"
           rm $R.tar.gz
           echo "(4) Update Repository"
           sudo apt-get update
           INSTALLJAMULUS="yes"
           break;;
        [Nn]* )
           echo "Instalación de Jamulus cancelada en $DISTRO $LINVERSION"
           exit;;
        * ) echo "Por favor responda sí o no.";;
    esac
done

# echo "Check Variable: $INSTALLJAMULUS"
	
if [ "$INSTALLJAMULUS" = "yes" ]; then     
	echo "(5) Install Build Essentials for $DISTRO"
	
	if [ "$DISTRO"  = "Ubuntu" ]
	then  
		      echo "Instalación para $DISTRO"
		      sudo apt-get install cmake qmake gcc g++
		      sudo apt-get install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
		      sudo apt-get install qjackctl
                      if [ "$LINVERSION"  = "18.4" ]
                      then
                          echo "Perform Installation Specifics for $DISTRO Version $DISTRO"
                      fi  
	
  	elif [ "$DISTRO" = "Debian" ]
	then    
			  sudo apt-get install build-essential qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
			  sudo apt-get install qjackctl
	elif [ "$DISTRO" = "Fedora" ]
	then    
			  sudo dnf install qt5-qtdeclarative-devel jack-audio-connection-kit-dbus jack-audio-connection-kit-devel
			  sudo dnf install qjackctl
	fi

	echo "(6) Compile Jamulus $R"
	echo "Change to Directory jamulus-$R"
	cd "jamulus-$R"
	# ls
	qmake Jamulus.pro
	make clean
        make
        sudo make install
        echo "Compilación COMPLETA"
        cd ..
        echo "(6) Elimina los Archivos Fuente tras la Inatalación"
        rm -R "jamulus-$R"

else

	echo "Instalación cancelada"

fi

```


## Posibles mejoras para el script de instalación de Jamulus
El script puede preguntar al principio qué distribución de Linux es aplicable.
Esto se puede comprobar con el comando `lsb_release`

Con el comando `lsb_release` la terminal nos da información sobre la distribución de Linux.
Con un comando `grep` con expresión regular, la variable `DISTRO` y `LINVERSION`.
Por ejemplo, en sistemas basados en Ubuntu se nos devuelve la siguiente información:
```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 11.04
Release:        11.04
Codename:       natty
```

El reto es que el comando `lsb_release` debe estar disponible en el sistema de Linux. En sistemas basados en CentOS/Fedora, el comando `lsb_release` solo está disponible si están instalados los paquetes `lsb`. Por lo que la detección automatizada de la versión de Linux puede no funcionar.

Así que leer `DISTRO` y `LINVERION` con el comando `read` podría ser una mejora para la instalación dependiente de la distribución en lugar de una configuración automatizada con `lsb_release`.

