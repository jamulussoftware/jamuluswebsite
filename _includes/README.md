# _includes folder
Holds fragments/files which are included in other sites.

* wiki/languagecode folder: includes translated fragments which are included in the wiki. These files must be present for every translated language.
* general/nav.html file: template for the navigation in the wiki.
* footer.html file: general template for the footer.
* headtags.html file: holds tags which are included in every sites' <head>.
* langselect.html file: holds template to generate a language picker.

## Translate new language

* **Important**: Every file in wiki/yourlanguagecode here **must** be translated. If the file doesn't exist, the jekyll build will be broken.
* copy wiki/en to wiki/languagecode and translate contents
