#!/bin/bash


# Stats file location
STATS_FILE="../wiki/Statistics.md"

# Print yaml front matter and table title/header
echo '---
layout: wiki
title: "Statistics"
lang: "en"
permalink: "/wiki/Statistics"
---
# Current status of website translations

| Language | Document | Translation status |
|----------|----------|--------------------|' >> "$STATS_FILE"

produce_stats () {
# Determine file names
	while IFS= read -r -d '' file ; do
		basename="$(basename -s .md "$file")"

		# Stats printed to translator-files/statistics.md
		echo -n "|**"$lang"**| **"$basename".po**|" >> "$STATS_FILE"
		msgfmt --statistics "$PO_DIR/$lang/$basename".po &>> "$STATS_FILE"

	done <   <(find -L "$SRC_DIR" -name "*.md"  -print0)

	# Separator between languages
	echo '|**-----**|**--------------------**|**--------------------**|' >> "$STATS_FILE"
}

# Run produce_stats on each language folder
while IFS= read -r -d '' dir ; do
	lang=$(basename -s .md "$dir")
	produce_stats "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

# Remove unwanted messages.mo file created by msgfmt
rm -f *.mo

echo Statistics file created
