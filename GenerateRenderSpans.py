#!/usr/bin/env python

import sys

def main(argv):

	# Prologue
	print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
	print "; spanRenderers"
	print ";"
	print "; Automatically generated by GenerateRenderSpans.py. Do not edit."
	print ";\nrenderSpanJumpTable:"
	print "\t.word $0000"
	
	for jump in range(0,80):
		print "\t.word renderSpan%d" % (jump+1)
	
	print "\n"

	for span in range(1,81):
		print "renderSpan%d:" % span
		print "\tldx CURRMAPPIXELS"
		bytes = "\t.byte "
		for byte in range(0,span-1):
			bytes += "$da,"
		bytes += "$da\n\tjmp renderSpanComplete\n"
		print bytes


	# Prologue
	print ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"
	print "; spanRenderersAlt"
	print ";"
	print "; Automatically generated by GenerateRenderSpans.py. Do not edit."
	print ";\nrenderSpanJumpTableAlt:"
	print "\t.word $0000"
	
	for jump in range(0,80):
		print "\t.word renderSpanAlt%d" % (jump+1)
	
	print "\n"


	for span in range(1,81):
		print "renderSpanAlt%d:" % span
		print "\tldx CURRMAPPIXELS"
		bytes = "\t.byte "
		for byte in range(0,span-1):
			bytes += "$da,"
		bytes += "$da\n\tjmp renderSpanCompleteAlt\n"
		print bytes

if __name__ == "__main__":
	main(sys.argv[1:])
	
