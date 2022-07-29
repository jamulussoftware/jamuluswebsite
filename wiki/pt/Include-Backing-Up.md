<!-- NOTE: This must apply to both Client and Server, and all operating systems -->

Once installed and running, you may want to keep a copy of your settings. Having a backup is always a good idea, and settings files are not backwardly compatible between versions of Jamulus. So if you want to go back to the previous version, you will need to restore the settings you had.

To find your settings file on Windows, type `%APPDATA%` into the search bar and look for a folder named `Jamulus`. There will be one or more `.ini` files in this folder. Now back up Jamulus' settings.

For all other platforms, run the following from the command line to find where they live and copy the files to another location:

`find ~ -name Jamulus.ini -ls`

If you used the `--inifile` parameter to save an inifile to a different location, don't forget to also backup these files. **Points to note**

* Do not back up or restore settings files when Jamulus is running.
* It is not recommended to manually edit settings files (they're not designed for that).
* You can revert all settings to their defaults by just deleting the settings file (after closing Jamulus).
