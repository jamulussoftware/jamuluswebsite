# Contribute to the documentation
We really appreciate your support! Please have a look at the [issues page on GitHub](https://github.com/jamulussoftware/jamuluswebsite/issues) and check if anybody already raised an issue with the same topic.

If this is the case, please subscribe to the issue and explain your proposal.

If that's not the case, please open a [new issue](https://github.com/jamulussoftware/jamuluswebsite/issues/new/choose), select which type of issue it is and describe your issue.

If you want to open a Pull Request (after having described and discussed your proposal), have a look at the [Contribution page on the website](https://jamulus.io/wiki/Contribution). Keep in mind that your changes (if they are not just typos) might have to wait until everything is translated. We will bundle them (if everything is allright) with other changes and upload multiple changes in one bulk to jamulus.io.

## I don't know GitHub. What do I need to know?
If you aren't comfortable with Pull Requests, commits, etc. just open an issue. We will then care about your changes. If you want to do the changes on your own and open a Pull Request, follow this instructions:
1. Fork this repo (there's a fork button on the top right of the page)
2. Create a new branch from the up to date `changes` branch
3. Make your changes
4. If you did the changes offline, push the new branch into your repository
5. Submit your Pull Request (merge it to the `changes` branch), give a short description of your changes and link the issue you opened
6. Wait for a review and a merge.

Hint (for git): **Do not merge your work** into your local `changes` branch, only keep it in sync by pooling from the remote Jamulus Website repository. Create a new branch for your proposed changes.
If the `changes` branch is modified before submitting your request, keep the local `changes` branch in sync by pooling from the official one, merge the local changes branch into your working branch, resolve conflicts, push your changes and create the Pull Request.

Please note that discussions should be kept in English. Don't be afraid, if you don't speak English fluently. You can use [DeepL](https://www.deepl.com) which might be able to translate your language to English.

## Branches, Translation and development process

We currently use multiple branches to ensure that translators know what to translate. Therefore have a look at the guideline below.

After having discussed and agreed on changes you want to be integrated to jamulus.io, you should ask yourself some questions:

## 0. Is the language of your content already online and existing?
No: Will discuss this later (since you introduce a new language).
Yes:
### 1. Be clear if your change needs translation
**No:** A fix which doesn't need to be translated (e.g. typo) --> Open a Pull Request to `release`. It will go live a few minutes after the PR is merged
**Yes:** A fix which needs to be translated (e.g. if you want to make a sentence or paragraph clearer) --> Commit to `changes` since others will need to translate it. It will be part of the next release.

### 2. Be clear if a translation update is going on
You can see this if we ping the translators in a PR from changes to translate.

**If yes:** only translate the changes of the pull request from changes to translation. If you find issues, start with 1
**If no:** no need to care about the translate branch

## Adding a new language

1. Open an issue with the title [Translate] `yourLanguage` and say that you want to translate the homepage into your language.
2. If you start your new translation, follow the instructions to add a new language in the /README.md file on the changes branch.
3. Finally, open a PR to `translate`
