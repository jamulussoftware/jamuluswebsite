#!/bin/bash
# You need po4a >= 0.63, see https://github.com/mquinson/po4a/releases
# There is no need for system-wide installation of po4a
# You may set the following variables:
# SRC_DIR folder for original source English .md files
# PO_DIR directory where .po files are stored
# PUB_DIR directory to publish the localised files in
# THRESHOLD translation % below which translated .md files are not generated

# Sometimes the script needs help to establish where it is in the file system
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$SCRIPT_DIR"

####################################
# INITIALISE VARIABLES
####################################

# Set % threshold for translated .md files to be created
THRESHOLD="80"

# Folder where source English .md files are
SRC_DIR="../wiki/en"

# Directory where the po file folders are
if [ -z "$PO_DIR" ] ; then
	PO_DIR="../_translator-files/po"
fi

# Directory where the translated file folders will be
if [ -z "$PUB_DIR" ] ; then
	PUB_DIR="../wiki"
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

##################################################
# REMOVE .md FILE FOLDERS BEFORE REGENERATING THEM
##################################################

for lang in $(ls "$PO_DIR") ; do
	rm -rf "$PUB_DIR/$lang"
	echo "$lang" folder deleted
done

########################################################
# FUNCTION TO CREATE .md FILES FROM .po FILES USING PO4A
########################################################

use_po_module () {
	lang=$1

    # Determine target file/folder names
	while IFS= read -r -d '' file ; do
		basename=$(basename -s .md "$file")
		dirname=$(dirname "$file")
		path="${dirname#$SRC_DIR/}"

		if [ "$dirname" = "$SRC_DIR" ] ; then
			localized_file="$PUB_DIR/$lang/$basename.md"
		else
			localized_file="$PUB_DIR/$lang/$path/$basename.md"
		fi

		# Run po4a-translate and create target files
		po4a-translate \
			--format asciidoc \
			--master "$file" \
			--master-charset "UTF-8" \
			--po "$PO_DIR/$lang/${basename}.po" \
			--localized "$localized_file" --localized-charset "UTF-8" \
			--keep "$THRESHOLD"

		# Display message if translated file is created
		trans_file="$PUB_DIR/$lang/$basename.md"

		if [ -f $trans_file ] ; then
		    echo "$basename".md translated into "$lang"
		fi

	done <   <(find -L "$SRC_DIR" -name "*.md"  -print0)
}

##########################################################
# LOOK INTO EACH .po FILE DIR AND RUN PO4A ON EACH OF THEM
##########################################################

while IFS= read -r -d '' dir ; do
	lang=$(basename -s .md "$dir")
	echo "$lang"
	use_po_module "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)
