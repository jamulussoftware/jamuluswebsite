# Website docs translation:

The recommended way to translate the website documentation is by using [Weblate](https://hosted.weblate.org/projects/jamulus/). If you don't already have one, we recommend that you create a GitHub account and log in to Weblate using that. If you are comfortable using GitHub and .po file editors, and still want to contribute your translation via a pull request, the files for each language are contained in: `_translator-files/po/LANGUAGE/`. You can find a guide on .po file editors [here](https://jamulus.io/kb/2022/08/04/Translating-po-files.html). Please make your PR against the `next-release` branch.

All the Jamulus project files (application and website) are listed together on Weblate. The files ("components") corresponding to the application itself are "Jamulus app" and "Windows Installer". All the rest correspond to the website.

**Some tips regarding translations:**

- Change the `lang: en` parameter in the files containing it at the beginning of the file to your language code (it, fr, de, etc.). Remember that if you are translating a regional variation (e.g. `pt_BR`), that's what you must use. Also make sure the `permalink: [parameter]` (e.g. /wiki/Client-Troubleshooting) stays the same.
- At times there are links to other docs: `[translate this](don't translate this)`, or specific paragraphs in other parts of the website: `[translate this](don't translate this#translate-this-but-dont-use-capitals-nor-apostrophes)`. Make sure the last part after the hashtag uses the exact same words as the relevant paragraph title you use in your translation.
- Some documents contain links to screenshots. Make sure you change the language code in them to your own. You can create screenshots for your language in `/assets/img/[LANG]-screenshots` - note that we do not store these image locally but instead use include files calling an external URL to them. Please see README.md on the website repository for further information. Also note that screenshots that do not need to be localised are symlinked to the English version from each `[LANG]-screenshots` directory.
- There are documents containing portions of text that do not require translation, e.g. scripts, links, etc. In these cases, please do not leave the translation field empty, but copy the source text into the translation field.
- If editing the po file directly, rather than using Weblate, please make sure your pull requests for translations should have a title which looks like this: `Update [lang] web translation for [release number]`.

**Please note: if your language has no translated documents, please start with the following:**

- Startpage
- General strings
- Navigation
- Getting-Started
- Installation pages (Win, Linux, macOS)
- Etc.

## Adding a new language

Open an issue ([here](https://github.com/jamulussoftware/jamuluswebsite/issues)) with the language code of the new language you want to add in square brackets. It is important that you use the following format for the language code:

- Lower case if it is a two-character code (e.g. "Add Basque [eu]")
- Lower case + underscore + upper case for regional variations (e.g. "Add Brazilian Portuguese [pt_BR]").

You will be notified on the issue thread you opened when the language files have been created. You can then work on the translations.
