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
    echo "Usage: $0 <Videos Folder> <Images Folder> <delete old folders 0 | 1 >"
    exit
fi
imagesFolder="$2"

if [ "$#" -eq 2 ]; then
    echo "Usage: $0 <Videos Folder> <Images Folder> <delete old folders 0 | 1 >"
    exit
fi
delete="$3"



countImages=$( ls "$imagesFolder" | wc -l )
countVideos=$( ls "$videosFolder" | wc -l )
echo "adding $countImages images to $countVideos"

i=0

for f in $imagesFolder/*; do
	name=img__`printf %09d $i`."$EXT"
	cp $f $now/$name
	i=$((i+1))
done


for f in $videosFolder/*; do
	name=img__`printf %09d $i`."$EXT"
	cp $f $now/$name
	i=$((i+1))
done


if $delete ; then
    echo 'deleting the old folders!'

	rm -r $videosFolder
	rm -r $imagesFolder

fi