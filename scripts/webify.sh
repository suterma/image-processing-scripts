#!/bin/bash

# This script optimizes all JPG images in a folder for use on the web,
# mainly by reducing the quality, and stripping the EXIF data
# Processed files get the prefix "web_" and are excluded from subsequent runs
find . -iname "*.jpg" -not -name "web_*.jpg" | while read f
do
    echo "File found: $f"
    # - try to have a useful orientation, even for messed up photos
    # - remove EXIF data for privacy reasons
    # - normalize (contrast-stretch) the intensity range
    # - NOT USED: make a web-usable aspect ratio (by cropping around the center): -gravity center -crop 4:3
    # - Max size in any direction: Full HD
    # - reasonable jpg quality    
    convert "$f" -set filename: "web_%t" -auto-orient -strip -normalize -resize '1080x1080' -quality 85% "%[filename:].jpg"
done
