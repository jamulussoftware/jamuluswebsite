---
layout: wiki
title: "Release Process"
lang: "en"
permalink: "/contribute/Release-Process"
---

# Release Process for Jamulus

This document lists the exact steps required for a developer with write access to generate either a pre-release (beta, rc) or full release of Jamulus.
Note: Besides the actual build, a full release of Jamulus should also follow the release checklist which can be copied below. This is to ensure a good release quality.
## Release (Building)
### Once to set up

A direct clone of the Jamulus repo is required, not a fork. This should be set up in a separate directory just for the release process:

```
$ git clone git@github.com:jamulussoftware/jamulus.git jamulus-upstream
$ cd jamulus-upstream
$ git remote -v
origin  git@github.com:jamulussoftware/jamulus.git (fetch)
origin  git@github.com:jamulussoftware/jamulus.git (push)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

### Steps for a specific release

#### 1. Ensure .ts files are up to date

First make sure all Pull Requests that should be included in the release have been merged in Github.

Next, change to the above directory `jamulus-upstream`, checkout `master` and ensure it is up to date:

```
$ cd jamulus-upstream
$ git checkout master
$ git pull
$ git status
```

Make sure there are no pending changes shown by `git status`.

Now update the `.ts` files to reflect the latest version of source code:

```
$ lupdate Jamulus.pro
$ git status
```

It should list all the `.ts` files that have been updated. If there are any, they should be committed directly:

```
$ git commit -am'Update .ts files for <version>'
$ git push
```

#### 2. Notify all the translators that translation is required

Use `tools/create-translation-issues.sh` to create and assign issues (see usage notes in script). Also post on GH and Discord to notify.

#### 3. Update the .ts files returned by translators

Each translator should submit a PR containing just their new version of the `.ts` file. There is no need to submit
a new `.qm` file, as they will all be regenerated below.

A developer should check and merge each PR as it arrives using this checklist:

- Translator listed in the `src/util.cpp` *optionally add link to PR or code*
- Punctuation and spacing consistent
- Signal words consistent ("ASIO", "Buffer")
- App translations: No untranslated strings (`grep unfinished -5 src/res/translation/translation_$TRANSLATION*.ts`)
- App translations: Only a single `.ts` file checked in (`.qm` in addition is also OK)
- Installer translations: Passes `tools/check-wininstaller-translations.sh`

#### 4. When all translations have been submitted and merged.

Change to the above directory `jamulus-upstream`, checkout `master` and ensure it is up to date:

```
$ cd jamulus-upstream
$ git checkout master
$ git pull
$ git status
```

Make sure there are no pending changes shown by `git status`.

Now ensure the compiled translation files are up to date:

```
$ lrelease Jamulus.pro
$ git status
```

If any of the `.qm` files have been updated by `lrelease`, they will be shown as changed files. If there are any, they should be committed and pushed:

```
$ git commit -am'Update compiled translations'
$ git push
```

Next edit both `Jamulus.pro` and `ChangeLog` with the new version number, such as **3.7.0rc2** or **3.7.0**:

```
$ vim -o Jamulus.pro ChangeLog
```

In `Jamulus.pro`, edit the `VERSION` line to give the release, e.g.

```
VERSION = 3.7.0rc2
```

or

```
VERSION = 3.7.0
```

In `ChangeLog`, for a pre-release, change the first version heading as follows:

```
### 3.7.0rc2 <- NOTE: the release version number will be 3.7.0 ###
```

for a proper release, change it as follows, removing the NOTE and including the release date:

```
### 3.7.0 (2021-03-17) ###
```

Check only those two files have changed, then commit and push the changes:

```
$ git status
$ git commit -am'Update version to 3.7.0 for release'
$ git push
```

Now add the required tag locally and then push the tag. This will start the automated release process on Github:

```
$ git tag r3_7_0
$ git push origin tag r3_7_0
```

### If this is a proper release, move the `latest` tag

This needs the `--force` option to overwrite the existing `latest` tag and move it to the current commit:

```
$ git tag --force latest
$ git push --force origin tag latest
```

For a pre-release, the `latest` tag should not be updated, but continue to point to the last proper release.

### Make the master branch ready for post-release development

This can be done immediately after pushing the above tag, there is no need to wait.

Edit both `Jamulus.pro` and `ChangeLog` to add `dev` to the version number and create a new section in the change log:

```
$ vim -o Jamulus.pro ChangeLog
```

In `Jamulus.pro`, edit the `VERSION` line to add `dev` to the current version number, e.g.

```
VERSION = 3.7.0dev
```

In `ChangeLog`, add a new section with `dev` and restore the NOTE indicating the next version number:

```
### 3.7.0dev <- NOTE: the release version number will be 3.7.1 ###


### 3.7.0 (2021-03-17) ###
```

Check only those two files have changed, then commit and push the changes:

```
$ git status
$ git commit -am'Set version to 3.7.0dev'
$ git push
```

Close the shell or change out of the upstream directory to one's usual working directory, e.g.:

```
$ cd ../jamulus
```

## Release checklist (for a full release)
Before starting a full release process, an issue in the jamulussoftware/jamulus repository needs to be opened. The content of this issue should include the following checklist:

~~~
---
name: 'For maintainers: Release a new version'
about: This is the Developer-only template which we use for tracking the process of future releases.
title: 'Prepare Release 3.y.z'
labels: release
assignees: ''
---

**Target timeline**
Scheduled feature freeze / Start of translation process: <!-- Add a date, usually about 6-8 weeks from the last release, e.g. 2021-04-20. Allow approx. 4-6 weeks to complete a release -->
Targeted translation completion date: <!-- E.g. two weeks after feature freeze, e.g. 2021-05-04 -->
Approximate release date: <!-- E.g. one week after targeted translation completion date to have time for late translations, reviews, RC, e.g. 2021-05-11 -->
Current state: <!-- Planning|Translations (beta)|Code freeze (rc)|Released -->

**Checklist**
- [ ] Assign this issue to the release shepherd who is in charge of managing this checklist (I won’t since I‘ll focus on the website)
- [ ] Pin this issue
- [ ] Create a milestone and add all relevant issues
- [ ] Ensure that all issues/PR targeted for this release are done by checking the Project board with an appropriate filter (e.g. [`milestone:"Release 3.8.0"`](https://github.com/orgs/jamulussoftware/projects/2?card_filter_query=milestone%3A"release+3.8.0")). Reminder main developers to review entries in *Waiting on team* state. De-tag unfinished Issues/PRs.
- [ ] Declare a freeze for code website by updating this Issue and adding a comment. PRs can still be worked on and may get reviewed, but must not be merged unless agreed explicitly.
- [ ] Check ./Jamulus -h output against the en-Command-Line-Options.md wiki page and update if necessary.
- [ ] Write the Changelog based on the list of PRs in "done" state ([example for 3.8.1](https://github.com/orgs/jamulussoftware/projects/2?card_filter_query=milestone%3A%22release+3.8.1%22+is%3Amerged))
- [ ] Start Website translations
  - [ ] Check for broken links with a link checker on the `next-release` branch and fix them
  - [ ] Check again if all issues tagged to this release are merged to `next-release`
  - [ ] Check if all merged Pull Requests on the jamulussoftware/jamulus repository which needed documentation have been documented and everything is in sync
  - [ ] Check for conflicts between the `release` and `next-release` branch (e.g. by opening a Pull Request from `release` to `next-release`)
  - [ ] Open a Pull Request from `next-release` to release, set it as "Draft" and briefly scan the changes for typos or errors in the English version
  - [ ] Declare a full freeze of the `next-release` and `release` branch. No changes should be made from now on to ensure translators don't have to work twice.
  - [ ] Check if the list of translators in `tools/create-translation-issues.sh` and issue texts are up-to-date
  - [ ] Create a translation issue for each language with `tools/create-translation-issues.sh` using `web` argument (see notes in script). 
  - [ ] If anyone finds critical issues now, all translators must be made aware of them and all languages should be updated.
- [ ] Start App translations
  - [ ] Generate `.ts` files in master via `lupdate`
  - [ ] Check if the list of translators in `tools/create-translation-issues.sh` is up-to-date
  - [ ] Create a translation issue for each language with `tools/create-translation-issues.sh` using `app` argument.
- [ ] [Tag a beta release](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#steps-for-a-specific-release) (inform emlynmac for signing on macOS)
- [ ] Announce the beta release on Github Discussions. Pin the thread.
- [ ] Get feedback on the stability and resource usage (memleaks?, crashes?, installation issues?) of the beta release
- [ ] Finish Website translations
  - [ ] Wait for all PRs to be merged (missing translations will revert to English automatically)
  - [ ] Check for broken links with a link checker locally (run `_po4a-tools/po4a-create-all-targets.sh` locally first)
- [ ] Finish App translations
  - [ ] Review translation PRs according to [release process checklist](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#3-update-the-ts-files-returned-by-translators
)
  - [ ] Wait for all PRs to be merged (missing translations will revert to English automatically).
  - [ ] Check for conflicting accelerator keys (see `tools/checkkeys.pl`)
  - [ ] Generate `.qm` files via `lrelease Jamulus.pro`  
- [ ] [Tag a release candidate](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#steps-for-a-specific-release) (inform emlynmac for signing on macOS)
- [ ] Announce the release candidate on Github Discussions. Pin the thread. Unpin and lock the beta thread.
- [ ] Draft an announcement, include all contributors via `tools/get_release_contributors.py`
- [ ] [Update the version number in `Jamulus.pro` and add the release date to the Changelog header and commit](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#steps-for-a-specific-release)
- [ ] Tag this commit as `r3_y_z`
- [ ] Wait for the build to complete
- [ ] Contact emlynmac for signing on macOS
- [ ] Do a smoke test for Windows/Mac/Linux -- Do the binaries start/connect properly? Can earlier Jamulus versions properly connect to a server based on the new release?
- [ ] [Force tag that tag as `latest` and push.](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#if-this-is-a-proper-release-move-the-latest-tag)
- [ ] Upload the artifacts to SourceForge and link latest (see #1814 for docs)
- [ ] [Prepare `Jamulus.pro` (`dev` suffix) and ChangeLog (add a header) for the next release](https://github.com/jamulussoftware/jamulus/blob/master/RELEASE-PROCESS.md#make-the-master-branch-ready-for-post-release-development)
- [ ] Update download links on the website by editing `config.yml`
- [ ] Publish Website release by merging `next-release` into `release`
- [ ] Announce the new release with a summary of changes (+ link to the changelog for details) and a link to the download page
  - [ ] On Github Discussions in the Announcements section. Lock the announcement thread. Pin the thread. Unpin and lock release candidate thread.
  - [ ] On Facebook in the group "Jamulus (official group)". Turn off replies.
- [ ] Trigger the update notification by updating both Update Check Servers with the new version (@pljones for update02, email corrados for update01)
- [ ] Delete the `next-release` branch from the Website repo
- [ ] Check that all Issues and PRs tagged for this release are in Done/Closed state.
- [ ] Close the release milestone in both jamulus and jamuluswebsite repos
- [ ] Create a milestone for the next minor release in jamulus and jamuluswebsite repos
- [ ] Create a release retrospective Discussion
- [ ] Unpin and close this issue
- [ ] Update this template in https://jamulus.io/contribute/Release-Process with any improvements if needed.
~~~

## Release announcement
This is a draft for a release announcement on GitHub discussions:
~~~
We're excited to announce the availability of Jamulus 3.x.y!

Some highlights include:
- <!-- highlight 1 -->
- <!-- highlight 2 -->
- <!-- highlight 3 -->

Notes:
- <!-- note 1 -->
- <!-- note 2 -->
- <!-- note 3 -->

<!-- if needed: Besides that, numerous usability improvements, enhancements, bugfixes and optimizations have been integrated. -->
Please find all the details in the [Changelog](https://github.com/jamulussoftware/jamulus/releases/<!-- link to changelog-->).

Downloads (primarily on Github, alternatively on [SourceForge](https://sourceforge.net/projects/llcon/files/latest/download)):
- [Windows](<!-- direct link to Windows version -->)
- [macOS](<!-- direct link to macOS version -->) for High Sierra (10.13) to Big Sur (11)
- [macOS legacy build](<!-- direct link to macOS legacy version -->) for macOS Sierra (10.12), El Capitan (10.11) or Yosemite (10.10).
- [Debian/Ubuntu (amd64)](<!-- direct link to .deb [GUI] version -->), alternative: [headless version](<!-- direct link to .deb [headless] version -->)
- [Source code](https://github.com/jamulussoftware/jamulus/archive/r3_8_0.tar.gz)

Thanks to everyone who did their part to make this release happen:
- Code contributors: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- Application translators: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- Website contributors/translators: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- ... and lots of people who brought new ideas or suggestions, guided their local colleagues or helped in various other ways!

Windows users: Please note that in the first days after release SmartScreen will probably display warnings about this release being unknown upon download and/or execution of the installer.
Please let us know when you do *not* see this warning anymore and we will update this announcement accordingly.

This Discussion thread will be locked in order to keep things organized.
Feedback, questions or suspected bug reports are appreciated nevertheless -- please start a new [Discussion on Github](https://github.com/jamulussoftware/jamulus/discussions/new) for them.

~~~
