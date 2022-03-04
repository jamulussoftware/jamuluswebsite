---
layout: post
title: "Alternative install methods for Jamulus"
lang: "en"
heading: "Alternative, not-officially supported install methods"
---

This guide page lists alternative install methods for Jamulus. Feel free to add another method here and link it or [edit and improve the page in other ways](https://github.com/jamulussoftware/jamuluswebsite/edit/release/_posts/2022-03-04-Alternative-Install-Methods.md). Please note: These links are not officially supported and might be outdated.

<!--more-->

## General notes
Jamulus (mostly the GUI-Client, not the headless server) is included in the main repositories of bigger distributions. You can have a look at [the forum post by corrados](https://github.com/jamulussoftware/jamulus/discussions/914) and view [Repology](https://repology.org/project/jamulus/versions) to check if Jamulus is in your distro's repo. Your repo might have an outdated version of Jamulus.

## Windows

* Jamulus is on WinGet. You can install the Client via `winget install jamulus`.

## Linux

* Jamulus is available in the [Debian repository](https://packages.debian.org/sid/sound/jamulus). It might be outdated, especially in Debian Stable. To install the client, just use apt: `sudo apt install jamulus`
* Jamulus is available as [Flatpak on Flathub](https://flathub.org/apps/details/io.jamulus.Jamulus). You might need to set up Pipewire in order to get Jamulus to run.
* Tormod Volden provides a [PPA for Ubuntu (and probably Debian) on launchpad.net](https://launchpad.net/~tormodvolden/+archive/ubuntu/jam/+packages)

## macOS
* Jamulus is [available on Homebrew](https://formulae.brew.sh/cask/jamulus). You can install the Client via `brew install --cask jamulus`

## Android
There is a [request to include Jamulus for Android in F-Droid](https://gitlab.com/fdroid/rfp/-/issues/2011). However, compiling Qt is a bigger task, which is why it is probably not yet available.

## iOS
Since distributing on iOS is difficult, there is no known distribution available. It might be possible to put the app on TestFlight.

## Docker
grundic created a [Docker image](https://github.com/grundic/jamulus-docker) which might or might not be outdated.
