# Jamulus Website - Agent Instructions

Content repo for jamulus.io. English is the source of truth: edits land in English first, then flow to other languages via Weblate/po4a.

Read first: [README.md](README.md) (workflow, translation, branches) and the [Style and Tone guide](https://jamulus.io/contribute/Style-and-Tone) (voice, terminology, spelling). The guide governs; this file does not restate or override it.

## Changes

This is documentation, not code. The bar is: **is this better than what is there now?** Not complete, not final - better. A page that answers a reader's question one step sooner is worth submitting on its own.

- One logical improvement per PR. Open several small PRs rather than one large one, and keep each reviewable.
- Never hold a documentation fix behind a code change. Pages ship on their own schedule.
- If you cannot tell whether your version is better, say so in the PR description instead of guessing.

## Rules

- Edit English source `.md` files only. Never hand-edit translated files or `.po` files - those belong to translators via Weblate.
- Plain ASCII (`-` `'` `"`) inside anything parsed or copy-pasted: code, CLI flags, URLs, frontmatter, dates, versions. Autocorrect and LLM output break this by default; check your diff.
- British English spelling (colour, minimise, centre).

## Submitting

- Branch: `release` publishes immediately and merges forward; `next-release` waits for the next release cutover. Ask "should this be live now?", not "what file did I touch?". Check precedent for similar files in recent merged PRs. If unsure, use `next-release` - a wrong call there is cheap to correct.
- Fill out the PR template checklist.
