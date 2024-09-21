# Wiki folder

This folder holds the website documents in English that are also used as the source for all translations. Any documents that do not require translation should be stored in the folder `en-no-translate`.

## Editing/adding content

Edit the (English) .md files as normal. When the changes are completed and ready to be translated, make a pull request to the corresponding branch. When your changes get merged, a GitHub action will run that will update the .po files for all languages, which will now contain the changes ready for translation. If you are correcting typos, after merging your PR you will need to pull in the changes to your branch, open the corresponding .po file for each language and validate that segment (the editor will insert the translation automatically but it needs to be validated), otherwise the final translated document will display that segment in English. Thorough proofreading before merging a PR is advised to avoid having to do this.

If you add a new file to the wiki/en folder, the GH action triggered by the PR will create the new file in .po format for all languages. If you wish to remove a file however, the corresponding .po files must be removed manually from all the language folders in `_translator-files/po/`.

## Generating .md files from the translated .po files

The translated files are created via a GitHub action right before the website is built and deployed, and are not stored in the repo. If you want to set a threshold below which translated .md files do not get created, edit `THRESHOLD` at the top of the `po4a-create-all-targets.sh` script in `_po4a-tools/`and change the number to the percentage you want to set. The default has been set at 80%.

### Using po4a locally to update templates/create translated .md files

In order to run the `po4a-update-templates.sh` and `po4a-create-all-targets.sh` scripts locally, you will need to do so on a Linux distro with `po4a` installed. The minimum version required is 0.63, which may not be available from official repos. An unofficial .deb package is available [here](https://github.com/jamulussoftware/assets/tree/main/po4a). You can also compile it yourself - visit [its GitHub page](https://github.com/mquinson/po4a) and follow the instructions there on compiling po4a.

### Notes:

- If you want something displayed on a new line immediately below one that does not end with a period, the second line must start with a space; e.g. if you want a line break after } or ). For code blocks introduced with ``` or ~~~, these characters must be followed by a line break (enter) and a space at the start of the next line. The closing formatting characters should be on their own line too.
- Headings introduced with # characters must have double spacing before the text body.
