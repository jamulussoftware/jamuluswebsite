# Translation:

-   Navigate to `translator-files/po/YOUR-LANGUAGE/`. Translate the content of the .po files in your editor of choice (QtLinguist, Lokalize, OmegaT...).
    - A number of files in this folder do not need to be translated. These are:
        - Administration.po
        - Central-Servers.po
        - Compiling.po
        - Linux-Install-Script.po
        - Multiple-Audio-Interfaces.po
        - Onboarding.po
        - Server-Rpi.po
        - Software-Synth.po
        - Sound-Devices.po
        - index.po
-   Set the lang: parameter to your language code at the beginning of the file (it, fr, de, etc.) and make sure the permalink: parameter (e.g. /wiki/Client-Troubleshooting) stays the same.
-   Submit a Pull Request with the translated .po files. **DO NOT** edit any .md files in the /wiki/ folder.

## Translate a new language

If you wish to translate to a language for which there is no folder in `translator-files/po/`, please open an issue and request that it be created.

### Suggested editors:

- OmegaT (cross-platform): the most complete and advanced, but also somewhat more complex. A guide is included in this folder.
- QtLinguist (cross-platform): if you've done app translations you should feel comfortable with this. However, you have to open files one by one and until you do, you can't know the state of the translation.
- Lokalize (Linux): GUI similar to QtLinguist but more complete.
    - This application can give you an overview of the translation progress of all files. Click on `Project > Create software translation project`. A window will open asking where to store the `index` file - choose anywhere you want. Now another window will open. In "Root folder" point it to the directory where all the .po files for your language are. Click on "Apply" and "OK". Now you will be shown an overview of the state of all the translations. Double-click on one to go to that file. If you are comfortable with this editor and use Linux, it's a very recommendable option if you don't want to get into the complexities of OmegaT.
- Virtaal (cross-platform)
- Gtranslator (Linux)

For short edits or single file translations, QtLinguist, Lokalize or a similar editor might be simpler to use. For working through all the files, OmegaT will be much more suitable (see guide).
