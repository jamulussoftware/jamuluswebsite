# wiki folder

This folder holds all translated wiki pages sorted by language (en=English, es=Spanish, etc.). These files should not be edited except for the EN files.

## Editing/adding content

Edit the .md files as normal. When the changes are completed and ready to be translated, run the `po4a-update-templates.sh` script in the root directory. This will update the .pot templates and .po files for all languages, which will now contain the changes ready for translation.

If you add a new file to the wiki/en folder, running the same script will create the new file in .po format for all languages. If you wish to remove a file however, the corresponding .po and .pot files must be removed manually from all the language folders in `translator-files/l10n/po/`. The .pot files are contained in the `translator-files/l10n/templates/` folder (BTW, these should never be edited). There is no need to remove the .md version of the file as it will be removed the next time the `po4a-create-all-targets.sh` script is run. If you want to set a threshold below which translated .md files do not get created, edit line 70 in the `po4a-create-all-targets.sh` script file in the root directory and change the number to the percentage you want to set.

## Generating .md files from the translated .po files

When translated.po files have been submitted and you wish to generate the translated .md files to be deployed on the website, run the `po4a-create-all-targets.sh` script, which will generate the target .md files for all languages in `wiki/`.

### Using po4a locally to update templates/create translated .md files

In order to run the `po4a-update-templates.sh` and `po4a-create-all-targets.sh` scripts locally, you will need to do so on a Linux distro with `po4a` installed. It is available from the official repositories. You can also compile the latest version from [its GitHub page](https://github.com/mquinson/po4a).

### Notes:

- If you want something on a new line immediately below one that does not end with a period, the second line must start with a space.
- Any change to text in EN will cause that paragraph to later appear in .po files as untranslated, so mere typo corrections will lead to this happening. This means that EN documents should be thoroughly proofread before running the script to update templates.

    ##### Behaviour:
    - OmegaT: Segment is left empty but auto inserts fuzzy match (80% or more) when segment is active.
    - Lokalize: Inserts fuzzy match but doesn't validate it - requires user validation.
    - QtLinguist: same as Lokalize (indicated with yellow question mark).

- Any corrections made to languages other than EN **must** be done to their .po files. Directly editing .md files won't break anything but any changes done that way will be lost the next time `po4a-create-all-targets.sh` is run.
- QtLinguist works. People familiar with it from doing app translations might prefer to use it. Poedit creates .mo files that we don't have any need for, so it's off the list of suggested editors.
