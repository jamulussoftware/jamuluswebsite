# wiki folder

This folder holds all translated wiki pages sorted by language (en=English, es=Spanish, etc.).

## Translate

-   Copy the file you want to translate from e.g. en/ into the folder for your language code (es, de, ...).s
-   set the lang: parameter to your language code in the front matter (between at the top of the file `---`) and make sure the permalink: parameter is the same.
    ## Translate new language
    Copy e.g. the en/ folder, translate the content to your language, set the lang: attribute in the front matter of every file to lang: yourlanguagecode and move it into this folder. Don't touch the permalink since it links other pages in other languages to your language. You do **not** need to translate (and copy) every file since polyglot, the translation plugin, automatically includes a default language fallback for pages. However, you do need to create page translations in \_data/ (where the wiki navigation lives) and in \_includes. See the READEM.md files for short descriptions.
