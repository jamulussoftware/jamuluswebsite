#!/bin/bash

# If the po4a cache already exists, this script copies all the dependencies to their locations.
# If not, it installs po4a and its dependencies, then copies them all to a folder to be cached/retrieved by the GH action.

if [[ "$CACHE_HIT" == 'true' ]] ; then
    sudo cp --force --recursive ~/po4a/* /
else
    sudo apt install -yq gettext libsgmls-perl libyaml-tiny-perl opensp translate-toolkit
    wget -O po4a.deb https://github.com/jamulussoftware/assets/raw/main/po4a/po4a_0.66.deb
    sudo dpkg -i po4a.deb

if [ -f po4a.deb ] ; then
    rm po4a.deb
fi

mkdir -p ~/po4a

for dep in po4a libcroco3 libosp5 sgml-base gettext libsgmls-perl libyaml-tiny-perl opensp translate-toolkit; do
    dpkg -L $dep | while IFS= read -r f; do if test -f $f; then echo $f; fi; done | xargs cp --parents --target-directory ~/po4a/
done
fi
