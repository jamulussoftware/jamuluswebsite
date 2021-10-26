# Website docs translation:

All the files for translators to work on are contained in a single directory: `_translator-files/po/YOUR-LANGUAGE/`. **Please do not edit any other files**. When adding a new language, all the necessary files will be automatically created and modified.

Proceed as follows:

- Fork the jamuluswebsite repository and create a new branch based on `next-release`.
- Navigate to `_translator-files/po/LANG/`. Translate the content of the .po files in your editor of choice (Poedit, OmegaT...).
- Change the `lang: en` parameter in the files containing it at the beginning of the file to your language code (it, fr, de, etc.) and make sure the `permalink: [parameter]` (e.g. /wiki/Client-Troubleshooting) stays the same.
- At times there are links to other docs or specific paragraphs in other parts of the website: `[translate this](don't translate this#translate-this-but-don't-use-capitals)`. Make sure the last part uses the exact same words as the relevant paragraph title.
- Some documents contain links to screenshots. Make sure you change the language code in them to your own. You can create screenshots for your language in `/assets/img/[LANG]-screenshots` - just replace them (if they exist already in English) or create them using the English ones as a guide.
- Submit a Pull Request to the `next-release` branch with the translated .po files.
- Pull requests for translations should have a title which looks like this: `Update [lang] web translation for [release number]`

#### Please note: if your language has no translated documents, please start with the following:

- 1-index.po
- general.po
- navigation.po 
- footertext.po
- Getting-Started.po
- Installation pages (Win, Linux, macOS)
- Etc.

## Adding a new language

Open an issue ([here](https://github.com/jamulussoftware/jamuluswebsite/issues)) with the language code of the new language you want to add in square brackets. It is important that you use the following format for the language code:

- Lower case if it is a two-character code (e.g. "Add Basque [eu]")
- Lower case + underscore + upper case for regional variations (e.g. "Add Brazilian Portuguese [pt_BR]").

You will be notified on the issue thread you opened when the language files have been created. You can then fork the repository and work on the translations.

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
