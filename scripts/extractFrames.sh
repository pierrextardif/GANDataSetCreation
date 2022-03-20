#!/bin/bash

echo "** Frames extractions from videos started ** "
echo "** This script will create a folder with all images from the videos using FFmpeg ** "
echo "** second argument is fps ** "


rootFolder=$(pwd)
now=Videos_$(date '+%d_%m_%Y_%H_%M_%S')
EXT=jpeg
TMP=tmp


mkdir "$TMP"
mkdir "$now"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <Videos Folder> < fps >"
    exit
fi
VideosFolder="$1"

if [ "$#" -eq 1 ]; then
    echo "Usage: $0 <Videos Folder> < fps >"
    exit
fi
fps="$2"


echo "extracting the frames from all videos now"
i=0
for f in $VideosFolder/*.mov; do
	echo "original name Folder = "$f 
	ffmpeg -i $f -vf fps=$fps -f image2 -qscale:v 2 $TMP/image_"$i"_%5d."$EXT"
	echo $i
	i=$((i+1))
done

count=$( ls "$now" | wc -l )
echo "we have $count images extracted"
echo "renaming the frames"

i=0

for f in $TMP/*; do
	name=img__`printf %06d $i`."$EXT"
	mv $f $now/$name
	i=$((i+1))
done


sudo rm -r $TMP
