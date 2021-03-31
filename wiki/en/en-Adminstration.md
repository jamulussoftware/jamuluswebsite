---
layout: wiki
title: "Adminstration"
lang: "en"
permalink: "/wiki/Adminstration"
---

This document describes internal processes and guidelines.
It is public for transparency.
There currently is no need to translate this page.

This document is targeted at the project admins.

# Releases
## Versioning
We use [Semantic Versioning 2.0.0](https://semver.org/).
This means:
- We bump the major version (e.g. Jamulus 3.21.0 to 4.0.0) only in case of backwards-incompatible or large architectural changes.
- We bump the minor version (e.g. Jamulus 3.9.0 to 3.10.0) for new features and backwards-compatible improvements.
- We bump the patch level version (e.g. 3.7.0 to 3.7.1) for small bugfixes. Examples include:
  - Bug fixes for issues introduced with by the last release.
  - Addition of translations which were too late to be included into the last release.

Contrary to Semantic Versioning, we currently do not place a hyphen between the version and pre-release suffixes.

We use the following suffixes for pre-releases:
  - `dev` to denote custom builds from git. Example: `3.7.0dev-123456` is an unofficial release built from code on top of the final 3.7.0 release.
  - `devNightly` to denote deliberate snapshots from the official jamulussoftware/jamulus git. Example: `3.7.0devNightly1-123456` is an official pre-release built from code on top of the final 3.7.0 release. There may be zero, one or multiple nightly builds during a release cycle.
  - `beta` to denote test builds for new releases. Example: `3.8.0beta1` is the first official test build before 3.8.0 final is tagged. Betas are still subject to change.
  - `rc` to denote release candidates. Example: `3.8.0rc1`is the first release candidate before 3.8.0 final is tagged. Release candidates must not receive any code changes. If they do (e.g. due to critical bugfixes), another rc has to be tagged.

The git tag is prefixed by `r` (for release) and all dots are replaced by underscores.
Example: The git tag `r3_7_0beta1` refers to the user-visible version `3.7.0beta1`.

### Forks
Forks of Jamulus must not use the same versioning scheme if they publish their own releases.
Having a jamulussoftware/jamulus-3.7.0 release and a example.org/jamulus-3.7.0 release would be confusing to users.
Instead, forks must distinguish their version, e.g. by adding an additional suffix.
Example: 3.7.0-example.org-beta1

## Creating a (pre)release
  - Feature freeze, Code freeze
  - It's ok if translation PRs are not ready
  - Use issue template(s)?
  - Release shepherd?
  - Sign release tag?
  - Release announcements
  - Close the milestone

## Changelog
  - Biggest changes first
  - Refactorings, internal-only or build-related changes last
  - Full sentences on a single line, followed by issue and/or PR references in parentheses. Sentences should make the scope (e.g. Client, Server, UI, ...) clear as early as possible.
  - Optionally, a longer description in a subsequent line.
  - `(contributed by @<Github handle>)` in a subsequent line.

## Translations
TODO: link to translation-specific documentation

# Project organization

## Long-term goals
TODO: Link to / integrate @gilgongo's document?

## Project board
https://github.com/jamulussoftware/jamulus/projects/10?card_filter_query=milestone%3A%22release+3.7.0%22,
https://github.com/jamulussoftware/jamulus/discussions/929#discussioncomment-420872

## Milestones

## Issues and Pull Requests for jamulussoftware/jamulus
<!-- TODO: Should we extend this to work for jamuluswbesite as well? If so, how? -->
We aim to give early feedback and try to keep an overview by using the Project board.

### Triage
When a new Issue or Pull Request comes in, do the following:
1. Add it to the Tracking Project board.
1. Check for duplicates.
1. Decide whether to accept this Issue/PR:
   1. Reject if it is a feature which goes against Jamulus' core principles. <!-- TODO: Link CONTRIBUTE.md -->
   1. Accept if it is about a plausible or reproducible bug.
   1. Accept if it is a well-specified feature request or implementation.
   1. Accept PRs if there is a related, accepted Issue.
1. Check if the title provides enough context. Improve generic titles. For example, change `Fix bug` to `Recorder: Fix crash on full disk`.
1. Give a quick initial feedback
   - `Thanks for your report/PR`
   - Request additional information if necessary.
   - Add information if you suggest to accept (`This should be fixed`) or reject (`This seems to go against Jamulus' core principles because of ...`). Mark this as your personal statement and request additional input from other main developers. Lazy consensus applies.
1. For Issues, additionally do the following:
   1. Verify that the issue is about a bug, an improvement or about a well-specified new feature. Move support requests or "it would be nice" entries to a Discussion first. Motivate requesters to open a new Issue once the Discussion has reached agreement what to implement.
1. For Pull Requests, additionally do the following:
   1. Project Board: Move to *Waiting on Team*
   1. Request Review from two main developers who topic specialists for the PR.

### Reviewing Pull Requests
1. Add the appropriate Milestone once it is clear that it will go into the next release.
1. Link any relevant Issues to the PR.
1. Do a compile test, check for warnings.
1. Check for correctness, possibly buggy or unstable behavior.
1. Check for possible performance regressions.
1. Check coding style.
1. Check for CI to be green.
1. If you accept
1. jamuluswebsite: KB articles: Just check for spam. No deep review required.

### Merging Pull Requests

1. If you are the first Reviewer and you Accept the PR, request review from a second maintainer.
1. If you are the second Reviewer and you Accept the PR, merge it...
   - unless you want to request a review from a third Reviewer.
   - unless this is a PR from a main developer, in which case the author of the PR is supposed to merge themselves.
1. Add the Milestone (if not done previously)
1. Merge in a history-friendly way:
  - Default to Squash merges, especially if the PR consists of multiple individual `fix ...` commits.
  - Use a regular merge if it makes sense to preserve history and if the individual commits are in a buildable, workable state.
  - Edit the commit message to be clear in what area of the code it touches. Use imperative. Example: `Update German translation for 3.7.0`. Avoid: `Improving performance`


## Discord/Matrix Chat
We use the Discord/Matrix chat for quicker, loose interaction.
All decision and results should still be documented in permanent Github Issues, Discussions or Comments.

# Decision making
We use [lazy consensus](https://couchdb.apache.org/bylaws.html#lazy) by default.
This means that any reversible decision is considered supported by the team as long as nobody objects.
This also means that everyone must be transparent about their intentions and actions in order for every other member to have a chance to comment.

# Main developers team structure
Adding or removing team members requires a majority vote by all main developers.

## Accepting new team members
- Invite to Github org and add permissions <!-- TODO: which/where? -->
- Add mail address to team@ <!-- TODO: how? -->
- Invite to Discord server or the bridged Matrix channel
- Subscribe to notifications for the jamulussoftware repositories

## Removing team members
Reverse the onboarding checklist.

# Repositories
## Jamulus
## Jamulus website
## Assets (ASIO4ALL)
## Install scripts

# Infrastructure
## Official Directory Servers
TODO: @pljones'/@corrados' infra

## Update check servers
TODO: @pljones'/@corrados' infra

## DNS
TODO: @gilgongo?

## Email
TODO: @gilgongo?

## Domain
TODO: Who owns it / has access?

## Website
The website is hosted on Github Pages and is fed by the jamulussoftware/jamuluswebsite repository.

## Discord server
TODO: @softins?


# Credential management
Credentials for access to common infrastructure
TODO: Discuss
<!--
- Cloud password manager?
- Github secrets (I've never used them and I
- File-based password manager in a private repo (Keepass, Command line tools, ...)?
-->
