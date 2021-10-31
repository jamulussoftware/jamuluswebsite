#!/bin/bash

# Creates a statistics file with information on the translation status of each file for every language.

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
    while IFS= read -r -d '' doc ; do

        # Get file extension
        ext=$(echo "$doc" | sed 's/.*\.//')

        filename=$(basename "$doc" .$ext)

        # Stats printed to Statistics.md
        echo -n "|**"$lang"**| **"$filename".po**|" >> "$STATS_FILE"
        msgfmt --statistics "$PO_DIR/$lang/$filename".po &>> "$STATS_FILE"

    done <   <(find -L "$SRC_DIR" -name "*.*"  -print0)

    # Separator between languages
    echo '|**-----**|**--------------------**|**--------------------**|' >> "$STATS_FILE"
}

# Run produce_stats on each language folder
while IFS= read -r -d '' dir ; do
    lang=$(basename "$dir")
    produce_stats "$lang"
done <   <(find "$PO_DIR" -mindepth 1 -maxdepth 1 -type d -print0)

# Remove unwanted messages.mo file created by msgfmt
rm -f *.mo

echo Statistics file created
