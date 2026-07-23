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

- Target `next-release` if the change needs translation, `release` if not (README's workflow section explains which).
- Fill out the PR template checklist.
