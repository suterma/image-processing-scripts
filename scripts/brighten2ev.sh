#!/bin/bash

# This script increases brightness of all JPG images in a folder by approximately +1 EV
# Processed files get the prefix "processed_" and are excluded from subsequent runs
find . -iname "*.jpg" -not -name "processed_*.jpg" | while read f
do
    echo "File found: $f"
    # - change brightness by 1 EV
    convert "$f" -set filename: "processed_%t" -gamma 2 "%[filename:].jpg"
done
