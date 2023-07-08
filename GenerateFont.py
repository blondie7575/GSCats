#!/usr/bin/env python3

import sys
import PIL
from PIL import Image
from numpy import asarray

CHAR_WIDTH = 8
CHAR_HEIGHT = 8
CHAR_FIRST = 32
CHROMA = 14

def main(argv):
	image = Image.open('Art/Assets/Font8x8.gif')
	pixels = asarray(image)
	numCharX = (int)(image.size[0]/CHAR_WIDTH)
	numCharY = (int)(image.size[1]/CHAR_HEIGHT)
		
	for charY in range(0,1): #numCharY):
		for charX in range(1,2): #numCharX):
			charIndex = charY*numCharX + charX
			currChar = chr(charIndex+CHAR_FIRST)
						
			print ("char%d:\n" % ord(currChar), end="")
			
			# Header for each rendering operation
			print ("\ttya")		# Transfer character VRAM position from Y to stack pointer
			print ("\ttcs")
			
			# Iteratre through all the pixels
			charOriginX = charX*CHAR_WIDTH
			charOriginY = charY*CHAR_HEIGHT
			
			for charRow in reversed(range(0,CHAR_HEIGHT)):
				print ("\t; Line %d" % charRow)
				nextRowDelta = 160
				for charCol in reversed(range(0,CHAR_WIDTH,4)):
					nibbles = [pixels[charOriginY+charRow][charOriginX+charCol],
								pixels[charOriginY+charRow][charOriginX+charCol+1],
								pixels[charOriginY+charRow][charOriginX+charCol+2],
								pixels[charOriginY+charRow][charOriginX+charCol+3]]
					
					word = nibbles[2]<<12 | nibbles[3]<<8 | nibbles[0]<<4 | nibbles[1]
					
					if (nibbles[0]==CHROMA and nibbles[1]==CHROMA and nibbles[2]==CHROMA and nibbles[3]==CHROMA):
						pass							# Case 1 : All chroma, so let stack advance with no work
					elif (nibbles[0]!=CHROMA and nibbles[1]!=CHROMA and nibbles[2]!=CHROMA and nibbles[3]!=CHROMA):
						print ("\tpea $%04x" % word)	# Case 2 : No chroma, so fast push
						nextRowDelta -= 2
					else:
						mask = 0						# Case 3 : Mixed chroma, so mask and or
						if (nibbles[0]!=CHROMA):
							mask = mask | 0xFF0F
						if (nibbles[1]!=CHROMA):
							mask = mask | 0xFFF0
						if (nibbles[2]!=CHROMA):
							mask = mask | 0x0FFF
						if (nibbles[3]!=CHROMA):
							mask = mask | 0xF0FF
						
						sprite = word
						if (nibbles[0]==CHROMA):
							sprite = sprite & 0xFF0F
						if (nibbles[1]==CHROMA):
							sprite = sprite & 0xFFF0
						if (nibbles[2]==CHROMA):
							sprite = sprite & 0x0FFF
						if (nibbles[3]==CHROMA):
							sprite = sprite & 0xF0FF
						
						print ("\ttsc")					# Keep stack moving, even though we didn't use it
						print ("\tdec")
						print ("\tdec")
						print ("\ttcs")
						print ("\tlda 0,S")				# Blend mask, sprite, and background
						print ("\tand #$%04x" % mask)
						print ("\tora #$%04x" % sprite)
						print ("\tsta 0,S")
						nextRowDelta -= 2
				
				# Advance stack pointer to next row
				print ("\ttsc")
				print ("\tsec")
				print ("\tsbc #%d" % nextRowDelta)
				print ("\ttcs")
					
			# Footer for each rendering operation
			print ("\tjmp returnFromTest")
			
if __name__ == "__main__":
	main(sys.argv[1:])
