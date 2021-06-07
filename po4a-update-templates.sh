#!/bin/bash
# You need po4a > 0.54, see https://github.com/mquinson/po4a/releases
# There is no need for system-wide installation of po4a
# You may set following variables
# SRC_DIR folder for original English .md files
# POT_DIR folder where the .pot template files are created/updated
# PO_DIR directory where .po files are stored


####################################
# INITIALISE VARIABLES
####################################

# Folder where source English .md files are
SRC_DIR="./wiki/en"

# Folder where the .pot template files are created/updated
if [ -z "$POT_DIR" ] ; then
    POT_DIR="./translator-files/l10n/templates"
fi

# Directory where the po file folders are
if [ -z "$PO_DIR" ] ; then
	PO_DIR="./translator-files/l10n/po"
fi

####################################
# TEST IF IT CAN WORK
####################################

# Check if po4a is installed
if ! [ -x "$(command -v po4a)" ] ; then
    echo 'Error: please install po4a.' >&2
    exit 1
fi

# Check if source document folder exists in the right place
if [ ! -d "$SRC_DIR" ] ; then
    echo 'Error: please run this script from the root folder'
    exit 1
fi

############################################
# CREATE/UPDATE .pot TEMPLATES and .po files
############################################

while IFS= read -r -d '' file
do
    # Determine target file/folder names
    basename=$(basename -s .md "$file")
    dirname=$(dirname "$file")
    path="${dirname#$SRC_DIR/}"

    if [ "$dirname" = "$SRC_DIR" ] ; then
        potname="$basename.pot"
    else
        potname="$path/$basename.pot"
        mkdir -p "$POT_DIR/$path"
    fi

    # Use source .md files in English to update/create .pot templates and .po files
    po4a-gettextize \
        --format asciidoc \
        --master "$file" \
        --master-charset "UTF-8" \
        --po "$POT_DIR/$potname"

    for lang in $(ls "$PO_DIR" ) ; do

        po_file="$PO_DIR/$lang/${potname%.pot}.po"

        # po4a-updatepo will complain if the following is not met
        sed -i 's/Content-Type: text\/plain; charset=CHARSET/Content-Type: text\/plain; charset=UTF-8/g' "$po_file"

        if ! po4a-updatepo \
            --format asciidoc \
            --master "$file" \
            --master-charset "UTF-8" \
            --po "$po_file" ; then
        echo ''
        echo 'Error updating $lang PO file for: $adoc_file'

        fi
    done

done <   <(find -L "$SRC_DIR" -name "*.md" -print0)

echo ''
echo 'REMOVE TEMPORARY FILES'

for lang in $(ls "$PO_DIR" ) ; do
	rm "$PO_DIR/$lang/"*.po~
done
