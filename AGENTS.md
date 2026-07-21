# Jamulus Website — Agent Instructions

Content repo for jamulus.io (wiki/docs). English is the source of truth — edits land in English first, then flow to other languages via Weblate/po4a.

Docs: [README.md](README.md) (workflow, translation process, branch targeting), [Style and Tone guide](https://jamulus.io/contribute/Style-and-Tone) (voice, terminology, capitalisation — applies to agents without exception).

## Rules

- Smallest possible PRs: one logical change each.
- Edit English source `.md` files only — never hand-edit translated-language files or `.po` files; those belong to translators via Weblate.
- **No smart/curly quotes or apostrophes** (`’ “ ”`) — always straight ASCII `'` and `"`. This isn't a style preference: a curly character pasted into a shell single-quoted string, JSON, a regex, or a code span is not the character the parser expects, and corrupts it silently. Word/Google Docs autocorrect and some LLM output insert these by default — check for them explicitly before opening a PR, especially near any code span or CLI example.
- Prefer hedged phrasing over absolute claims where the claim isn't a hard limit (e.g. "discouraged" over "not recommended", "up to N" over "less than N") — follows the guide's "give solutions first, avoid overly stylised language" principle.
- British English spelling (colour, minimise, centre).
- Match established terminology exactly: Server/Client (capitalised = a Jamulus app instance) vs. server/client (lowercase = the physical/cloud machine); "person" not "musician"; "sound card" vs. "audio interface" — full list in Style-and-Tone.md.

## Submit

- Target `next-release` if the change needs translation, `release` if not (README's workflow section explains which).
- Fill out the PR template checklist.
