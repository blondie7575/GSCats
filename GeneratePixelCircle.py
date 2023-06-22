#!/usr/bin/env python3

import sys
import math

def main(argv):

	print ("pixelCircle90X:\t\t; X values of half a 90 pixel-radius circle, indexed by angle",end="")
	print ("\n\t.word ", end="")
	
	rowCount=0
	endAngle = 181
	
	for y in range(0,endAngle):
		x = math.trunc(math.cos(math.radians(y)) * 90)
		print ("%d" % x, end="")
		
		rowCount += 1
		if (rowCount<10 and y<endAngle-1):
			print (",", end="")
		elif (y<endAngle-1):
			print ("\n\t.word ", end="")
			rowCount=0
	
	print("")

	print ("\npixelCircle90Y:\t\t; Y values of half a 90 pixel-radius circle, indexed by angle",end="")
	print ("\n\t.word ", end="")
	
	rowCount=0
	endAngle = 181
	
	for x in range(0,endAngle):
		y = math.trunc(math.sin(math.radians(x)) * 90)
		print ("%d" % y, end="")
		
		rowCount += 1
		if (rowCount<10 and x<endAngle-1):
			print (",", end="")
		elif (x<endAngle-1):
			print ("\n\t.word ", end="")
			rowCount=0
	
	print("")

	print ("pixelCircle45X:\t\t; X values of half a 45 pixel-radius circle, indexed by angle",end="")
	print ("\n\t.word ", end="")
	
	rowCount=0
	endAngle = 181
	
	for y in range(0,endAngle):
		x = math.trunc(math.cos(math.radians(y)) * 45)
		print ("%d" % x, end="")
		
		rowCount += 1
		if (rowCount<10 and y<endAngle-1):
			print (",", end="")
		elif (y<endAngle-1):
			print ("\n\t.word ", end="")
			rowCount=0
	
	print("")

	print ("\npixelCircle45Y:\t\t; Y values of half a 45 pixel-radius circle, indexed by angle",end="")
	print ("\n\t.word ", end="")
	
	rowCount=0
	endAngle = 181
	
	for x in range(0,endAngle):
		y = math.trunc(math.sin(math.radians(x)) * 45)
		print ("%d" % y, end="")
		
		rowCount += 1
		if (rowCount<10 and x<endAngle-1):
			print (",", end="")
		elif (x<endAngle-1):
			print ("\n\t.word ", end="")
			rowCount=0
	
	print("")
if __name__ == "__main__":
	main(sys.argv[1:])
	
