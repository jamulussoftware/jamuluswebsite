---
layout: wiki
title: "po4a Setup Explained"
lang: "en"
permalink: "/contribute/po4a-Setup-Explained"
---

# po4a Setup Explained

This document is a description of the po4a-based processes that are behind the website translation and documentation maintenance workflow. It mainly focuses on the scripts automating these processes, describing the function of each one of them in an attempt to provide an understanding of how they all fit together.

First though, a brief overview.

## Contributor activities

In broad terms, there are three types of activity that take place on the website repository:

- Editing/adding/updating translatable documentation in English, the source language that all translations are based on.
- Translating these documents into each respective language.
- Editing other content in the repository that is not necessarily the documentation itself (scripts, config files, images, etc.).

So here the focus is on the first two points, as they are what the po4a setup seeks to address, namely:

1 - Whenever a change happens to a document in English (contained in `wiki/en/`), or a new document is added, translators need to know _where_ these changes have taken place, preferably without having to actually scan the documents in English or trawl through PRs. To address this, all the documentation is converted into .po files, which reflect the original documents' current state, divided into paragraphs (segments) for their translation using an appropriate editor. This removes the need for having to scan documents or PRs for changes and enables translation via an interface that keeps track of untranslated segments, fuzzy matches, etc. Thus, translators only have to focus on the .po files for their respective languages, which will reflect the current status of the source file and the translation at all times.

2 - When translators submit their translated .po files via a PR and when the PR is merged, these files are automatically processed to generate the target translated files in their respective format. Neither maintainers nor contributors have to worry about processing .po files to obtain the target translated files.

In order to make these automated processes happen, there are a series of scripts that can be divided into two categories: the **po4a scripts**, which perform the processing of the source files and .po files; and the **GitHub actions scripts**, which call the appropriate po4a scripts depending on what event they have been triggered by; e.g. a change to a source file, a PR with translated .po files, etc.

## The po4a scripts

These are contained in the `_po4a-tools/` folder and there are 5 of them:

**po4a-update-templates.sh**:
When a source .md file in English is edited, this script will update its .po file counterparts in every language, adding/removing/changing the relevant strings as applicable. If a new file has been added, it will create the corresponding new .po file. Similarly, if a new language is added (also automated - more on this later), it will populate the new language folder with all the appropriate .po files. In short, this script will update/create all the relevant .po files in every language folder contained in `_translator-files/po/`.

**po4a-create-all-targets.sh**:
This script takes all the .po files in `_translator-files/po/*LANG*/` and uses them to generate the target translated .md files ready to be deployed. These target files are not stored in the repository, but are created via a GitHub action (which calls this script) just prior to deploying the website or zipping and uploading it (more on this later). This script also triggers the next one before exiting (`po4a-stats.sh`).

**po4a-stats.sh**:
This creates a file that provides information on the translation status of all .po files, for each language. It shows how many strings have been translated, how many remain to be translated and how many fuzzy matches (partially translated strings) there are in each file. This file is created as `contribute/en/Statistics.md` and like the target files, it is not stored in the repository.

**po4a-cache.sh**:
This simply contains a series of commands that are common to all the GitHub actions workflow files and is called when the relevant step is triggered.

**po4a-add-language.sh**:
Triggered when a new language is added. First it creates a folder for the new language in `_translator-files/po/` and calls `po4a-update-templates.sh`to populate it with .po files. It also adds the new language code to the array in `/_config.yml` and creates a screenshots folder for it in `assets/img/`. Thus, when a new language is added, translators need only concern themselves with the files in their /po folder and don't have to worry about editing anything else other than creating screenshots in their language.

## The GitHub Actions scripts

These are contained in `.github/workflows/` and among other things, they automate the execution of the appropriate po4a scripts depending on the event that triggers them.

The website repository operates with two branches - 'release', which is the source for the live website, and 'next-release', which is where changes to the documentation happen in between releases of the Jamulus application. These different functions are relevant when it comes to how the GitHub actions scripts behave, explained as follows:

**main.yml**:
This script is triggered by 'push' events to the 'release' branch only. This is a summary of what it does:

1- Checks whether po4a and its dependencies have been previously cached. If they have, it retrieves the cache, and if not, it performs the installation and creates the cache so it is available in future - this step is shared by all three GH actions scripts and is what is in the `po4a-cache.sh` script. The po4a installation is necessary to run the po4a scripts later in the workflow. A po4a .deb file is stored in the 'assets' jamulus repository as a recent version is required that is not available from any official repositories.

2- dorny/paths-filter@v2 checks whether the commits being pushed contain any changes to English files in `wiki/en/`. If so, `po4a-update-templates.sh` is run to update/add the .po files for all languages.

3- If the previous step is 'true', this means the .po files that have just been updated/added need to be pushed to the repository, which is what this step does. If 'false', this step is skipped as there is nothing new to push.

4- The `po4a-create-all-targets.sh` script is run to create the translated files. They are not pushed, but they need to be created to be deployed to the website. The 'Statistics.md' file is also created.

5- The website is built and deployed.

6- A separate job, 'sync-branch', waits for the previous job to finish and then syncs 'release' in its current state to 'next-release'.

**add-lang.yml**:
This script is for adding a new language. It is triggered when an issue is opened containing a language code in either [xx] or [xx_XX] format in the title (e.g. "Add Portuguese [pt]" or "Add Brazilian Portuguese [pt_BR]") _and then_ the "new language" label is added. Summary:

1- Checks whether the label added is "new language". If it is not, the whole workflow is skipped.

2- Checks the format of the language code in the title and only accepts the format mentioned above. If it doesn't match, an error message is displayed and the script exits.

3- Checks if the language already exists. If it does, it displays an error informing that the language already exists, and exits.

4- Checks for the po4a cache as above.

5- Calls the `po4a-add-language.sh` script.

6- Pushes the changes to the `next-release` branch.

7- Adds a message to the issue opened for the new language, informing the contributor that the new files have been created.

8- Creates the target files with `po4a-create-all-targets.sh` and the 'Statistics' file.

9- Builds the site but doesn't deploy nor zip/upload it - this and the previous step are just a check to verify that it builds properly.

**jekyll.yml**:
This is the more complex script. A distinction between 'pull request' and 'push' events will be made to better understand the flow of steps for each case:

- **Pull Request events**. Applicable to both 'release' and 'next-release'; the steps are the same for both assuming the same PR content:

    1- dorny/paths-filter@v2 checks if English source files have changed/been added (but doesn't determine whether the script exits or not - see below).

    2- Checks po4a cache (as above).

    3- If the above filter is 'true', update/add .po files with `po4a-update-templates.sh`. If not, skip.

    4- The output from the previous step is never pushed (even if it is 'true') when the trigger is a PR, as this would mean pushing the changes to the contributor's repository, which in turn would require them to enable GitHub actions beforehand. As this cannot be assumed to always be the case, it is left until their PR is merged and then the output is pushed to the Jamulus repository.

    5- The translated files are created with `po4a-create-all-targets.sh`.

    6- Site is built, zipped and uploaded as an artifact. This is so the contributor can download, unzip twice and view the site locally (e.g. with a [local webserver](https://pythonbasics.org/webserver/)), to check if everything works as it should and to view translations as they would appear on the website/the overall appearance of the website if other content has been edited (config files, images, etc.) before the PR is merged. Only happens if the trigger was a PR.

- **Push events**. Only applicable to 'next-release':

    1- The 'Paths' filter (not the same filter as the one above) checks if English source files have changed/been added. If not, the workflow doesn't run at all. As the site is **not** built/zipped/uploaded when merging (it would be identical to the artifact uploaded with the PR event), the target translations don't need to be created either, and therefore no po4a scripts need to be run.

    2- If the above 'Paths' is 'true', the subsequent, separate dorny/paths-filter@v2 filter is also true (it checks for the same changes).

    3- Po4a cache check.

    4- As the above filters are 'true' (otherwise the script wouldn't even run), the .po files are updated/added with `po4a-update-templates.sh`.

    5- The updated/added .po files are pushed to the 'next-release' branch.

    6- In this case, the translated target files are **not** created, as no zipped/uploaded site will be created and therefore they are not needed.

    7- Site build/zip/upload step is skipped.
    
Further information about the translation process itself can be found in `_translator-files/README.md`, and about editing English .md files in `wiki/README.md`. More general information about the website processes is contained in the `README` file in the root directory.
