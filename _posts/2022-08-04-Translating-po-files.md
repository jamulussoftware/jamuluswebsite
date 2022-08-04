---
layout: post
title: "Translating .po files"
lang: "en"
author: "ignotus"
heading: "Guide to using .po file editors"
---

This is a guide on how to use two freely available editors to translate .po files for the Jamulus project:

- [OmegaT](https://omegat.org/) (cross-platform): the most complete and advanced, but also somewhat more complex.
- [Poedit](https://github.com/vslavik/poedit) (cross-platform): Intuitive to use, though a couple of things need to be configured before starting to translate with it for the first time.

<!--more-->

The simplest to use is **Poedit**. Once downloaded and installed, to get up and going:
    - Go to Edit > Preferences
    - In the "General" tab, uncheck "Automatically compile MO file when saving"
    - In the "Advanced" tab, uncheck "Wrap at:". Otherwise it will wrap all the strings at a given column and we don't want that, as changes in text wrapping cause a flood of edits to be added to pull requests. Each editor seems to have its own criterion for text wrapping, so it has been disabled by the po4a scripts running on the repository.
    - For an overall view of all files and their status, go to File > Catalogs Manager. Click on New > Browse and  enter the path to your .po files. Click on "OK". You should now see a list of all the .po files and their current translation status. Double-click on any one of them to open it in a new window.
    - Qt Linguist or Lokalize can also be used, but they are strongly discouraged as they do not offer the option to disable text wrapping (Lokalize does, but it still messes it up).

**OmegaT** is a more powerful editor, but has a slightly more complicated set up:

1. Install [OmegaT](https://omegat.org/)

1. Launch it and go to Project > New. Specify a name for your project (e.g. "jamulus") and a location for it to be stored in. A new window will open with the project parameters. Select the source and target file languages at the top and leave the rest at defaults. Click OK.

1. Navigate to the folder containing the .po files for your language (in `path/to/_translator-files/po/xx`) and copy/paste it into the "source" directory inside the Project folder (`path/to/jamulus/source/`) that was just created.

1. In OmegaT, click on Project > Properties. The same "Edit Project" window will open again. Under "Options", disable “Enable Sentence-level Segmenting”. Go down and under "File Locations" make sure the "Source Files Folder" points to where you copied your .po files _to_. At the bottom, for "Translated Files Folder", set it to the directory where you copied the .po files _from_: `path/to/_translator-files/po/`. If prompted to, reload the project.

    * In Options > Editor, enable "Allow translation to be equal to source".

    * OmegaT can give you an overview of the current state of translation of all files so you don't have to go through each one checking what needs to be done. Click on Tools > Statistics and a window will open with all the stats for the .po files. Look at the second column, "Remaining Segments", to see how many segments remain to be translated for each file. To jump to a specific file, click on Project > Project Files and click on any of them.


1. By default, the view of the source and target segments may be all in black text on a white background with no highlighting. A handy way to easily view and distinguish between translated and untranslated segments is to click on View > Mark Translated Segments and View > Display Source Segments. Source segments will be highlighted in green and translated segments in yellow.

1. Double-click on a segment to start translating it. Pressing "Enter" will save the translated segment and move to the next. By default the source segment is inserted if there is no translation. This is sometimes useful when there is a lot of formatting and you can just erase/insert your translation. You can change this behaviour in Options > Editor to leave the segment empty.
1. When you have finished your translations, go to Project > Create Translated Documents. Your translated files will be created in `path/to/_translator-files/po/`, replacing the ones there.


 From now on, when there are new files to translate or they have been updated on GitHub, it's simply a matter of copy/pasting the latest version of the .po file folder for your language to the "source" folder, as in point 3 above, replacing it.

#### Note on translation memories

A translation memory (TM) is a file that stores source text strings with their translations - a database that grows in size as translations of different files are added to it. They enable you to retrieve previously-translated strings in different documents. For example, you've translated a string in document A, and the same string appears in a new document you're working on, document B. A TM enables you to retrieve that translated string, avoiding the need to re-translate it.

OmegaT uses TMs by default and there is no need to create one. Whenever you add a new document to a project, it will scan that project's TM for any 100% or fuzzy (partial) matches and will display them for you. In Poedit, to make sure the TM is enabled, go to Edit > Preferences > TM tab. Check "Use translation memory" if it is not already. If there are any previously-translated .po files, to ensure the TM is up to date, click on "Manage..." > "Import translation Files...". Navigate to where the previously-translated .po files are (`_translator-files/po/LANG/`), select them all, and click on "Open". It will extract all the source/translation pairs and add them to the TM. From now on, when translating new documents, any matches will be displayed on the right.
