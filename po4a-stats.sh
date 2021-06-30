#!/bin/bash
# You need gettext
# You may set the following variables:
# SRC_DIR folder for original source English .md files
# PO_DIR directory where .po files are stored

# Folder where source English .md files are
#SRC_DIR="./wiki/en"

# Directory where the po file folders are
#if [ -z "$PO_DIR" ] ; then
#	PO_DIR="./translator-files/po"
#fi

# Remove stats file before creating new one
rm -f "translator-files/statistics"

produce_stats () { 
# Determine file names
	while IFS= read -r -d '' file ; do
		basename="$(basename -s .md "$file")"
		
		# Stats printed to translator-files/statistics.txt
		echo "$lang"/"$basename".po >> translator-files/statistics
		msgfmt --statistics "$PO_DIR/$lang/$basename".po &>> translator-files/statistics
		echo '' >> translator-files/statistics
		
	done <   <(find -L "$SRC_DIR" -name "*.md"  -print0)
	echo '' >> translator-files/statistics
}

# Run produce_stats on each language folder
while IFS= read -r -d '' dir ; do
	lang=$(basename -s .md "$dir")
	echo "$lang": >> translator-files/statistics
	produce_stats "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

echo Statistics file created

