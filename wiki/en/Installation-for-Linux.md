---
layout: wiki
title: "Installation for Linux"
lang: "en"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation for Linux

Make sure you read the [Getting Started](Getting-Started) page.

Upgrading? You may want to [back up your configuration](Software-Manual#backing-up-jamulus) first.

### Debian and Ubuntu

We provide two equivalent `.deb` files for the most common architectures. Please download the appropriate one:

**For Intel/AMD based machines (amd64):**

[Download Jamulus (.deb, amd64)]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }}){:.button}

**For ARM based machines (e.g. Raspberry Pi, armhf):**

[Download Jamulus (.deb, armhf)]({{ site.download_root_link }}{{ site.download_file_names.deb-gui-armhf }}){:.button}

After you downloaded the correct file:

1. Update apt by opening a console window (CTRL+ALT+T should work) and type: `sudo apt-get update`
1. Go to where you downloaded the installer and either double-click on it, or use the command line: `sudo apt install ./{{ site.download_file_names.deb-gui }}` or for armhf: `sudo apt install ./{{ site.download_file_names.deb-gui-armhf }}`
1. Once installed, you can delete the file and close any console windows.

Note that if you need to upgrade Jamulus to a newer version, just download the new .deb file and re-install as above.

### Other distributions

For installers on other distributions, see their package managers and [Repology](https://repology.org/project/jamulus/versions). If an up-to-date version of Jamulus is not included in your distribution, you can [compile Jamulus from source](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md). Note also the contributed [installation scripts](https://github.com/jamulussoftware/installscripts).

## Set up your hardware

### Configure JACK with QjackCtl

Jamulus Clients need [JACK](https://jackaudio.org/) to run, but you need to configure that first. The recommended method is to use `QjackCtl`.
1. Launch QjackCtl. You will see the **Qt JACK Control utility main page**
2. Configure your audio hardware as follows (the exact settings for JACK will depend on what your audio hardware is capable of):

- Set the audio **Interface** to the one you want (there may be several in the list)
- Set the **Sample Rate to 48000**
- Set the **Frames/Period to 128** and Periods/Buffer at 2 at first

Restart JACK for the new settings to take effect

### Start Jamulus

With JACK running and configured, launch Jamulus.

If you get problems with sound breaking up (in particular XRUN errors reported by JACK/QjackCtl) try setting bigger values (e.g. 256 frames or 3 periods). Lower ones (e.g. 64 frames) could bring better performance but maybe more sound problems. See the [troubleshooting page](Client-Troubleshooting) otherwise.

## All installed?

Take a look at the

[Jamulus setup page](Getting-Started){: .button}
