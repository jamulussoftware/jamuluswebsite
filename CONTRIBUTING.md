# Contribute to the documentation
We really appreciate your support!

Please note that discussions should be kept in English. If you don't speak English fluently you can use a reasonably good online translator (e.g. [DeepL](https://www.deepl.com), [Reverso](https://www.reverso.net/text_translation.aspx), ...) which might be able to translate your language to English.

Please have a look at the [issues page on GitHub](https://github.com/jamulussoftware/jamuluswebsite/issues) and check if anybody has raised an issue with the same topic.

If this is the case, please subscribe to the issue and explain your proposal.

If that's not the case, please open a [new issue](https://github.com/jamulussoftware/jamuluswebsite/issues/new/choose), select which type of issue it is and describe your issue.

If you want to open a Pull Request (after having described and discussed your proposal), keep in mind that your changes (if they are not just typos) might have to wait until everything is translated. We will bundle them (if everything is all right) with any other changes and upload all of them as a combined Pull Request to jamulus.io.

Pull requests/issues for the website should have a title which looks like this:

`[Tag (like Bug, Translation, etc.)][language code (e.g. en)] {short description of your changes}`

## Branches, Translation and development process

We currently use *multiple branches* to ensure that translators know what to translate.

After having discussed and agreed on changes you want to be integrated to jamulus.io, you should ask yourself some questions:

## 0. Is your content in a language that already exists on the site?
If not: This will be discussed this later (since you introduce a new language).
If so look here:
### 1. Be clear if your change needs translation
**No:** A fix which doesn't need to be translated (e.g. typo) --> Open a Pull Request to `release`. It will go live a few minutes after the PR is merged
**Yes:** A fix which needs to be translated (e.g. if you want to make a sentence or paragraph clearer) --> Commit to `changes` since others will need to translate it. (If you wish to, please do not add your translation to your commit, but add a comment with the translation in your Pull Request). It will be part of the next release.

### 2. Be clear if a translation update is going on
You can see this if we ping the translators in a PR from changes to translate.

**If yes:** only translate the changes of the Pull Request from changes to translation. If you find issues, start with 1
**If no:** no need to care about the translate branch

## Adding a new language

1. Open an issue with the title [Translate] `yourLanguage` and say that you want to translate the homepage into your language.
2. If you start your new translation, follow the instructions to add a new language in the /README.md file on the changes branch.
3. Finally, open a PR to `translate`
