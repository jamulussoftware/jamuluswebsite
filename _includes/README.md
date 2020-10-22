# _includes folder
Holds fragments/files which are included in other sites.

general/languagecode folder: includes translated fragments which are included in every site.
wiki/languagecode folder: includes translated fragments which are included in the wiki.
general/nav.html file: template for the navigation in the wiki.
footer.html file: general template for the footer.
headtags.html file: holds tags which are included in every sites' <head>. This file can not be translated.
langselect.html file: holds template to generate a language picker.

## Translate new language

* **Important**: Every file in here is required to be translated. If the file doesn't exist, the jekyll build will be broken.
* copy wiki/en to wiki/languagecode and translate contents
* copy general/languagecode and translate contents
