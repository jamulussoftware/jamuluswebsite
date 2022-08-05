# Jamulus Website

This is the content repository for [jamulus.io](https://jamulus.io). Text appearing in the Jamulus software application itself is part of the [main code repository](https://github.com/jamulussoftware/jamulus). See also the [general overview](https://jamulus.io/wiki/Contribution) to getting involved. 

## Translation

<a href="https://hosted.weblate.org/engage/jamulus/">
<img src="https://hosted.weblate.org/widgets/jamulus/-/multi-auto.svg" alt="Translation status" />
</a>

The Jamulus website is translated using [Weblate](https://hosted.weblate.org/engage/jamulus/). If you prefer you may also submit translations via Pull Requests. Note that translating the Jamulus application itself is done by a different process, but you are welcome to help with that too. Introduce yourself on the [GitHub Discussion](https://github.com/jamulussoftware/jamulus/discussions) and say what you’d like to do.

***PLEASE NOTE:*** Discussions should be in English so as to be open to all.

## Making changes to the documentation

**Important:** Any changes to the content of the documentation **must** be made to the English version first, as it is the source for all translations.

To edit an individual file, you can use the Github web interface or make a fork of the Jamulus repository (button at [top right here](https://github.com/jamulussoftware/jamuluswebsite)). In your fork, you can edit multiple website pages (or of course use git on the command line if you prefer). When you are done, create a pull request that we will review, translate and publish in the next release.

To view the website offline one your own machine, you will need to clone it locally and use [Jekyll](https://jekyllrb.com/) to build it. Please ask on [in the discussions](https://github.com/jamulussoftware/jamulus/discussions) for help with this if necessary.

## Formatting and style

We use [GitHub markdown](https://guides.github.com/features/mastering-markdown/) to format the basic text. Have a look at the markdown in existing pages for examples.

Note that we use British English spelling and grammar conventions.

## Adding screenshots

In order to keep the size of the respository under control when images change over time, we do not store screenshots locally. Instead we use Jekyll's `include` function to call a file containing an external URL to the image itself:

`<img src="{% include img/en-screenshots/main-screen-default.inc %}"  …`

If you want to add a new image, use .png format if possible, and if it’s not a screenshot, ask about where you should store it. Localised images must go in a directory for that language (see the example for English, above).

To get the URL for the `.inc` file, open a Github issue (in any repository) and add your image to it. Github will generate a URL for it like this:

`![your-image-name](https://user-images.githubusercontent.com/45617 … .png)`

Put that URL (only the part within the brackets) into the `.inc` file, saving that in the appropriate directory to be used as above for `<img src=`. Note that because Github generates unique "anonymous" URLs for every image, the `include` method allows us easily to manage the same image used in multiple places if necessary. 

### Style and tone

Please have a look at our [style and tone guide](https://jamulus.io/contribute/Style-and-Tone).

### Overall workflow

We collect changes to the English version of the site on a "next-release" branch first. We then freeze changes prior to a Jamulus software release, and do a translation "sprint" over a couple of weeks when all translation takes place.

1. Changes are first made to EN (= English) *.md files and committed to the “next-release” branch.
1. Once we’ve agreed the changes can go live (usually just before a software release), we then create GitHub issues for each language, tagged for that release. You can ask questions about the work there.
1. Translators for each language then update them on Weblate, or edit the .po files for their language in `_translator-files/po/LANGUAGE/` and open pull requests to merge them into the "next-release” branch.
1. When all translations are merged (issues will then close automatically), we merge that new branch into the `release` branch, which is automatically made live on the production site.

### Points to note

- Translations should stay as close as possible to the original English text. If you see content in English that is incorrect or unclear, please do not attempt to correct or modify it in your translation, but rather make it known by [discussing it here](https://github.com/jamulussoftware/jamulus/discussions) so it can be corrected in the English files **first** and thus be applied to all other translations.

- Please make sure you are aware of what stage of the workflow we are currently at by monitoring the [project board](https://github.com/orgs/jamulussoftware/projects/2), and on the Discord (or Matrix) discussion channel that you will be invited to join. This is where relevant deadlines and information will be posted during the translation sprint.
