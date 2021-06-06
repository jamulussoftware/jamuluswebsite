# Jamulus Website

This is the content repository for [jamulus.io](https://jamulus.io). Text appearing in the Jamulus software application itself is part of the [main code repository](https://github.com/jamulussoftware/jamulus). See also the [general overview](https://jamulus.io/wiki/Contribution) to getting involved. 


## Want to help translate?

To make updates or translations for jamulus.io you will need a GitHub account and be familiar with GitHub in general. If you want to get more involved, you’ll need to be familiar with the use of git on the command line, as well as Jekyll. Note that translating the Jamulus application itself is done by a different process, but you are welcome to help with that too. Introduce yourself on the [GitHub Discussion](https://github.com/jamulussoftware/jamulus/discussions) and say what you’d like to do.

### Please also note that discussions should be in English so as to be open to all. 

## Making changes to the English version

**Note** Any significant changes **must** be made to the English first. See the translation process later in this document if you want to get involved with that.

To edit an individual file, you can use the Github web interface or make a fork of the Jamulus repository (button at [top right here](https://github.com/jamulussoftware/jamuluswebsite)). In your fork, you can edit multiple website pages (or of course use git on the command line if you prefer). When you are done, create a pull request that we will review, translate and publish in the next release.

To view the website offline one your own machine, you will need to clone it locally and use [Jekyll](https://jekyllrb.com/) to build it. Please ask on [in the discussions](https://github.com/jamulussoftware/jamulus/discussions) for help with this if necessary.

## Formatting and style

We use [GitHub markdown](https://guides.github.com/features/mastering-markdown/) to format the basic text. Have a look at the markdown in existing pages for examples. 

Note that we use British English spelling and grammar conventions. 

## Adding pictures

Use the `{{site.url}}` variable to call an existing image in the corresponding directory for that language. This ensures the correct URL is used:

`<img src="{{site.url}}/assets/img/en-screenshots/mixer-channles.png" …` 

If you want to add a new image, use .png format if possible, and if it’s not a screenshot, ask about where you should store it. Localised images must go in a directory for that language (see the example for English, above).


## Translating

### For details on the website translation process, please consult the README file contained in the `translator-files/` folder

#### Please note: if your language has no translated documents, please start with the following sections of the website:

- Home page
- Setup/Getting Started
- Installation pages (Win, Linux, macOS)

For translating text in the Jamulus application itself, please see [TRANSLATING.md](https://github.com/jamulussoftware/jamulus/blob/master/TRANSLATING.md)

We collect changes to the English version of the site on a "next-release" branch first. We then freeze changes prior to a Jamulus software release, and do a translation "sprint" over a couple of weeks when all translation takes place.

### Here’s the overall workflow

1. Changes are first made to EN (= English) *.md files and committed to the “next-release” branch.
1. Once we’ve agreed the changes can go live (usually just before a software release), we then create GitHub issues for each language, tagged for that release. You can ask questions about the work there.
1. Translators for each language then update any affected files by editing the .po files for their language in `translator-files/l10n/po/LANGUAGE/` and open pull requests to merge them into the "next-release” branch. Those pull requests are linked to the relevant GitHub issue in step 2 so they can be tracked.
1. When all translations are merged (issues will then close automatically), we merge that new branch into the `release` branch, which is automatically made live on the production site.

### Points to note

- Each page on the site has a .md or .html language suffixed version.  Some of the website content is in \_includes/wiki/[langCode]. These files must be translated in order not to break the site. 

- The homepage (https://jamulus.io/) is located in the repo root and named 1-[langCode]-index.html

- Please do not add new or significantly modified content to a non-English .html file and do not edit **any** non-English .md files, as these changes would later be lost. All content changes must be made on the "next-release" branch in English **first** after being [discussed here](https://github.com/jamulussoftware/jamulus/discussions).

- Please make sure you are aware of what stage of the workflow we are currently at by monitoring the [project board](https://github.com/orgs/jamulussoftware/projects/2), and on the Discord (or Matrix) discussion channel that you will be invited to join. This is where relevant deadlines and information will be posted during the translation sprint.

- Pull requests for translations should have a title which looks like this: `[Tag (Translation)][language code (e.g. en)] {short description of your changes}`


## Adding a new language

Copy the `translator-files/l10n/templates` folder, paste it into `translator-files/l10n/po/`and rename it to your language code. Now rename all the .pot files inside it, changing the .pot file extension to .po.

Make sure to add the language to the \_config.yml file (in the languages array).  At a minimum, the main includes for the wiki (see \_includes/wiki/) have to be translated.

The navigation and general site-wide strings (see the \_data/ folder) and the homepage (see the 1-index.html file in the root of this repo) should also be translated.
