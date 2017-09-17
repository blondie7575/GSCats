#!/usr/bin/env python3

import sys
import math

def main(argv):
	
	minRadius = 3
	maxRadius = 20
	
	print ("circleTable:\t\t;-Y for each X, in bytes")
	
	for radius in range(0,maxRadius+1):
		if radius < minRadius:
			print ("\t.addr 0")
		else:
			print ("\t.addr circleTable%d" % radius)
	
	print()

	for radius in range(minRadius,maxRadius+1):
		
		print ("circleTable%d:" % radius)
		print ("\t.word ",end="")
		byteR = radius*2
		
		skipMinus1 = 0
		for p in range(0,radius):
			x = (radius-p)*2
			y = (int)(math.sqrt(byteR*byteR - x*x))
			if p==radius-1:			# A fudge to make circles close better
				y = byteR
			y*=-1		# Because X=bytes and we need -Y
			print (y, end=",")

		skipMinus1 = 0
		for p in range(0,radius):
			x = (p+1)*2
			y = (int)(math.sqrt(byteR*byteR - x*x))
			if p==0:				# A fudge to make circles close better
				y = byteR
			
			y*=-1		# Because X=bytes and we need -Y
			if p==radius-1:
				print(y)
			else:
				print (y, end=",")

if __name__ == "__main__":
	main(sys.argv[1:])
