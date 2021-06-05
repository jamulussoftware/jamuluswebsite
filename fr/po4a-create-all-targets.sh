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

THRESHOLD="80"
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

# Check if po4a is installed
if ! [ -x "$(command -v po4a)" ] ; then
    echo 'Error: please install po4a.' >&2
    exit 1
fi

if [ ! -d "$SRCDIR_MODULE" ] ; then
	echo "Please run this script from the documentation' root folder"
	exit 1
fi

####################################
# REMOVE .md FILE FOLDER
####################################

while IFS= read -r -d '' dir
do
	lang=$(basename -s .md "$dir")
	echo "delete $lang folder"
    cd ./wiki/
	rm -rf "$lang" 
    cd ../  
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

####################################
# DEFINE ANTARA MODULES (md files)
####################################

use_po_module () {
	lang=$1

	while IFS= read -r -d '' file
	do
		basename="$(basename -s .md "$file")"
		dirname=$(dirname "$file")
		path="${dirname#$SRCDIR_MODULE/}"

		if [ "$dirname" = "$SRCDIR_MODULE" ]; then
			potname=${basename}
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
			--keep "$THRESHOLD"
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
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

