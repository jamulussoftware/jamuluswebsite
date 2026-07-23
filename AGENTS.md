# Jamulus Website — Agent Instructions

Content repo for jamulus.io (wiki/docs). English is the source of truth — edits land in English first, then flow to other languages via Weblate/po4a.

Docs: [README.md](README.md) (workflow, translation process, branch targeting), [Style and Tone guide](https://jamulus.io/contribute/Style-and-Tone) (voice, terminology, capitalisation — applies to agents without exception).

## Rules

- Smallest possible PRs: one logical change each.
- Edit English source `.md` files only — never hand-edit translated-language files or `.po` files; those belong to translators via Weblate.
- **Punctuation**: follow the Punctuation section in Style-and-Tone.md (dash/hyphen choice, curly vs. straight quotes, ellipsis). Word/Google Docs autocorrect and some LLM output insert curly characters by default even inside code — before opening a PR, check your diff specifically for stray curly quotes/dashes near any code span, CLI example, or other machine-parsed value.
- Prefer hedged phrasing over absolute claims where the claim isn't a hard limit (e.g. "discouraged" over "not recommended", "up to N" over "less than N") — follows the guide's "give solutions first, avoid overly stylised language" principle.
- British English spelling (colour, minimise, centre).
- Match established terminology exactly: Server/Client (capitalised = a Jamulus app instance) vs. server/client (lowercase = the physical/cloud machine); "person" not "musician"; "sound card" vs. "audio interface" — full list in Style-and-Tone.md.

## Submit

- Branch targeting is genuinely case by case (maintainers' own assessment) — there's no reliable rule like "translated content → next-release." Mechanically: a merge to `release` publishes to production immediately and is auto-merged forward into `next-release` (see `.github/workflows/main.yml`); `next-release` only reaches production later, when a maintainer opens a release PR and squashes it into `release`. So the real question is "should this go live right now, or wait for the next release cutover?", not what kind of file you touched — `contribute/en/` and `_posts/` changes have gone directly to `release` in some PRs and to `next-release` in others.
- Before opening the PR, check recent precedent for files like the ones you're touching, e.g. `gh pr list --repo jamulussoftware/jamuluswebsite --base release --state merged --limit 30 --json title,files` and the same with `--base next-release`. If you still can't tell, say so explicitly in the PR description and let a maintainer redirect it rather than guessing silently.
- When truly unsure and precedent doesn't settle it, default to `next-release` — an off-base call there is cheap to correct before it ever goes live, unlike one on `release`.
- Fill out the PR template checklist.
