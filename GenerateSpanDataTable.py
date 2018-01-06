#!/usr/bin/env python3

import sys


def main(argv):
	
	print ("terrainSpanDataPtr:",end="")
	rowCount = 19
	MAXTERRAINHEIGHT = 100	# Must match assembly code!
	
	for jump in range(0,MAXTERRAINHEIGHT):
		rowCount += 1
		if (rowCount==20):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("SPANROWSIZE*%d" % (jump), end="")
		if (rowCount<19):
			print (",", end="")


if __name__ == "__main__":
	main(sys.argv[1:])

