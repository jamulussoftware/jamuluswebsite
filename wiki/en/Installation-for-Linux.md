---
layout: wiki
title: "Installation for Linux"
lang: "en"
permalink: "/wiki/Installation-for-Linux"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation for Linux

Make sure you read the [Getting Started](Getting-Started) page.

{% include infobox_each_os.html %}

**Upgrading?** You may want to [back up your configuration](Software-Manual#backing-up-jamulus) first.

**Installing a server?** Read the [guide for server adminstrators](Running-a-Server) first.

### Debian and Ubuntu

#### Using the official Repository (recommended)

We provide a repository for Debian and Ubuntu based distributions that allows automatic updates alongside your other system updates. To use the repository:

1. Open your Terminal (CTRL+ALT+T should work)
1. *Ubuntu only* - Enable the Ubuntu "universe" repository (you can use the [GUI-based approach](https://askubuntu.com/a/148645) or [CLI-based approach](https://askubuntu.com/a/227788)).
1. Download the repository setup script:\\
```bash
curl https://raw.githubusercontent.com/jamulussoftware/jamulus/main/linux/setup_repo.sh > setup_repo.sh
```
1. Make the script executable:\\
```bash
chmod +x setup_repo.sh
```
1. Run the setup script and install Jamulus:\\
```bash
sudo ./setup_repo.sh && sudo apt install jamulus
```

#### Installing the .deb files manually

1. Download Jamulus for your architecture: [amd64]({{ site.download_root_link }}{{ site.download_file_names.deb-gui }}), [armf]({{ site.download_root_link }}{{ site.download_file_names.deb-gui-armhf }}) or [arm64]({{ site.download_root_link }}{{ site.download_file_names.deb-gui-arm64 }})
1. *Ubuntu only* - Enable the Ubuntu "universe" repository (you can use the [GUI-based approach](https://askubuntu.com/a/148645) or [CLI-based approach](https://askubuntu.com/a/227788)).
1. Update apt by opening a console window (CTRL+ALT+T should work) and type: `sudo apt-get update`
1. Go to where you downloaded the installer and either double-click on it, or use the command line: `sudo apt install ./{{ site.download_file_names.deb-gui }}` (or for Raspberry Pi etc. as above)
1. Once installed, you can delete the file and close any console windows.

**Upgrades:** If you need to upgrade Jamulus to a newer version and install Jamulus manually, just download the new .deb file and re-install as above.

### Other distributions

For installers on other distributions, see their package managers and [Repology](https://repology.org/project/jamulus/versions). If an up-to-date version of Jamulus is not included in your distribution, you can [compile Jamulus from source](https://github.com/jamulussoftware/jamulus/blob/main/COMPILING.md). Note also the contributed [installation scripts](https://github.com/jamulussoftware/installscripts).

## Set up your hardware

If no instance of a JACK server is running, one is normally started automatically.

Jamulus will attach to a running JACK instance by name, using the `JACK_DEFAULT_SERVER` environment variable or `default` if the variable is not set.

If your distribution uses JACK as the sound server, check out [how to configure JACK with QjackCtl](Installation-for-Linux#configure-jack-with-qjackctl).

If your distribution uses PipeWire by default, check out the section on [configuring PipeWire](Installation-for-Linux#configure-pipewire).

### Configure JACK with QjackCtl

Jamulus Clients need [JACK](https://jackaudio.org/) to run, but you need to configure that first. The recommended method is to use `QjackCtl`.

1. Launch QjackCtl. You will see the **Qt JACK Control utility main page**
2. Configure your audio hardware as follows (the exact settings for JACK will depend on what your audio hardware is capable of):

- Set the audio **Interface** to the one you want (there may be several in the list)
- Set the **Sample Rate to 48000**
- Set the **Frames/Period to 128** and Periods/Buffer at 2 at first

Restart JACK for the new settings to take effect.

### Configure PipeWire

The Jamulus Client requires a JACK sound server (native PipeWire support has not yet been implemented).
PipeWire provides a compatibility layer that emulates the JACK server, so when you launch the Jamulus Client, PîpeWire automatically exposes itself to it as a JACK server.
However, you need to set your audio interface to the "pro-audio" profile and define PipeWire's "rate" and "quantum" parameters beforehand.
To do so, follow these steps:
1. open `pavucontrol` (the audio mixer) and choose the "pro-audio" profile in the configuration tab,
2. In a terminal use the two following commands:
```bash
pw-metadata -n settings 0 clock.force-rate 48000
pw-metadata -n settings 0 clock.force-quantum 128
```

### Start Jamulus

With JACK or PipeWire running and configured, launch Jamulus.

If you get problems with sound breaking up (in particular XRUN errors reported by JACK/QjackCtl) try setting bigger values (e.g. 256 frames or 3 periods). Lower ones (e.g. 64 frames) could bring better performance but maybe more sound problems. See the [troubleshooting page](Client-Troubleshooting) otherwise.

## All installed?

Take a look at the

[Getting Started page](Getting-Started){: .button}
