#!/bin/bash

echo "** This script will add the images to the already extracted frames ** "


rootFolder=$(pwd)
now=Videos_$(date '+%d_%m_%Y_%H_%M_%S')
EXT=jpeg

mkdir "$now"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <Videos Folder> <Images Folder>"
    exit
fi
videosFolder="$1"

if [ "$#" -eq 1 ]; then
    echo "Usage: $0 <Videos Folder> <Images Folder>"
    exit
fi
imagesFolder="$2"



count=$( ls "$imagesFolder" | wc -l )
echo "adding $count images"

i=0

for f in $imagesFolder/*; do
	name=img__`printf %09d $i`."$EXT"
	mv $f $now/$name
	i=$((i+1))
done


for f in $videosFolder/*; do
	name=img__`printf %09d $i`."$EXT"
	mv $f $now/$name
	i=$((i+1))
done


rm -r $videosFolder
rm -r $imagesFolder