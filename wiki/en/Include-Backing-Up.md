Once installed and running, you may want to keep a copy of your settings. Having a backup is always a good idea, and settings files are not backwardly compatible between versions of Jamulus. So if you want to go back to the previous version, you will need to restore the settings you had. 

To find your settings file on Windows, look in the `%APPDATA%` folder. There will be one or more `.ini` files in a folder there named `Jamulus`.

For all other platforms, run the following from the command line to find where they live: 

`find ~ -name Jamulus.ini -ls`

**Points to note**

* Do not back up or restore settings files when Jamulus is running.
* It is not recommended to edit settings files by hand (they're not designed for that). 
* You can save and load different mixer settings using [Load/Save Mixer Channels Setup](Software-Manual#file--loadsave-mixer-channels-setup) and store those files wherever you want.
* You can revert all settings to their defaults by just deleting the settings file (after closing Jamulus). 
