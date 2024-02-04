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

The Jamulus client needs to connect to a running [JACK](https://jackaudio.org/) server in order to start. You need to find out which is the low-latency sound server of your distribution.
- If your distribution uses [JACK](https://jackaudio.org/), check out how to [configure JACK with QjackCtl](Installation-for-Linux#configure-jack-with-qjackctl).
- If your distribution uses PipeWire, check out how to [configure PipeWire](Installation-for-Linux#configure-pipewire).

### Configure JACK with QjackCtl

To run a [JACK](https://jackaudio.org/) server, the recommended method is to use `QjackCtl`.

1. Launch QjackCtl. You will see the **Qt JACK Control utility main page**.
2. Configure your audio hardware as follows (except where noted):

- Set the audio **Interface** to the one you want (there may be several in the list - choose the correct one as this cannot be changed without stopping Jamulus and JACK).
- Set the **Sample Rate to 48000**.
- Set the **Frames/Period to 128** and **Periods/Buffer at 2** at first.

Restart JACK for the new settings to take effect and continue from the [Start Jamulus](Installation-for-Linux#start-jamulus) section below.

### Configure PipeWire

PipeWire provides its own JACK server. When you launch the Jamulus Client, PipeWire automatically runs a JACK server. However, there are a few parameters to adjust.
You need to set your audio interface to the "pro-audio" profile and define PipeWire's "rate" and "quantum" parameters beforehand.
More informations about the configuration in the [PipeWire's wiki](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Config-JACK#jack-server).

Follow these steps to set up your system:
1. Open `pavucontrol` (the audio mixer) and choose the "pro-audio" profile for your audio interface in the configuration tab.
2. In a terminal use the two following commands to force PipeWire's rate and quantum:
```bash
pw-metadata -n settings 0 clock.force-rate 48000
pw-metadata -n settings 0 clock.force-quantum 128
```
After this, continue from the [Start Jamulus](Installation-for-Linux#start-jamulus) section below.

### Start Jamulus

With JACK or PipeWire configured, launch Jamulus.

If you have any problems setting up, first check [the troubleshooting page](Client-Troubleshooting).

## All installed?

Take a look at the

[Getting Started page](Getting-Started){: .button}
