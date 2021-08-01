#!/bin/bash

if [[ "$CACHE_HIT" == 'true' ]]; then
	sudo cp --force --recursive ~/po4a/* /
else
	sudo apt install -yq gettext libsgmls-perl libyaml-tiny-perl opensp
	wget -O po4a.deb https://github.com/jamulussoftware/assets/raw/main/po4a/po4a_0.64-alpha.deb
	sudo dpkg -i po4a.deb
	mkdir -p ~/po4a

for dep in po4a libcroco3 libosp5 sgml-base gettext libsgmls-perl libyaml-tiny-perl opensp; do
	dpkg -L $dep | while IFS= read -r f; do if test -f $f; then echo $f; fi; done | xargs cp --parents --target-directory ~/po4a/
done
fi
