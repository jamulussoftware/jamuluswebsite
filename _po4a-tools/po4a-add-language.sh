#!/bin/bash

# This script creates files, dirs and symlinks when a new language is added.
# It also adds the new language code to the array in _config.yml.

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$SCRIPT_DIR"

# Create and populate .po file folder
mkdir ../_translator-files/po/$new_lang
echo ''
echo .po file folder created for "$new_lang"
echo Creating .po files for "$new_lang"
./po4a-update-templates.sh

# Go to root directory
cd ../

# Create symlinks for 1-index.md file
ln -s -r ./wiki/$new_lang/1-index.md ./1-$new_lang-index.md
if [ $(echo $?) == 0 ] ; then
    echo ''
    echo 1-"$new_lang"-index.md symlink created for "$new_lang" in /
else
    echo Error creating 1-"$new_lang"-index.md symlink in /
    exit 1
fi

# Add new language to array in _config.yml
sed -i "s/\(\[\"en\",\)/\1 \"$new_lang\",/" _config.yml
if [ $(echo $?) == 0 ] ; then
    echo "$new_lang" added to language array in _config.yml
else
    echo Error adding "$new_lang" to language array in _config.yml
    exit 1
fi

# Create images folder for new language
if [ ! -d "./assets/img/$new_lang-screenshots" ] ; then
    cp -frp ./assets/img/en-screenshots -T ./assets/img/$new_lang-screenshots
    echo Screenshots created for "$new_lang" in ./assets/img/"$new_lang"-screenshots/
else
    echo Error: screenshots folder for "$new_lang" seems to already exist
fi
