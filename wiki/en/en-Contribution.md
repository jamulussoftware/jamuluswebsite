---
layout: wiki
title: "Contribution"
lang: "en"
permalink: "/wiki/Contribution"
---

# Contributing to the Jamulus Project

## Jamulus Software

If you want to contribute code or have a feature request, [open an issue on GitHub](https://github.com/jamulussoftware/jamulus/issues/) (preferred) or [post your idea on the forum](https://github.com/jamulussoftware/jamulus/discussions) if you don't have a GitHub account. This allows us to discuss the changes before e.g. making a pull request (be sure to read main dev's [Volker's manifesto for contributions on GitHub](https://github.com/jamulussoftware/jamulus/discussions/915) and the [CONTRIBUTING file](https://github.com/jamulussoftware/jamulus/blob/master/CONTRIBUTING.md))

See the [Jamulus GitHub repo](https://github.com/jamulussoftware/jamulus) for further information.

## Jamulus Website

* If you find a mistake, typo or something out of date (in any language) on the website, you can [open an issue on GitHub](https://github.com/jamulussoftware/jamuluswebsite/issues).

* If you think some documentation or information is missing or can be improved, post about that on [the discussion forum](https://github.com/jamulussoftware/jamulus/discussions) so that it can be discussed first.

Have a look at the [CONTRIBUTING file](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md) for the website and the [Website GitHub repo](https://github.com/jamulussoftware/jamuluswebsite) for further information.

### I'm not familiar with GitHub. What do I need to know?

**The following content is for the documentation on jamulus.io only, not for the Jamulus software!**

If you aren't comfortable with Pull Requests, commits, etc. just open an issue. We will then take care of your changes. If you want to do the changes on your own and open a Pull Request, follow these instructions:

1. Fork the repo (there's a fork button on the top right of the GitHub page)
2. Decide which branch you have to commit your changes to (rule of thumb: everything which might need translation should go to the `changes` branch, typos should go to the `release` branch; more information can be found in the [CONTRIBUTING file](https://github.com/jamulussoftware/jamuluswebsite/blob/changes/CONTRIBUTING.md)). Create a new branch from the up-to-date branch you chose
3. Make your changes
4. If you did the changes offline, push the new branch to your repository
5. Submit your Pull Request, give a short description of your changes and link the issue you opened
6. Wait for a review and a merge

**Hint (for git):** *Do not merge your work* into your local `changes` branch, only keep it in sync by pooling from the remote Jamulus website repository. Create a new branch for your proposed changes.
If the `changes` branch is modified before submitting your request, keep the local `changes` branch in sync by pooling from the official one, merge the local changes branch into your working branch, resolve conflicts, push your changes and create the Pull Request.
