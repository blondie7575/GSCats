#!/bin/bash
# Takes the list of gifs in the art folder and numbers them in
# increasing order. This is needed for Mr. Sprite to process them properly
# but requires that alphabetic order of sprite filenames remains consistent
counter=0
for filename in Art/*.gif
	do
		extension="${filename##*.}"
		base="${filename%.*}"
		printf -v index "%03d" $counter
		newpath=$(echo $filename | sed 's/_*[0-9]*\.gif$/\_'$index'.gif/')
		newfile=$(basename $newpath)
		cp $filename "Art/Generated/"$newfile
		((counter++))
	done

