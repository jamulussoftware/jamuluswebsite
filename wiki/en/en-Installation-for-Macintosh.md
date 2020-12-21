---
layout: wiki
title: "Installation for macOS"
lang: "en"
permalink: "/wiki/Installation-for-Macintosh"
---

# Installation for macOS

Make sure you've already read the [Getting Started](Getting-Started) page.

1. [Download Jamulus](https://sourceforge.net/projects/llcon/files/latest/download){: target="_blank" rel="noopener noreferrer" .button}
1. **Open the downloaded `.dmg` file**. Agree to the license. You will now see two icons (Jamulus client and server).
1. **Drag and drop both icons into your Applications folder** to install Jamulus.
1. **Run Jamulus**. Now you should be able to use Jamulus just like any other application. If you see a message which tells you that Jamulus can't be opened because the developer can't be verified, read on and have a look at the following section.

_You can remove the folder in the Downloads directory containing the `.dmg` and eject the "Jamulus" drive on your desktop. They are no longer needed._

You can also [compile your own binary](Compiling#macos) if you feel so inclined.

## "Jamulus" can't be opened because the developer cannot be verified

![Jamulus blocked by Gatekeeper](https://user-images.githubusercontent.com/20726856/99886769-67256d80-2c3f-11eb-91e9-9cb2b6f80f95.png)

The first time you try to double-click Jamulus to run it, you will probably see a message saying it cannot be opened. We don't code-sign Jamulus yet (it's quite expensive).

To open Jamulus
1. Navigate to the Applications folder via Finder
1. Double-click on Jamulus and wait for the mentioned message
1. Close this message by clicking on "Cancel"
1. Now control-click (or right-click) on Jamulus, and select "Open" from the top of the menu.

You will then get a slightly different version of the same message, which allows you to click "Open" and go ahead with running it. You will not be shown this warning again - just double-click it to run after that.
For further information about this warning see [this Apple Support Page](https://support.apple.com/en-gb/guide/mac-help/mh40616/mac){: target="_blank" rel="noopener noreferrer"}.

## All installed?
Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Onboarding){: .button}
