#!/bin/bash
# You need po4a > 0.54, see https://github.com/mquinson/po4a/releases
# There is no need of system-wide installation of po4a
# Usage: PERLLIB=/path/to/po4a/lib use_po.sh
# you may set following variables
# SRCDIR root of the documentation repository
# PODIR place where to create the po
# PUB_DIR place where to publish the localised files

####################################
# INITIALISE VARIABLES
####################################

SRCDIR_MODULE="./wiki/en"

# place where the po files are
if [ -z "$PO_DIR" ] ; then
	PO_DIR="./translator-files/l10n/po"
fi

# place where the localised files will be
if [ -z "$PUB_DIR" ] ; then
	PUB_DIR="./wiki/"
fi


####################################
# TEST IF IT CAN WORK
####################################

if [ ! -d "$SRCDIR_MODULE" ] ; then
	echo "Please run this script from the documentation' root folder"
	exit 1
fi

####################################
# REMOVE .md FILE FOLDER
####################################

cd ./wiki/
rm -rf de es fr it pt
cd ../

####################################
# DEFINE ANTARA MODULES (md files)
####################################

use_po_module () {
	lang=$1

	while IFS= read -r -d '' file
	do
		basename=$(basename -s .md "$file")
		dirname=$(dirname "$file")
		path="${dirname#$SRCDIR_MODULE/}"

		if [ "$dirname" = "$SRCDIR_MODULE" ]; then
			potname=$basename
			localized_file="$PUB_DIR/$lang/$basename.md"
		else
			potname=$path/$basename
			localized_file="$PUB_DIR/$lang/$path/$basename.md"
		fi


		po4a-translate \
			--format asciidoc \
			--master "$file" \
			--master-charset "UTF-8" \
			--po "$PO_DIR/$lang/$potname.po" \
			--localized "$localized_file" --localized-charset "UTF-8" \
			--keep 80
	done <   <(find -L "$SRCDIR_MODULE" -name "*.md"  -print0)

}

####################################
# HANDLE ANTARA MODULES (md files)
####################################

while IFS= read -r -d '' dir
do
	lang=$(basename -s .md "$dir")
	echo "$lang"
	use_po_module "$lang"

# Rename translated .md files with correct language prefixes
#    cd $PUB_DIR
#    if [ -d $lang ]; then
#       cd "$lang"
#        rename "s/^en-/$lang-/" *.md
#        cd ../
#    fi
    
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

