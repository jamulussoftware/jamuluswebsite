# Jamulus Website

This is the content repository for [jamulus.io](https://jamulus.io). Text appearing in the Jamulus software application itself is part of the [main code repository](https://github.com/jamulussoftware/jamulus). See also the [general overview](https://jamulus.io/wiki/Contribution) to getting involved. 

## Translation

<a href="https://hosted.weblate.org/engage/jamulus/">
<img src="https://hosted.weblate.org/widgets/jamulus/-/multi-auto.svg" alt="Translation status" />
</a>

The Jamulus application and website are translated using [Weblate](https://hosted.weblate.org/engage/jamulus/), where you can check the status of each separate file. If you would like to help with translations, before you start, please read the instructions for [translating the website](https://github.com/jamulussoftware/jamuluswebsite/tree/release/_translator-files) or the [Jamulus application](https://github.com/jamulussoftware/jamulus/blob/main/docs/TRANSLATING.md).

Introduce yourself on the [GitHub Discussions](https://github.com/jamulussoftware/jamulus/discussions) and tell us what you’d like to do.

If you prefer to submit translations via pull requests rather than using Weblate, feel free to do so. However, make sure you coordinate with other possible translators to your language in order to avoid duplicating work and the risk of conflicts on GitHub.

***PLEASE NOTE:*** We ask that discussions occur in English.

## Making changes to the documentation

**Important:** Any changes to the content of the documentation **must** be made to the English version first, as it is the source for all translations.

To edit an individual file, you can use the Github web interface or make a fork of the Jamulus repository (button at [top right here](https://github.com/jamulussoftware/jamuluswebsite)). In your fork, you can edit multiple website pages (or of course use git on the command line if you prefer). When you are done, create a pull request that we will review, translate and publish in the next release.

### Viewing the website offline

You can view the website (this repo) offline on your own machine using [Jekyll](https://jekyllrb.com/). Please see the [instructions for doing this here](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll). Note that Windows and macOS users will need to make their changes to the website files first, then make a pull request. Click on the "Checks" tab of the pull request, on the right click on "Artifacts" and download the zipped website file. Unzip it (twice), cd into the extracted folder and run `jekyll serve`. If you are on Linux, you can make and view your changes offline before making a PR, but you must install po4a (clone our [assets repo](https://github.com/jamulussoftware/assets) and install the latest .deb from there) along with Jekyll. Then clone the website repo, create your branch and run `_po4a_tools/po4a-create-all-targets.sh` before running `bundle exec jekyll serve` and viewing the site on `http://127.0.0.1:4000/`. You can [ask for help in Discussions](https://github.com/jamulussoftware/jamulus/discussions).

## Formatting and style

We use [GitHub markdown](https://guides.github.com/features/mastering-markdown/) to format the basic text. Have a look at the markdown in existing pages for examples.

Note that we use British English spelling and grammar conventions.

## Adding screenshots

In order to keep the size of the respository under control when images change over time, we do not store screenshots locally. Instead we use Jekyll's `include` function to call a file containing an external URL to the image itself:

`<img src="{% include img/en-screenshots/main-screen-default.inc %}"  …`

These files are located in `_includes/img/LANG-screenshots`.

If you want to add a new image, use .png format if possible, and if it’s not a screenshot, ask about where you should store it. Localised images must go in a directory for that language (see the example for English, above).

To get the URL for the `.inc` file, open a Github issue (in any repository) and add your image to it. Github will generate a URL for it like this:

`![your-image-name](https://user-images.githubusercontent.com/45617 … .png)`

Put that URL (only the part within the brackets) into the `.inc` file, saving that in the appropriate directory to be used as above for `<img src=`. Note that because Github generates unique "anonymous" URLs for every image, the `include` method allows us easily to manage the same image used in multiple places if necessary. 

### Style and tone

Please have a look at our [style and tone guide](https://jamulus.io/contribute/Style-and-Tone).

### Overall workflow

We collect changes to the English version of the site on a "next-release" branch first. We then freeze changes prior to a Jamulus software release, and do a translation "sprint" over a couple of weeks when all translation takes place.

1. Changes are first made to EN (= English) *.md files and committed to the "next-release" branch.
1. Once we’ve agreed the changes can go live (usually just before a software release), we then create GitHub issues for each language, tagged for that release. You can ask questions about the work there.
1. Translators for each language then update them on Weblate, or edit the .po files for their language in `_translator-files/po/LANGUAGE/` and open pull requests to merge them into the "next-release" branch.
1. When all translations are merged (issues will then close automatically), we merge that new branch into the `release` branch, which is automatically made live on the production site.

### Points to note

- Translations should stay as close as possible to the original English text. If you see content in English that is incorrect or unclear, please do not attempt to correct or modify it in your translation, but rather make it known by [discussing it here](https://github.com/jamulussoftware/jamulus/discussions) so it can be corrected in the English files **first** and thus be applied to all other translations.

- Please make sure you are aware of what stage of the workflow we are currently at by monitoring the [project board](https://github.com/orgs/jamulussoftware/projects/5/views/5), and on the Discord (or Matrix) discussion channel that you will be invited to join. This is where relevant deadlines and information will be posted during the translation sprint.
