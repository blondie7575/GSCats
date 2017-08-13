#!/usr/bin/env python3

import sys


def main(argv):

	# Prologue
	print ("vramYOffset:",end="")
	rowCount = 19
	
	for jump in range(0,200):
		rowCount += 1
		if (rowCount==20):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("$%04x" % (jump*160), end="")
		if (rowCount<19):
			print (",", end="")


if __name__ == "__main__":
	main(sys.argv[1:])
	
