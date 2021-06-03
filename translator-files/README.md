# Translation:

-   Navigate to `l10n/po/YOUR-LANGUAGE/`. Translate the content of the .po files in your editor of choice (QtLinguist, Lokalize, OmegaT...).
    - A number of files in this folder no not need to be translated. These are:
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

If you wish to translate to a language for which there is no folder in `translator-files/l10n/po/`, please open an issue and request that it be created.

### Suggested editors:

- OmegaT (cross-platform): the most complete and advanced, but also somewhat more complex. A guide is included in this folder.
- QtLinguist (cross-platform): if you've done app translations you should feel comfortable with this. However, you have to open files one by one and until you do, you can't know the state of the translation. This is true of all these editors except for OmegaT.
- Lokalize (Linux): similar to QtLinguist.
- Virtaal (cross-platform)
- Gtranslator (Linux)

For short edits or single file translations, QtLinguist, Lokalize or a similar editor might be simpler to use. For working through all the files, OmegaT will be much more suitable (see guide).
