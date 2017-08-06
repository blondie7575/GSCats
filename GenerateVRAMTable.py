#!/usr/bin/env python3

import sys


def main(argv):

	# Prologue
	print ("vramRowEndsMinusOne:",end="")
	v = 0x20a0
	rowCount = 19
	
	for jump in range(0,200):
		rowCount += 1
		if (rowCount==20):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("$%x" % (v-1), end="")
		if (rowCount<19):
			print (",", end="")
		v += 160


if __name__ == "__main__":
	main(sys.argv[1:])
	
