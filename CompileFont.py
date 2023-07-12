#!/usr/bin/python3

import sys
import PIL
from PIL import Image
from numpy import asarray

CHAR_WIDTH = 8
CHAR_HEIGHT = 8
CHAR_FIRST = 32
CHROMA = 14

def labelFromCharXY(charX, numCharX, charY):
	charIndex = charY*numCharX + charX
	currChar = chr(charIndex+CHAR_FIRST)
	return "char{:d}".format(ord(currChar))
	
def main(argv):
	image = Image.open('Art/Assets/Font8x8.gif')
	pixels = asarray(image)
	numCharX = (int)(image.size[0]/CHAR_WIDTH)
	numCharY = (int)(image.size[1]/CHAR_HEIGHT)
		
	# Generate jump table for glyphs
	print ("characterJumpTable:")
	for charY in range(0,numCharY):
		for charX in range(0,numCharX):
			print ("\t.addr %s" % labelFromCharXY(charX,numCharX,charY))
	print ("")
	
	# Generate code for each glyph
	for charY in range(0,numCharY):
		for charX in range(0,numCharX):
			
			print ("%s:\n" % labelFromCharXY(charX,numCharX,charY), end="")
			
			# Header for each rendering operation
			print ("\ttya")		# Transfer character VRAM position from Y to stack pointer
			print ("\ttcs")
			
			# Iterate through all the pixels
			charOriginX = charX*CHAR_WIDTH
			charOriginY = charY*CHAR_HEIGHT
			
			for charRow in reversed(range(0,CHAR_HEIGHT)):
				print ("\t; Line %d, Pixel values: %x%x%x%x %x%x%x%x" % (charRow,
					pixels[charOriginY+charRow][charOriginX+0],
					pixels[charOriginY+charRow][charOriginX+1],
					pixels[charOriginY+charRow][charOriginX+2],
					pixels[charOriginY+charRow][charOriginX+3],
					pixels[charOriginY+charRow][charOriginX+4],
					pixels[charOriginY+charRow][charOriginX+5],
					pixels[charOriginY+charRow][charOriginX+6],
					pixels[charOriginY+charRow][charOriginX+7]))
					
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
						print ("\ttsc")					# Case 1 : All chroma, so let stack advance with no work
						print ("\tdec")
						print ("\tdec")
						print ("\ttcs")
						nextRowDelta-=2
						rowPushTotal +=2
					elif (nibbles[0]!=CHROMA and nibbles[1]!=CHROMA and nibbles[2]!=CHROMA and nibbles[3]!=CHROMA):
						offsetNeeded = (CHAR_WIDTH/2-requiredStackIndex) - rowPushTotal - 2
						if (offsetNeeded>0):
							print ("\ttsc")					# Advance stack to position needed for our two byte push
							print ("\tsec")					# Note that PEA needs a little +1 to put bytes in the place we expect
							print ("\tsbc #%d" % (offsetNeeded+1))
							print ("\ttcs")
						print ("\tpea $%04x" % word)	# Case 2 : No chroma, so fast push
						nextRowDelta -= 3
						rowPushTotal += (3+offsetNeeded)
					else:
						mask = 0xFFFF					# Case 3 : Mixed chroma, so mask and or
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
						nextRowDelta -= 2
						
				# Process any local stack work we accumulated
				if len(localStackList) > 0:
					if (rowPushTotal < CHAR_WIDTH/2):			# Get stack pointer to end of row if needed
						print ("\ttsc")
						print ("\tsec")
						print ("\tsbc #%d" % (CHAR_WIDTH/2-rowPushTotal))
						print ("\ttcs")
						rowPushTotal = CHAR_WIDTH/2
					
					extraReach = rowPushTotal - CHAR_WIDTH/2
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
