# Contribute

Thanks for your support! Please open a pull request on GitHub!

## Translating

Translations are handled by the [Polyglot jekyll Plug-in](https://github.com/untra/polyglot).
If you want to translate a file, you must first know where it is located on this repo:

-   The homepage is located in the repo root and named [langcode]-index.html
-   The wiki content can be found in the wiki folder (and the navigation of the wiki in the \_data/yourlanguagecode/wiki folder). Make sure to read the README.md file in the wiki/ folder.
-   General translations which e.g. are included in multiple pages can be found in the \_includes/general/yourlanguagecode folder.

To translate a file, please duplicate it and change the lang: attribute to the language you want to translate it to. If you want to translate an English page to German, you need to change the lang: "en" attribute to lang: "de". This attribute can be found at the top of the file in the front matter (right at the top in between the `---`). Do not change the permalink attribute. It links pages with the same content but different languages and enables polyglot to know which page to change to if you change the language via the language picker.

### Adding a new language

If you want to add a new language, you must follow the instructions on the polyglot site and add the folders/files. At least the footer, the main includes in the wiki (see \_includes/), the Wiki navigation (see the \_data/ folder) and the Homepage (see the index.html file in the root of this repo) must be translated. Have a look at the README.md files in these folders. Also make sure to add your language to the \_config.yml file (in the languages array.)

## Contribute to the design/site structure

Since this page uses jekyll, please have a look at the [jekyll documentation](https://jekyllrb.com/docs/).
This project uses the fox css framework. See the [FOX-CSS documentation](http://www.fox-css.com/documents/).
CSS files can be found in the assets/css folder.
The \_layouts folder holds the main layouts for the page.
More information can be found at the README.md files in (almost) every folder.
