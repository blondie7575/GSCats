#!/usr/bin/python3

import sys
import PIL
from PIL import Image
from numpy import asarray

def main(argv):
	image = Image.open(argv[0])
	outputFilename = argv[1]
	pixels = asarray(image)
	
	with open(outputFilename, 'bw') as output:
		for y in range(0,image.size[1]):
			for x in range(0,image.size[0],2):
				highPixel = pixels[y][x] << 4
				lowPixel = pixels[y][x+1]
				byte = highPixel | lowPixel
				output.write(bytes([byte]))

if __name__ == "__main__":
	main(sys.argv[1:])


