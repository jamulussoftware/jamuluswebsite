#!/bin/bash

# This script creates the target translations from the .po files
# po4a >= 0.63 is required, see https://github.com/mquinson/po4a/releases
# You can set the following variables:
# SRC_DIR: directory for the original documents in English. Files in sub-directories within SRC_DIR are also detected.
# PO_DIR: directory where the .po files are stored
# TARG_DIR: directory to publish the translated files in
# THRESH_VAL: translation % below which translated documents are not generated

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$SCRIPT_DIR"

# VARIABLES

# Set % threshold for translated .md files to be created
THRESH_VAL="80"

# Folder where source English files are
SRC_DIR="../wiki/en"

# Directory where the po file folders are
PO_DIR="../_translator-files/po"

# Directory where the translated file folders will be
TARG_DIR="../wiki"

# CHECK FOR PO4A INSTALLATION

# Check if po4a is installed
if ! [ -x "$(command -v po4a)" ] ; then
    echo Error: Please install po4a. v0.63 or higher is required >&2
    exit 1
fi

# Check if the right version is installed
PO4A_VER=$(po4a --version | grep po4a | awk '{print $3}')

if [[ $PO4A_VER < 0.63 ]] ; then
    echo Error: po4a v"$PO4A_VER" is installed >&2
    echo po4a v0.63 or higher is required. >&2
    exit 1
fi

# Check if source document folder exists in the right place
if ! [ -d "$SRC_DIR" ] ; then
    echo Error: Please make sure the source English file directory exists. >&2
    exit 1
fi

# REMOVE TARGET FILE FOLDERS IF PRESENT BEFORE REGENERATING THEM

for lang in $(ls "$PO_DIR") ; do
    if [ -d "$TARG_DIR/$lang" ] ; then
        rm -rf "$TARG_DIR/$lang"
        echo "$lang" folder deleted
    fi
done

# FUNCTION TO CREATE TARGET FILES FROM .po FILES USING PO4A

process_with_po4a () {
    lang=$1

    # Determine target file/folder names
    while IFS= read -r -d '' doc ; do

        # Get file extension
        ext=$(echo "$doc" | sed 's/.*\.//')

        # Get source doc names and set target file names and dirs
        filename=$(basename "$doc" .$ext)
        targ_doc="$TARG_DIR/$lang/$filename.$ext"

        # Files excluded from the threshold requirement
        if [[
            "$filename" == 'Shared-'* || \
            "$filename" == *'-index' || \
            "$filename" == 'footertext' || \
            "$filename" == 'general' || \
            "$filename" == 'navigation'
           ]] ; then
            THRESHOLD="0"
        else
            THRESHOLD="$THRESH_VAL"
        fi

        # Determine file format to be used
        if [ $ext == yml ] ; then
            FILE_FORMAT=yaml
        elif [ $ext == html ] ; then
            FILE_FORMAT=xml
        elif [ $ext == md ] ; then
            FILE_FORMAT=asciidoc
        fi

        # Run po4a-translate and create target files
        po4a-translate \
            --format $FILE_FORMAT \
            --master "$doc" \
            --master-charset "UTF-8" \
            --po "$PO_DIR/$lang/${filename}.po" \
            --localized "$targ_doc" \
            --localized-charset "UTF-8" \
            --keep "$THRESHOLD"

        # Display message if translated file is created
        if [ -f $targ_doc ] ; then
            echo "$filename.$ext" translated into "$lang"
        fi

    done <   <(find -L "$SRC_DIR" -name "*.*"  -print0)
}

# RUN PO4A ON EACH PO FILE LANG DIR

while IFS= read -r -d '' dir ; do
    lang=$(basename "$dir")
    echo ''
    echo "$lang":
    process_with_po4a "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

# Produce a file with translation status of all .po files
source ./po4a-stats.sh
