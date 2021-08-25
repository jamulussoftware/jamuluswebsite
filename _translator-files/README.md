# Website docs translation:

-   Navigate to `_translator-files/po/YOUR-LANGUAGE/`. Translate the content of the .po files in your editor of choice (Poedit, OmegaT...).
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

- [OmegaT](https://omegat.org/) (cross-platform): the most complete and advanced, but also somewhat more complex. A guide is included in this folder.
- [Poedit](https://github.com/vslavik/poedit) (cross-platform): Intuitive to use, though a couple of things need to be configured before starting to translate with it for the first time:
    - Go to Edit > Preferences
    - In the "General" tab, uncheck "Automatically compile MO file when saving"
    - In the "Advanced" tab, uncheck "Wrap at:". Otherwise it will wrap all the strings at a given column and we don't want that, as changes in text wrapping cause a flood of edits to be added to pull requests. Each editor seems to have its own criterion for text wrapping, so it has been disabled by the po4a scripts running on the repository.
    For an overall view of all files and their status, go to File > Catalogs Manager. Click on New > Browse and  enter the path to your .po files. Click on "OK". You should now see a list of all the .po files and their current translation status. Double-click on any one of them to open it in a new window.

- Qt Linguist or Lokalize can also be used, but they are strongly discouraged as they do not offer the option to disable text wrapping (Lokalize does, but it still messes it up).

If you use a different editor to those listed, please make sure you can disable text wrapping (but still preserve the wrapping of the metadata at the top - this is important), and tell us about it so we can add it to the list.

For short edits or single file translations, Poedit or a similar editor might be simpler to use. For working through all the files, OmegaT will be more suitable (see guide).
