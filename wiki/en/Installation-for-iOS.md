---
layout: wiki
title: "Installation for iOS"
lang: "en"
permalink: "/wiki/Installation-for-iOS"
---

{% include breadcrumb.html root="Using Jamulus" branch1="Getting Started" branch1-url="Getting-Started" %}


# Installation for iOS

Make sure you've already read the [Getting Started](Getting-Started) page.

## Things to note about iOS

If you have don't own a PC, we suggest you to buy a [Raspberry Pi](https://www.raspberrypi.org/){: target="_blank" rel="noopener noreferrer" } which is an inexpensive and small device that performs very well with Jamulus. iOS support is just a proof of concept and needs certain skills.

* To install Jamulus on your iOS device, you need a (free or paid) Apple Developer account and preferably a computer.
* If you don't pay for an Apple developer account, Jamulus will only run for at most 7 days before you need to re-install it.
* Jamulus on iOS works quite well on new devices if everything is set up correctly. However, we strongly recommend you use an audio interface and an USB-Ethernet adapter. To connect these to your iOS device, you should use something like the [Lightning to USB Camera Adapter](https://www.apple.com/uk/shop/product/MD821ZM/A/lightning-to-usb-camera-adapter) and a (powered) USB-hub.


## Install for iOS (for experienced users only)
**Note**: We provide an unsigned .ipa file which you need to sign and then install on your device. If you are not Jailbroken (and have AppSync installed), you might need additional software to install Jamulus. There are multiple ways to do that, but this guide only explains the most standard approach. Please note that we assume you already have a (free) Apple developer account. If you don't have one, create an Apple ID and [Sign up for a developer account](https://developer.apple.com/membercenter). We recommend to create one without two factor authentification and unrelated to your potential personal account. You will need to enter the password in non-Apple software.

1. [Download Jamulus (.ipa) on a PC/Mac]({{ site.download_root_link }}{{ site.download_file_names.ios }}){:.button}
2. Sign the .ipa file (e.g. via Xcode or some other **trusted** app. We won't give recommendations here)
3. Once signed and installed; on your iOS device open Settings, navigate to General>Profiles (or VPN and Device Management). Tap on the developer account corresponding to your account and trust the account.
4. Open Jamulus from your home-screen
5. After 7 days you will need to re-sign Jamulus if you are using a free developer account. Re-do everything from Step 4.

If you own a Mac and have Xcode installed, compiling Jamulus from source might be another, more native option. Please have a look at the [compilation instructions for iOS](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md#ios).


## Feedback and development

iOS support isn't mature yet and far from ready to be published on the AppStore. Feel free to help out:
Just head over to the [Jamulus GitHub repo](https://github.com/jamulussoftware/jamulus/).

Please also read the [APPLEAPPSTORE.LICENCE.WAIVER](https://github.com/jamulussoftware/jamulus/blob/master/APPLEAPPSTORE.LICENCE.WAIVER) concerning Jamulus being published via the Apple AppStore.

***

## All installed?

Jamulus has been installed and can be used now. You can now take a look at the

[Jamulus Onboarding page](Getting-Started){: .button}
