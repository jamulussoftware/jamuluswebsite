---
layout: post
title: "Linux Bash Installation Script"
heading: "Bash Installation Script"
author: "niebert"
lang: "en"
---

Thanks to [niebert](https://github.com/niebert), if you plan to install Jamulus on many Linux machines, you can try this script.
<!--more-->

The following example was tested on Linux Mint and combines all the commands to install Jamulus on Linux into one script (currently for Ubuntu/Linux Mint).

## How it works

To incorporate the different commands for different Linux distributions, variables define the distribution and the release for which the installation script should be performed. The following focuses on Ubuntu with release 18.04 as example. So the suggested script name for the release is e.g. `install4ubuntu18_4.sh`. The script commands are generic so that the installation could also be modified so that they work on other Linux distributions.

### Installation dependent on Linux Distribution
The following script calls different installation commands depending on the Linux distribution.
The variable `DISTRO` defines which commands are executed. Set the variable depending on the Linux distribution you are using.
* `DISTRO="Ubuntu"` for a Ubuntu or Linux Mint
* `DISTRO="Debian"` for a Debian or Raspbian Linux
* `DISTRO="Fedora"` for a Fedora Linux
Furthermore if the installation is dependent of the release the variable `LINVERSION` is introduced but is currently not used. In the Ubuntu `if` statement there is an example how version depending installation calls can be performed.
```bash
if [ "$LINVERSION"  = "18.4" ]
then
    echo "Perform Installation Specifics for $DISTRO Version $DISTRO"
fi  
```
The variable `LINVERSION` is currently not used in the following script but it is just a demo how to use the version specific installation commands.

### Adaptation of the Installation Script
If you want to create an installation script for Debian just copy the script `install4ubuntu18_4.sh` to `install4debian10_6.sh` and modify the distro variables to
```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Debian"
LINVERSION="10.6"
```
After that, test the installation on Debian and modify the commands so that the installation script works on Debian. You can share working scripts, if you like. **Edit by Jamulus-Website maintainers:** You should contact [niebert](https://github.com/niebert) if you want to share scripts.

### The Installation Script
Copy the following installation script into a file and save it to the filename `install4ubuntu18_4.sh`. After saving the file e.g. in your `Download` directory change to the directory and call the following script with `sh install4ubuntu18_4.sh`.
```bash
#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Ubuntu"
LINVERSION="18.04"

# Get Jamulus Release Name with "curl" and "grep"  
R=`curl -s https://api.github.com/repos/corrados/jamulus/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
echo "Jamulus Installation Script for $DISTRO $LINVERSION"
echo "Release: $R"
INSTALLJAMULUS="no"
while true; do
    read -p "Do you wish to install Jamulus on $DISTRO $LINVERSION? (y/n) " yn
    case $yn in
        [Yy]* )
           echo "Start Installation $DISTRO $LINVERSION"
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
           echo "Cancelled Jamulus Installation on $DISTRO $LINVERSION"
           exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# echo "Check Variable: $INSTALLJAMULUS"

if [ "$INSTALLJAMULUS" = "yes" ]; then     
	echo "(5) Install Build Essentials for $DISTRO"

	if [ "$DISTRO"  = "Ubuntu" ]
	then  
		      echo "Installation for $DISTRO"
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
        echo "Compilation DONE"
        cd ..
        echo "(6) Delete the Source Files after Installation"
        rm -R "jamulus-$R"

else

	echo "Installation cancelled"

fi

```  


## Possible Improvements of the Installation Script for Jamulus
The script can ask in the very beginning for which Linux distribution the installation script should be called.
This can be tested with the command `lsb_release`

The `lsb_release` command returns the distribution specific information about a Linux distro.
With a `grep` command with regular expression the variable `DISTRO` and `LINVERSION`.
E.g. the Ubuntu based systems return with the command the following information.
```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 11.04
Release:        11.04
Codename:       natty
```

The challenge is, that `lsb_release` command must be available on Linux system. On CentOS/Fedora based systems `lsb_release` command is only available, if the `lsb` core packages are installed. So the automated Linux version detected might no work.

So reading the `DISTRO` and `LINVERION` with the `read` command might be the better distribution dependent improvement than an automated setting with `lsb_release`.
