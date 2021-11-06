Once installed and running, you may want to keep a copy of your settings. This may also be useful if you install a new version and want to go back to a the previous version (settings files are not backwardly compatible). Or you might want to revert all settings to their defaults by just deleting the settings file after closing Jamulus. 

**Note:** It is not recommended to edit settings files by hand. You can save and load different settings files using [Load/Save Mixer Channels Setup](Software-Manual#file--loadsave-mixer-channels-setup) if you want to maintain different setups and store these wherever you want.

To find your settings file on Windows, look in the `%APPDATA%` folder. There will be one or more `.ini` files in a folder there named `Jamulus`.

For all other platforms, run the following from the command line to find where they live: 

`find ~ -name Jamulus.ini -ls`
