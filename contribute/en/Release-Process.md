---
layout: wiki
title: "Release Process"
lang: "en"
permalink: "/contribute/Release-Process"
---

# Release Process for Jamulus
{:.no_toc}

This document lists the exact steps required for a developer with write access to generate either a pre-release (beta, rc) or full release of Jamulus.
Note: Besides the actual build, a full release of Jamulus should also follow the release checklist which can be copied below. This is to ensure a good release quality.

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

## Release (Building)

### Set up

A direct clone of the Jamulus repo is required, not a fork. This should be set up in a separate directory just for the release process:

```
$ git clone git@github.com:jamulussoftware/jamulus.git jamulus-upstream
$ cd jamulus-upstream
$ git remote -v
origin  git@github.com:jamulussoftware/jamulus.git (fetch)
origin  git@github.com:jamulussoftware/jamulus.git (push)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

### Steps for a specific release

#### 1. Ensure .ts files are up to date
{:.no_toc}

First make sure all Pull Requests that should be included in the release have been merged in Github.

Next, change to the above directory `jamulus-upstream`, checkout `main` and ensure it is up to date:

```
$ cd jamulus-upstream
$ git checkout main
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
{:.no_toc}

Use `tools/create-translation-issues.sh` to create and assign issues (see usage notes in script). Also post on GH and Discord to notify.

#### 3. Update the .ts files returned by translators
{:.no_toc}

Each translator should submit a PR containing just their new version of the `.ts` file. There is no need to submit
a new `.qm` file, as they will all be regenerated below.

A developer should check and merge each PR as it arrives using this checklist:

~~~
- [ ] Translator listed in the `src/util.cpp` *optionally add link to PR or code*
- [ ] Punctuation and spacing consistent
- [ ] Signal words consistent ("ASIO", "Buffer")
- [ ] App translations: No untranslated strings (`grep unfinished -5 src/translation/translation_$TRANSLATION*.ts`)
- [ ] App translations: Only a single `.ts` file checked in (`.qm` in addition is also OK)
- [ ] Installer translations: Passes `tools/check-wininstaller-translations.sh`
~~~

#### 4. When all translations have been submitted and merged.
{:.no_toc}

Change to the above directory `jamulus-upstream`, checkout `main` and ensure it is up to date:

```
$ cd jamulus-upstream
$ git checkout main
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

for a proper release, change it as follows, removing the NOTE and including the release date such that the headline looks exactly like this (including all `###`):

```
### 3.7.0 (2021-03-17) ###
```

Check only those two files have changed, then commit and push the changes with the following commit message:

```
$ git status
$ git commit -am'Update version to <version> for release'
$ git push
```

Now add the required tag locally and then push the tag. This will start the automated release process on Github:

```
$ git tag r3_7_0
$ git push origin tag r3_7_0
```

### If this is a proper release, move the `latest` tag
{:.no_toc}

This needs the `--force` option to overwrite the existing `latest` tag and move it to the current commit:

```
$ git tag --force latest
$ git push --force origin tag latest
```

For a pre-release, the `latest` tag should not be updated, but continue to point to the last proper release.

### Make the main branch ready for post-release development
{:.no_toc}

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

## Upload binaries to SourceForge

**NOTE**: As of Sept 2023 we have a webhook set to transfer the downloads automatically to SourceForge on GitHub release. Check to see whether that's worked before following the steps below! 

You will need an authorised SourceForge account.

`sftp [your_accountname]@frs.sourceforge.net`

`cd /home/pfs/project/l/ll/llcon`

then you'll see "Jamulus" and "OldFiles" directories. "Jamulus" is the releases, one directory per release.

```
cd Jamulus
mkdir 3.7.0
cd 3.7.0
```

Upload all the files. Then in the SourceForge web UI, for each of the files uploaded, click the ℹ️ icon next to the file (in Files in the admin tools) and set it as "Default for (appropriate) platform)" Note that unsetting the default to "none" automatically picks the newest, so don't do that -- explicitly set the default when the release announcement is posted. Also note that legacy Mac, Headless and WinJACK users will need to just find those links on their own.

## Website: check links

We have used [linkcheck](https://github.com/filiph/linkcheck) in the past.

```
$ git clone https://github.com/jamulussoftware/jamuluswebsite.git
$ cd jamuluswebsite
$ git checkout next-release
$ _po4a-tools/po4a-create-all-targets.sh
$ bundle exec jekyll serve
$ linkcheck http://localhost:4000 > linkcheck.log
```

## Release checklist (for a full release)

Before starting a full release process, an issue in the jamulussoftware/jamulus repository needs to be opened. The content of this issue should include the following checklist:

~~~
**Target timeline**
Scheduled feature freeze / Start of translation process: <!-- Add a date, usually about 6-8 weeks from the last release, e.g. 2021-04-20. Allow approx. 4-6 weeks to complete a release -->
Targeted translation completion date: <!-- E.g. two weeks after feature freeze, e.g. 2021-05-04 -->
Approximate release date: <!-- E.g. one week after targeted translation completion date to have time for late translations, reviews, RC, e.g. 2021-05-11 -->
Current state: <!-- Planning|Translations (beta)|Code freeze (rc)|Released -->

**Checklist**
- [ ] Assign this issue to the release shepherd who is in charge of managing this checklist.
- [ ] Pin this issue
- [ ] Ensure that all issues/PR targeted for this release are done by checking the Project board with [the appropriate filter for this release](https://github.com/orgs/jamulussoftware/projects/5/views/5). Remind main developers to review entries in *Waiting on team* state.
- [ ] Agree to de-tag unfinished Issues/PRs.
- [ ] Declare a freeze for code and website by updating this Issue and adding a comment. PRs can still be worked on and may get reviewed, but must not be merged unless agreed explicitly.
- [ ] Check the `needs documentation` label for any outstanding PRs flagged for this release and remove that label if done.
- [ ] Check ./Jamulus -h output against the [Include-Client](https://github.com/jamulussoftware/jamuluswebsite/blob/next-release/wiki/en/Include-Client-Commands.md)/[Server-Commands](https://github.com/jamulussoftware/jamuluswebsite/blob/next-release/wiki/en/Include-Server-Commands.md).md pages and [man page (distributions/Jamulus.1)[(https://github.com/jamulussoftware/jamulus/blob/main/distributions/Jamulus.1). Update if necessary.
- [ ] Start Website translations
  - [ ] [Check for broken links](https://github.com/jamulussoftware/jamuluswebsite/blob/release/contribute/en/Release-Process.md#website-check-links)
  - [ ] Open a Pull Request from `next-release` to release, set it as "Draft", sanity check for conflicts and any obvious problems.
  - [ ] Declare a full freeze of the `next-release` and `release` branch. No changes should be made from now on to ensure translators don't have to work twice.
  - [ ] Check if the list of translators in `tools/create-translation-issues.sh`. Make sure issue text is up-to-date. Add any URLs that will need localisation into the "New/Changed screenshots" section.
  - [ ] Create a translation issue for each language with `tools/create-translation-issues.sh` using `web` argument (see notes in script).
  - [ ] If anyone finds critical issues now, all translators must be made aware of them and all languages should be updated.
- [ ] Start App translations
  - [ ] Generate `.ts` files in main via `lupdate`
  - [ ] Check if the list of translators in `tools/create-translation-issues.sh` is up-to-date
  - [ ] Create a translation issue for each language with `tools/create-translation-issues.sh` using `app` argument.
- [ ] [Update the Changelog](https://jamulus.io/contribute/Release-Process#updating-the-changelog)
- [ ] [Tag a beta release](https://jamulus.io/contribute/Release-Process#steps-for-a-specific-release)
  - [ ] Inform emlynmac for signing on macOS, and upload signed binary from [his repo](https://github.com/emlynmac/jamulus/releases/) to [ours](https://github.com/jamulussoftware/jamulus/releases/)
  - [ ] Announce the beta release on Github Discussions. Pin the thread.
  - [ ] Get feedback on the stability and resource usage (memleaks?, crashes?, installation issues?) of the beta release
- [ ] Finish App translations
  - [ ] Review translation PRs according to [release process checklist](https://jamulus.io/contribute/Release-Process#3-update-the-ts-files-returned-by-translators)
  - [ ] Wait for all PRs to be merged (missing translations will revert to English automatically).
  - [ ] Check for conflicting accelerator keys (see `tools/checkkeys.pl`)
  - [ ] Generate `.qm` files via `lrelease Jamulus.pro`  
- [ ] Finish Website translations
  - [ ] Wait for all PRs to be merged (missing translations will revert to English automatically)
  - [ ] [Check for broken links](https://github.com/jamulussoftware/jamuluswebsite/blob/release/contribute/en/Release-Process.md#website-check-links)
- [ ] Check the milestone for mergable stuff again
- [ ] [Update the Changelog](https://jamulus.io/contribute/Release-Process#updating-the-changelog)
- [ ] [Tag a release candidate](https://jamulus.io/contribute/Release-Process#steps-for-a-specific-release) (inform emlynmac for signing on macOS and upload signed binary from his repo to ours).
  - [ ] Announce the release candidate on Github Discussions. Pin the thread. Unpin and lock the beta thread.
  - [ ] Draft an announcement, include all contributors via `tools/get_release_contributors.py`
- [ ] [Update the version number in `Jamulus.pro` and add the release date to the Changelog header and commit](https://jamulus.io/contribute/Release-Process#steps-for-a-specific-release)
- [ ] [Update the Changelog](https://jamulus.io/contribute/Release-Process#updating-the-changelog)
- [ ] Tag this commit as `r3_y_z`
  - [ ] Wait for the build to complete
  - [ ] Contact emlynmac for signing on macOS and upload signed binary [from his](https://github.com/emlynmac/jamulus/releases/) repo [to ours](https://github.com/jamulussoftware/jamulus/releases).
  - [ ] Do a smoke test for Windows/Mac/Linux -- Do the binaries start/connect properly? Can earlier Jamulus versions properly connect to a server based on the new release?
  - [ ] [Force tag that tag as `latest` and push.](https://jamulus.io/contribute/Release-Process#if-this-is-a-proper-release-move-the-latest-tag)
  - [ ] [Upload the artifacts to SourceForge and set defaults](https://jamulus.io/contribute/Release-Process#upload-binaries-to-sourceforge).
  - [ ] Update download links on the website by editing `_config.yml` in `next-release`
  - [ ] Disable branch protection rule of the `release` branch by clicking on "Edit" on the [Branches page](https://github.com/jamulussoftware/jamuluswebsite/settings/branches) and adding a `_` behind `release`.  
  - [ ] Publish Website release by **squashing** and merging `next-release` into `release`
  - [ ] Enable branch protection rule of the `release` branch after the site and the `.po` files are published by removing the `_` from the branch protection rule you edited on the [Branches page](https://github.com/jamulussoftware/jamuluswebsite/settings/branches).
- [ ] Announce the new release with a summary of changes (+ link to the changelog for details) and a link to the download page
    - [ ] On Github Discussions in the Announcements section. Lock the announcement thread. Pin the thread. Unpin and lock release candidate thread.
    - [ ] On Facebook in the group "Jamulus (official group)". Turn off replies.
- [ ] Trigger the update notification by updating both Update Check Servers with the new version (@pljones for update02, email corrados for update01)
- [ ] [Prepare `Jamulus.pro` (`dev` suffix) and ChangeLog (add a header) for the [next release](https://jamulus.io/contribute/Release-Process#make-the-main-branch-ready-for-post-release-development)
- [ ] Check that all Issues and PRs tagged for this release are in Done/Closed state.
- [ ] Close the release milestone in both jamulus and jamuluswebsite repos
- [ ] Create a milestone for the next minor release in jamulus and jamuluswebsite repos
- [ ] Update this template in https://jamulus.io/contribute/Release-Process with any improvements if needed.
- [ ] Unpin and close this issue
- [ ] Determine if a release retrospective is needed, create on Discussions if required
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

## Downloads

_Windows users: Please note that in the first days after release SmartScreen will probably display warnings about this release being unknown upon download and/or execution of the installer. Let us know when you do not see this warning anymore and we will update this announcement accordingly._

**[↓ Windows](<!-- direct link to Windows version -->)** (ASIO version), alternative: [↓ JACK version](<!-- direct link to JACK version -->)
**[↓ macOS (Universal)](<!-- direct link to macOS SIGNED Universal version -->)** for Catalina (10.15) and higher and [↓ macOS legacy build](<!-- direct link to macOS legacy version -->) (unsigned) for macOS Mojave (10.14) down to Yosemite (10.10).
**[↓ Debian/Ubuntu (amd64)](<!-- direct link to .deb [GUI] version -->)**, alternative: [↓ headless version](<!-- direct link to .deb [headless] version -->)
**[↓ Debian/Ubuntu (armhf)](<!-- direct link to .deb [GUI] armhf version -->)**, alternative: [↓ headless version](<!-- direct link to .deb [headless] armhf version -->)
**[↓ Debian/Ubuntu (arm64)](<!-- direct link to .deb [GUI] armhf version -->)**, alternative: [↓ headless version](<!-- direct link to .deb [headless] arm64 version -->)
**[↓ Android](<!-- direct link to Android version -->)** (experimental)
**[↓ iOS](<!-- direct link to iOS version -->)** (experimental. Unsigned: Needs to be signed before installation on device. Please see the [iOS install page](https://jamulus.io/wiki/Installation-for-iOS))


[Alternative Sourceforge mirror](https://sourceforge.net/projects/llcon/files/latest/download)
[Source code](<!-- direct link to source code -->)


Thanks to everyone who did their part to make this release happen:
- Code contributors: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- Application translators: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- Website contributors/translators: <!-- in alphabetical order; see shell script to get contributors in jamulussoftware/jamulus -->
- ... and lots of people who brought new ideas or suggestions, guided their local colleagues or helped in various other ways!


This Discussion thread will be locked in order to keep things organized.
Feedback, questions or suspected bug reports are appreciated nevertheless -- please start a new [Discussion on Github](https://github.com/jamulussoftware/jamulus/discussions/new) for them.

~~~

### Updating the Changelog
- Run `./tools/changelog-helper.sh add-missing-entries` to scan Git history and Github milestone for PRs and to auto-add them to the changelog.
- Run `./tools/changelog-helper.sh group-entries` to group all entries for the current release
- Verify manually (`git diff`) & edit as necessary
- Commit & push
