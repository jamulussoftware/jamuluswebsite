# Website docs translation:

-   Navigate to `_translator-files/po/YOUR-LANGUAGE/`. Translate the content of the .po files in your editor of choice (QtLinguist, Lokalize, OmegaT...).
-   Set the lang: parameter to your language code at the beginning of the file (it, fr, de, etc.) and make sure the permalink: parameter (e.g. /wiki/Client-Troubleshooting) stays the same.
-   Submit a Pull Request with the translated .po files. **DO NOT** edit any .md files in the /wiki/ folder.

#### Please note: if your language has no translated documents, please start with the following sections of the website:

Home page
Setup/Getting Started
Installation pages (Win, Linux, macOS)

## Adding a new language

Open an issue ([here](https://github.com/jamulussoftware/jamuluswebsite/issues)) with the language code of the new language you want to add in square brackets (e.g. "Add Basque [eu]"). It is important that you use the following format for the language code:

- Lower case if it is a two-character code; e.g. [en].
- Lower case + underscore + upper case for regional variations; e.g. [en_US].

You will be notified on the issue thread you opened when the language files have been created. You can then fork the repository and work on the translations.
Please also take into account the following:

### Points to note

- Make sure to add the language to the \_config.yml file (in the languages array).  At a minimum, the main includes for the wiki (see \_includes/wiki/) have to be translated.

- Each page on the site has a .md or .html language suffixed version.  Some of the website content is in \_includes/wiki/[langCode]. These files must be translated in order not to break the site.

- The homepage (https://jamulus.io/) is located in the repo root and named 1-[langCode]-index.html. If it does not exist for your language, copy/rename it for your language and translate its contents.

- Pull requests for translations should have a title which looks like this: `[Tag (Translation)][language code (e.g. en)] {short description of your changes}`

- The navigation and general site-wide strings (see the \_data/ folder) and the homepage (see the 1-index.html file in the root of this repo) should also be translated.

#### Suggested po file editors:

- OmegaT (cross-platform): the most complete and advanced, but also somewhat more complex. A guide is included in this folder.
- QtLinguist (cross-platform): if you've done app translations you should feel comfortable with this. However, you have to open files one by one and until you do, you can't know the state of the translation.
- Lokalize (Linux): GUI similar to QtLinguist but more complete.
    - This application can give you an overview of the translation progress of all files. Click on `Project > Create software translation project`. A window will open asking where to store the `index` file - choose anywhere you want. Now another window will open. In "Root folder" point it to the directory where all the .po files for your language are. Click on "Apply" and "OK". Now you will be shown an overview of the state of all the translations. Double-click on one to go to that file. If you are comfortable with this editor and use Linux, it's a very recommendable option if you don't want to get into the complexities of OmegaT.
- Virtaal (cross-platform)
- Gtranslator (Linux)

For short edits or single file translations, QtLinguist, Lokalize or a similar editor might be simpler to use. For working through all the files, OmegaT will be much more suitable (see guide).
