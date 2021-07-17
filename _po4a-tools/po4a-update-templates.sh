#!/bin/bash
# You need po4a >= 0.63, see https://github.com/mquinson/po4a/releases
# There is no need for system-wide installation of po4a
# You may set following variables:
# SRC_DIR folder for original English .md files
# PO_DIR directory where .po files are stored

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$SCRIPT_DIR"


####################################
# INITIALISE VARIABLES
####################################

# Folder where source English .md files are
SRC_DIR="../wiki/en"

# Directory where the po file folders are
if [ -z "$PO_DIR" ] ; then
	PO_DIR="../_translator-files/po"
fi

####################################
# TEST IF IT CAN WORK
####################################

# Check if po4a is installed
if ! [ -x "$(command -v po4a)" ] ; then
	echo Error: please install po4a. >&2
	exit 1
fi

# Check if the right version is installed
if ! [[ $(po4a --version | grep po4a | awk '{print $3}') > 0.63 ]] ; then
	echo Error: po4a version 0.63 or higher is required. >&2
	exit 1
fi

# Check if source document folder exists in the right place
if ! [ -d "$SRC_DIR" ] ; then
	echo Error: please run this script from the root folder. >&2
	exit 1
fi

####################################
# CREATE/UPDATE .po FILES
####################################

while IFS= read -r -d '' file ; do
    # Determine target file/folder names
    basename=$(basename -s .md "$file")

    for lang in $(ls "$PO_DIR") ; do

        po_file="$PO_DIR/$lang/${basename}.po"

        # po4a-updatepo will complain if the following is not met
        sed -i 's/Content-Type: text\/plain; charset=CHARSET/Content-Type: text\/plain; charset=UTF-8/g' "$po_file"

        # If a new file has been added to /wiki/en/, add message after sed error to clarify it will be created
        if ! [ -f "$po_file" ] ; then
            echo creating "$po_file"
        fi

        if ! po4a-updatepo \
            --format asciidoc \
            --master "$file" \
            --master-charset "UTF-8" \
            --po "$po_file" ; then
        echo ''
        echo Error updating "$lang" PO file for: "$basename.md"
        fi
    done
done <   <(find -L "$SRC_DIR" -name "*.md" -print0)

echo ''
echo Removing temporary files

for lang in $(ls "$PO_DIR") ; do

    # Check if the temporary files exist before removing them to prevent misleading error message
    temp_file="$PO_DIR/$lang/*.po~"

    if ls $temp_file 1> /dev/null 2>&1 ; then
	    rm "$PO_DIR/$lang/"*.po~
    fi
done
