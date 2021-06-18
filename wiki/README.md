# Wiki folder

This folder holds all translated wiki pages sorted by language (en=English, es=Spanish, etc.). These files should not be edited except for the EN files.

## Editing/adding content

Edit the .md files as normal. When the changes are completed and ready to be translated, run the `po4a-update-templates.sh` script in the root directory. This will update the .pot templates and .po files for all languages, which will now contain the changes ready for translation. If you are correcting typos, after running the script you will need to open the corresponding .po file for each language and validate that segment (the editor will insert the translation automatically but it needs to be validated), otherwise the final translated document will display that segment in English. Throrough proofreading before running the script is advised to avoid having to do this.

If you add a new file to the wiki/en folder, running the same script will create the new file in .po format for all languages. If you wish to remove a file however, the corresponding .po files must be removed manually from all the language folders in `translator-files/po/`. There is no need to remove the .md version of the file as it will be removed the next time the `po4a-create-all-targets.sh` script is run.

## Generating .md files from the translated .po files

When translated.po files have been submitted and you wish to generate the translated .md files, run the `po4a-create-all-targets.sh` script, which will generate the target .md files for all languages in `wiki/`. If you want to set a threshold below which translated .md files do not get created, edit `THRESHOLD` at the top of the script and change the number to the percentage you want to set. The default has been set at 80%.

### Using po4a locally to update templates/create translated .md files

In order to run the `po4a-update-templates.sh` and `po4a-create-all-targets.sh` scripts locally, you will need to do so on a Linux distro with `po4a` installed. It is available from the official repositories. You can also compile the latest version from [its GitHub page](https://github.com/mquinson/po4a).

### Notes:

- If you want something displayed on a new line immediately below one that does not end with a period, the second line must start with a space; e.g. if you want a line break after } or ). For code blocks introduced with ``` or ~~~, these characters must be followed by a line break (enter) and a space at the start of the next line. The closing formatting characters should be on their own line too.
- Headings introduced with # must have double spacing before the text body.
- Any corrections made to languages other than EN **must** be done to their .po files. Directly editing .md files won't break anything but any changes done that way will be lost the next time `po4a-create-all-targets.sh` is run.