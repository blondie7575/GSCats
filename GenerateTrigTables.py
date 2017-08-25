#!/usr/bin/env python3

import sys
import math


def twosCompliment(value):
	return (value^65535)+1

def toFixed124(flt):		# Floating point to 12.4 fixed point
	whole = max(-2048, min(2047, math.trunc(flt)))	# Clamp to signed range
	frac = abs(flt)%1
	binary = (abs(whole)<<4) + math.trunc(16*frac)
	
	if (flt<0 and abs(flt)>0.06):
		binary = twosCompliment(binary)
	
	return binary


def toFixed88(flt):		# Floating point to 8.8 fixed point
	whole = max(-128, min(127, math.trunc(flt)))	# Clamp to signed range
	frac = abs(flt)%1
	binary = (abs(whole)<<8) + math.trunc(256*frac)
	
	if (flt<0 and abs(flt)>0.0037):
		binary = twosCompliment(binary)
	
	return binary


def main(argv):

	print ("sineTable:\t\t; 8.8 fixed point",end="")
	rowCount = 7
	
	for v in range(0,512):
		rowCount += 1
		if (rowCount==8):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("$%04x" % (int)(math.sin((2*3.14159)/256 * v%256)*128+128), end="")
		if (rowCount<7):
			print (",", end="")


	print ("\n\nangleToVectorX:\t\t; 8.8 fixed point, counterclockwise angle, +x=(1,0)",end="")
	rowCount = 11
	
	for v in range(0,360):
		rowCount += 1
		if (rowCount==12):
			print ("\n\t.word ", end="")
			rowCount=0
	
		print ("$%04x" % toFixed88(math.cos(math.radians(v))), end="")
		if (rowCount<11):
			print (",", end="")


	print ("\n\nangleToVectorY:\t\t; 8.8 fixed point, counterclockwise angle, +x=(1,0)",end="")
	rowCount = 11
	
	for v in range(0,360):
		rowCount += 1
		if (rowCount==12):
			print ("\n\t.word ", end="")
			rowCount=0
		
		print ("$%04x" % toFixed88(math.sin(math.radians(v))), end="")
		if (rowCount<11):
			print (",", end="")

	print ("\n\n")

if __name__ == "__main__":
	main(sys.argv[1:])
	
