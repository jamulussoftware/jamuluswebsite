#!/bin/bash

# This script updates/creates .po files for every language
# po4a >= 0.63 is required, see https://github.com/mquinson/po4a/releases
# You can set the following variables:
# SRC_DIR: directory for the original documents in English. Files in sub-directories within SRC_DIR are also detected.
# PO_DIR: directory where the .po files are stored

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$SCRIPT_DIR"

# VARIABLES

# Folder where source English files are
SRC_DIR="../wiki/en"

# Directory where the po file folders are
PO_DIR="../_translator-files/po"

# CHECK FOR PO4A INSTALLATION

# Check if po4a is installed
if ! [ -x "$(command -v po4a)" ] ; then
    echo Error: Please install po4a. v0.68 or higher is required >&2
    exit 1
fi

# Check if the right version is installed
PO4A_VER=$(po4a --version | grep po4a | awk '{print $3}')

if [[ $PO4A_VER < 0.68 ]] ; then
    echo Error: po4a v"$PO4A_VER" is installed >&2
    echo po4a v0.68 or higher is required. >&2
    exit 1
fi

# Check if source document folder exists in the right place
if ! [ -d "$SRC_DIR" ] ; then
    echo Error: Please make sure the source English file directory exists. >&2
    exit 1
fi

# CREATE/UPDATE .po FILES

while IFS= read -r -d '' doc ; do

    # Get file extension
    ext=$(echo "$doc" | sed 's/.*\.//')

    # Determine target file/folder names
    filename=$(basename "$doc" .$ext)

    for lang in $(ls "$PO_DIR") ; do

        po_file="$PO_DIR/$lang/${filename}.po"

        # If a new file has been added to /wiki/en/, add message after sed error to clarify it will be created
        if ! [ -f "$po_file" ] ; then
            echo creating "$po_file"
        fi

        # Determine file format to be used and set options (configured as an array to allow adding an arbitrary number of them)
        OPTION=()
        if [ $ext == yml ] ; then
            FILE_FORMAT=yaml
            OPTION=("skip_array")
        elif [[ $ext == html || "$filename" == *'-index' ]] ; then # '-index.md' has a markdown extension but is actually html and should be processed as such by po4a
            FILE_FORMAT=xml
            OPTION=("ontagerror=warn" "attributes=<img>src <img>alt")
        elif [ $ext == md ] ; then
            FILE_FORMAT=text
            OPTION=("markdown")
        fi

        # Update/create .po files
        if ! po4a-updatepo \
            --format "$FILE_FORMAT" \
            --master "$doc" \
            --master-charset "UTF-8" \
            --msgmerge-opt  --no-wrap \
            --wrap-po newlines \
            --no-deprecation \
            "${OPTION[@]/#/--option=}" \
            --po "$po_file" ; then
        echo ''
        echo Error updating "$lang" PO file for: "$filename".$ext
        fi

    done
done <   <(find -L "$SRC_DIR" -name "*.*" -print0)

echo ''
echo Removing temporary files
for lang in $(ls "$PO_DIR") ; do

    # Check if the temporary files exist before removing them to prevent misleading error message
    temp_file="$PO_DIR/$lang/*.po~"

    if ls $temp_file 1> /dev/null 2>&1 ; then
        rm "$PO_DIR/$lang/"*.po~
    fi

    # Delete line in file header that pollutes commits
    sed -i '/^"POT-Creation-Date:/d' $PO_DIR/$lang/*.po
done
