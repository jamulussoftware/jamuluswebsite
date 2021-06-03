#!/bin/bash
# You need po4a > 0.54, see https://github.com/mquinson/po4a/releases
# There is no need of system-wide installation of po4a
# Usage: PERLLIB=/path/to/po4a/lib make_pot.sh
# you may set following variables
# SRCDIR root of the documentation repository
# POTDIR place where to create the .pot templates


####################################
# INITIALISE VARIABLES
####################################

# root of the documentation repository
SRCDIR_MODULE="./wiki/en"

# place where to create the .pot template files
if [ -z "$POTDIR" ] ; then
    POTDIR="./translator-files/l10n/templates"
fi

# place where the po files are
if [ -z "$PO_DIR" ] ; then
	PO_DIR="./translator-files/l10n/po"
fi

####################################
# TEST IF IT CAN WORK
####################################

if [ ! -d "$SRCDIR_MODULE" ] ; then
    echo "Error, please check that SRCDIR matches the root of the documentation repository"
    echo "Your specified modules are in $SRCDIR_MODULE"
    exit 1
fi


####################################
# Process the documents
####################################

while IFS= read -r -d '' file
do
    basename=$(basename -s .md "$file")
    dirname=$(dirname "$file")
    path="${dirname#$SRCDIR_MODULE/}"

    if [ "$dirname" = "$SRCDIR_MODULE" ]; then
        potname=$basename.pot
    else
        potname=$path/$basename.pot
        mkdir -p "$POTDIR/$path"
    fi

    po4a-gettextize \
        --format asciidoc \
        --master "$file" \
        --master-charset "UTF-8" \
        --po "$POTDIR/$potname"

    for lang in $(ls "$PO_DIR" ); do

        po_file="$PO_DIR/$lang/${potname%.pot}.po"

        # po4a-updatepo would be angry otherwise
        sed -i 's/Content-Type: text\/plain; charset=CHARSET/Content-Type: text\/plain; charset=UTF-8/g' "$po_file"

        if ! po4a-updatepo \
            --format asciidoc \
            --master "$file" \
            --master-charset "UTF-8" \
            --po "$po_file" ; then
        echo ""
        echo "Error updating $lang PO file for: $adoc_file"

        fi
    done

done <   <(find -L "$SRCDIR_MODULE" -name "*.md" -print0)

echo ""
echo "REMOVE TEMPORARY FILES"

for lang in $(ls "$PO_DIR" ); do
	rm "./translator-files/l10n/po/$lang/"*.po~
done
