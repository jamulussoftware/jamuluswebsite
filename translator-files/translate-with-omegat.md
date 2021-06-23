# Guide for translating .po files using OmegaT

If you're just going to edit a single .po file, or translate a short one, it may be easier to simply use an editor like QtLinguist, Virtaal, Lokalize, Gtranslator, etc. which allow you to edit the .po file directly, in-place, without the need to copy/paste it anywhere, and without really needing to learn how to use these tools - they are very intuitive to use. However, if you intend to work through all the website documents, these applications have cluttered GUIs that will make translating a large volume of text quite uncomfortable. In addition, they can't give you (except for Lokalize) a complete overview of all the files as a single project, meaning that if you want to check the state of translations, you have to open them one by one, which is time-consuming and inefficient. 

OmegaT lets you group all files into a single project and can give you information on all of them in a single place. Its interface is also much more convenient to work with. However, as a more advanced tool, it requires some setting up. Once the initial setup has been done though, any future edits/translations are just a matter of copy/pasting a folder and firing up OmegaT.

## Here's how to set it up:

1. Install [OmegaT](https://omegat.org/)

1. Launch it and go to `Project > New`. Specify a name for your project (e.g. "jamulus") and a location for it to be stored in. A new window will open with the project parameters. Select the source and target file languages at the top and leave the rest at defaults. Click OK.

1. Navigate to the folder containing the .po files for your language (in `path/to/translator-files/po/xx`) and copy/paste it into the "source" directory inside the Project folder (`path/to/jamulus/source/`) that was just created.

1. In OmegaT, click on `Project > Properties`. The same "Edit Project" window will open again. Under "Options", disable “Enable Sentence-level Segmenting”. Go down and under "File Locations" make sure the "Source Files Folder" points to where you copied your .po files _to_. At the bottom, for "Translated Files Folder", set it to the directory where you copied the .po files _from_: `path/to/translator-files/po/`. If prompted to, reload the project.

    * OmegaT can give you an overview of the current state of translation of all files so you don't have to go through each one checking what needs to be done. Click on `Tools > Statistics` and a window will open with all the stats for the .po files. Look at the second column, "Remaining Segments", to see how many segments remain to be translated for each file. To jump to a specific file, click on `Project > Project Files` and click on any of them.


1. By default, the view of the source and target segments may be all in black text on a white background with no highlighting. A handy way to easily view and distinguish between translated and untranslated segments is to click on `View > Mark Translated Segments` and `View > Display Source Segments`. Source segments will be highlighted in green and translated segments in yellow.

1. Double-click on a segment to start translating it. Pressing `Enter` will save the translated segment and move to the next. By default the source segment is inserted if there is no translation. This is sometimes useful when there is a lot of formatting and you can just erase/insert your translation. You can change this behaviour in `Options > Editor` to leave the segment empty.
1. When you have finished your translations, go to `Project > Create Translated Documents`. Your translated files will be created in `path/to/translator-files/po/`, replacing the ones there.


 From now on, when there are new files to translate or they have been updated on GitHub, it's simply a matter of copy/pasting the latest version of the .po file folder for your language to the "source" folder, as in point 3 above.
