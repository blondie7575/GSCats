#!/usr/bin/python3

import sys
import PIL
from PIL import Image
from numpy import asarray

def labelFromCharXY(prefix,charFirst, charX, numCharX, charY):
	charIndex = charY*numCharX + charX
	currChar = chr(charIndex+charFirst)
	return "{:s}char{:d}".format(prefix,ord(currChar))
	
def main(argv):
	CHAR_WIDTH = int(argv[0])
	CHAR_HEIGHT = int(argv[1])
	CHAR_FIRST = int(argv[2])
	CHROMA = int(argv[3])
	prefix = argv[4]
	image = Image.open(argv[5])
	
	pixels = asarray(image)
	numCharX = (int)(image.size[0]/CHAR_WIDTH)
	numCharY = (int)(image.size[1]/CHAR_HEIGHT)
		
	# Generate jump table for glyphs
	print ("%scharacterJumpTable:" % prefix)
	for charY in range(0,numCharY):
		for charX in range(0,numCharX):
			print ("\t.addr %s" % labelFromCharXY(prefix,CHAR_FIRST,charX,numCharX,charY))
	print ("")
	
	# Generate code for each glyph
	for charY in range(0,numCharY):
		for charX in range(0,numCharX):
			
			print ("%s:\n" % labelFromCharXY(prefix,CHAR_FIRST,charX,numCharX,charY), end="")
			
			# Header for each rendering operation
			print ("\ttya")		# Transfer character VRAM position from Y to stack pointer
			print ("\ttcs")
			
			# Iterate through all the pixels
			charOriginX = charX*CHAR_WIDTH
			charOriginY = charY*CHAR_HEIGHT
			
			for charRow in reversed(range(0,CHAR_HEIGHT)):
				
				# Print a comment to make generated source easier to understand
				print ("\t; Line %d, Pixel values: " % charRow, end="")
				for grouping in range(0,CHAR_WIDTH,4):
					print("%x%x%x%x " %
						(pixels[charOriginY+charRow][charOriginX+0+grouping],
						pixels[charOriginY+charRow][charOriginX+1+grouping],
						pixels[charOriginY+charRow][charOriginX+2+grouping],
						pixels[charOriginY+charRow][charOriginX+3+grouping]), end="")
				print ("")
					
				nextRowDelta = 160
				localStackList = []
				rowPushTotal = 0	# Row-right relative
				
				for charCol in reversed(range(0,CHAR_WIDTH,4)):
					nibbles = [pixels[charOriginY+charRow][charOriginX+charCol],
								pixels[charOriginY+charRow][charOriginX+charCol+1],
								pixels[charOriginY+charRow][charOriginX+charCol+2],
								pixels[charOriginY+charRow][charOriginX+charCol+3]]
					
					word = nibbles[2]<<12 | nibbles[3]<<8 | nibbles[0]<<4 | nibbles[1]
					requiredStackIndex = charCol/2
					
					if (nibbles[0]==CHROMA and nibbles[1]==CHROMA and nibbles[2]==CHROMA and nibbles[3]==CHROMA):
						# Case 1 : All chroma, so let stack advance with no work
						pass
						
					elif (nibbles[0]!=CHROMA and nibbles[1]!=CHROMA and nibbles[2]!=CHROMA and nibbles[3]!=CHROMA):
						# Case 2 : No chroma, so fast push
						offsetNeeded = (CHAR_WIDTH/2-requiredStackIndex) - rowPushTotal - 2
						
						if (offsetNeeded>0):
							print ("\ttsc")					# Advance stack to position needed for our two byte push
							print ("\tsec")					# Note that PEA needs a little +1 to put bytes in the place we expect
							print ("\tsbc #%d" % (offsetNeeded))
							print ("\ttcs")
							nextRowDelta -= offsetNeeded
						else:
							offsetNeeded=0
						print ("\tpea $%04x" % word)
						nextRowDelta -= 2
						rowPushTotal += (2+offsetNeeded)
					else:
						# Case 3 : Mixed chroma, so mask and or
						mask = 0xFFFF
						if (nibbles[0]!=CHROMA):
							mask = mask & 0xFF0F
						if (nibbles[1]!=CHROMA):
							mask = mask & 0xFFF0
						if (nibbles[2]!=CHROMA):
							mask = mask & 0x0FFF
						if (nibbles[3]!=CHROMA):
							mask = mask & 0xF0FF
						
						sprite = word
						if (nibbles[0]==CHROMA):
							sprite = sprite & 0xFF0F
						if (nibbles[1]==CHROMA):
							sprite = sprite & 0xFFF0
						if (nibbles[2]==CHROMA):
							sprite = sprite & 0x0FFF
						if (nibbles[3]==CHROMA):
							sprite = sprite & 0xF0FF
						
						localStackEntry = [requiredStackIndex,mask,sprite]
						localStackList.append(localStackEntry)
						
				# Process any local stack work we accumulated
				if len(localStackList) > 0:
					if (rowPushTotal < CHAR_WIDTH/2):			# Get stack pointer to end of row if needed
						cleanupPush = CHAR_WIDTH/2-rowPushTotal
						print ("\ttsc")
						print ("\tsec")
						print ("\tsbc #%d" % cleanupPush)
						print ("\ttcs")
						rowPushTotal = CHAR_WIDTH/2
						nextRowDelta -= cleanupPush
						
					extraReach = rowPushTotal - CHAR_WIDTH/2 + 1		# Amount to "reach back" from one byte past end of row so LDA/STA can fill in skipped pixels
					for stackEntry in localStackList:
						print ("\tlda %d,S" % (stackEntry[0] + extraReach))				# Blend mask, sprite, and background
						print ("\tand #$%04x" % stackEntry[1])
						print ("\tora #$%04x" % stackEntry[2])
						print ("\tsta %d,S" % (stackEntry[0] + extraReach))
						
				# Advance stack pointer to next row
				print ("\ttsc")
				print ("\tsec")
				print ("\tsbc #%d" % nextRowDelta)
				print ("\ttcs")
					
			# Footer for each rendering operation
			print ("\tjmp renderCharJumpReturn\n")
			
if __name__ == "__main__":
	main(sys.argv[1:])
