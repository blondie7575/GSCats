#!/bin/bash

############################################
# Takes a list of WAV files for the sound effects,
# downsamples them to GS-friendly rates,
# and packs them into a 64k block that can
# be loaded into Ensoniq RAM
#
# IMPORTANT: This depends on sox, which MacOS doesn't have natively.
# You can get it from Homebrew ("brew install sox")
#
# Big thanks to Jeremy Rand, from whom this approach
# borrows heavily
# https://github.com/jeremysrand/BuGS/blob/master/BuGS/sound/sources/createRaw

rm -f "SoundBank#060000"
rm -f "Sound/SoundMap.txt"

currAddr=0

for (( index=1; index<="$#"; index+=2 )); do
	waveFilePath=${!index}
	
	# Downsample and convert to 8-bit unsigned raw waveform
	rateIndex=$((index+1))
	rate=${!rateIndex}
	sox "$waveFilePath" -c 1 -r "$rate" --bits 8 --encoding unsigned tempSound.raw
	
	waveFile=$(basename -- "$waveFilePath")
	rawFile="Sound/Generated/${waveFile%.wav}.raw"
	
	# Replace any 00 bytes with 01 because 00 is the terminator for Ensoniq
	LC_ALL=C tr < tempSound.raw '\000' '\001' > "$rawFile"
	rm tempSound.raw
	
	# Null-terminate the waveform
	rawSize=`stat -f '%z' "$rawFile"`
	dd if=/dev/zero bs=1 count=1 >> "$rawFile"
		
	# Pad the file out to a wavetable page boundary
	rawSize=`stat -f '%z' "$rawFile"`
	pageSize=`echo "a=$rawSize; b=4096; if ( a%b ) (a/b+1)*4096 else a/b*4096" | bc`
	let "padding = $pageSize - $rawSize"
	dd if=/dev/zero bs=1 count="$padding" >> "$rawFile"
	
	# Concatenate to our soundbank
	cat "$rawFile" >> "SoundBank#060000"
	
	# Update the human-readable sound map (so human can modify loading code as needed)
	soundName="${waveFile%.wav}"
	printf "$%04x\t%s\t%d bytes\t%d Hz\n" "$currAddr" "$soundName" "$pageSize" "$rate" >> "Sound/SoundMap.txt"
	
	# Increment address for next sound in bank
	currAddr=$((currAddr+pageSize))

done

echo
echo "Sound RAM mapping:"
cat "Sound/SoundMap.txt"

