#!/usr/bin/env python3

import sys
import math

def main(argv):
	
	minRadius = 3
	maxRadius = 10
	
	print ("circleTable:\t\t;-Y for each X, in words")
	
	for radius in range(0,maxRadius+1):
		if radius < minRadius:
			print ("\t.addr 0")
		else:
			print ("\t.addr circleTable%d" % radius)
	
	print()

	for radius in range(minRadius,maxRadius+1):
		
		print ("circleTable%d:" % radius)
		print ("\t.word ",end="")
		
		skipMinus1 = 0
		for p in range(0,radius):
			x = radius-p
			y = (int)(math.sqrt(radius*radius - x*x))
			if p==radius-1:			# A fudge to make circles close better
				y = radius
			y*=-4		# Because X=words and we need -Y
			print (y, end=",")

		skipMinus1 = 0
		for p in range(0,radius):
			x = p+1
			y = (int)(math.sqrt(radius*radius - x*x))
			if p==0:				# A fudge to make circles close better
				y = radius
			
			y*=-4		# Because X=words and we need -Y
			if p==radius-1:
				print(y)
			else:
				print (y, end=",")

if __name__ == "__main__":
	main(sys.argv[1:])
