---
layout: wiki
title: "Installation for macOS"
lang: "en"
permalink: "/wiki/Installation-for-Macintosh"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}

# Installation for macOS

Make sure you've already read the [Getting Started](Getting-Started) page.

1. [Download Jamulus]({{ site.download_root_link }}{{ site.download_file_names.mac }}){: .button}\\
**Mirror 2:** [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)
1. **Install Jamulus**: Open the downloaded `.dmg` file, agree to the license, *drag and drop* the two icons you see in the window (Jamulus client and server) into your *Applications folder*. After that, you can close this window.
1. **Run Jamulus**. Now you should be able to use Jamulus just like any other application. If you see a message which tells you that Jamulus can't be opened because the developer can't be verified, read on and have a look at the following section.

_You can remove the folder in the Downloads directory containing the `.dmg` and eject the "Jamulus" drive on your desktop. They are no longer needed._

***

## "Jamulus" can't be opened because the developer cannot be verified

![Jamulus blocked by Gatekeeper](https://user-images.githubusercontent.com/20726856/99886769-67256d80-2c3f-11eb-91e9-9cb2b6f80f95.png)

The first time you try to double-click Jamulus to run it, you will probably see a message saying it cannot be opened. We don't code-sign Jamulus yet (it's quite expensive).

To open Jamulus
1. Navigate to the Applications folder via Finder
1. Double-click on Jamulus and wait for the mentioned message
1. Close this message by clicking on "Cancel"
1. Now control-click (or right-click) on Jamulus, and select "Open" from the top of the menu.

You will then get a slightly different version of the same message, which allows you to click "Open" and go ahead with running it. You will not be shown this warning again - just double-click it to run after that.
For further information about this warning see [this Apple Support Page](https://support.apple.com/en-gb/guide/mac-help/mh40616/mac).

## All installed?
Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Onboarding){: .button}
