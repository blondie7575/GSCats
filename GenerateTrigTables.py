#!/usr/bin/env python3

import sys
import math


def main(argv):

	# Prologue
	print ("sineTable:",end="")
	rowCount = 7
	
	for v in range(0,512):
		rowCount += 1
		if (rowCount==8):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("$%04x" % (int)(math.sin((2*3.14159)/512 * v)*256+256), end="")
		if (rowCount<7):
			print (",", end="")


if __name__ == "__main__":
	main(sys.argv[1:])
	
