#!/bin/bash

# This script creates files, dirs and symlinks when a new language is added.
# It also adds the new language code to the array in _config.yml.

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$SCRIPT_DIR"

# Create and populate .po file folder
mkdir ../_translator-files/po/$lang_code
echo ''
echo .po file folder created for "$lang_code"
echo Creating .po files for "$full_lang"
./po4a-update-templates.sh

# Go to root directory
cd ../

# Create symlinks for 1-index.md file
ln -s -r ./wiki/$lang_code/1-index.md ./1-$lang_code-index.md
if [ $(echo $?) == 0 ] ; then
    echo ''
    echo 1-"$lang_code"-index.md symlink created for "$full_lang" in /
else
    echo Error creating 1-"$lang_code"-index.md symlink in /
    exit 1
fi

# Add new language to _config.yml
sed -i "s/\(\[\"en\",\)/\1 \"$lang_code\",/" _config.yml
sed -i "/^language_names:/a\  $lang_code: $full_lang" _config.yml

if [ $(echo $?) == 0 ] ; then
    echo "$lang_code" added to _config.yml
else
    echo Error adding "$lang_code" to _config.yml
    exit 1
fi

# Create images folder for new language
if [ ! -d "./assets/img/$lang_code-screenshots" ] ; then
    cp -frp ./assets/img/en-screenshots -T ./assets/img/$lang_code-screenshots
    echo Screenshots created for "$full_lang" in ./assets/img/"$lang_code"-screenshots/
else
    echo Error: screenshots folder for "$full_lang" seems to already exist
fi
