# Jamulus Website

This is the content repository for [jamulus.io](https://jamulus.io). Text appearing in the Jamulus software application itself is part of the [main code repository](https://github.com/jamulussoftware/jamulus). The web site is built with Jekyll and Fox-CSS.

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

**For details on the website translation process, please consult the README file contained in the `_translator-files/` folder**

### Style and tone

Language on the website should be consistent. Please have a look at our [style and tone guide](https://jamulus.io/contribute/Style-and-Tone).

For translating text in the Jamulus application itself, please see [TRANSLATING.md](https://github.com/jamulussoftware/jamulus/blob/master/TRANSLATING.md)

We collect changes to the English version of the site on a "next-release" branch first. We then freeze changes prior to a Jamulus software release, and do a translation "sprint" over a couple of weeks when all translation takes place.

### Here’s the overall workflow

1. Changes are first made to EN (= English) *.md files and committed to the “next-release” branch.
1. Once we’ve agreed the changes can go live (usually just before a software release), we then create GitHub issues for each language, tagged for that release. You can ask questions about the work there.
1. Translators for each language then update any affected files by editing the .po files for their language in `_translator-files/po/LANGUAGE/` and open pull requests to merge them into the "next-release” branch. Those pull requests are linked to the relevant GitHub issue in step 2 so they can be tracked.
1. When all translations are merged (issues will then close automatically), we merge that new branch into the `release` branch, which is automatically made live on the production site.

### Points to note

- Please do not add new or significantly modified content to a non-English .html file and do not edit **any** non-English .md files, as these changes would later be lost. All content changes must be made on the "next-release" branch in English **first** after being [discussed here](https://github.com/jamulussoftware/jamulus/discussions).

- Please make sure you are aware of what stage of the workflow we are currently at by monitoring the [project board](https://github.com/orgs/jamulussoftware/projects/2), and on the Discord (or Matrix) discussion channel that you will be invited to join. This is where relevant deadlines and information will be posted during the translation sprint.
