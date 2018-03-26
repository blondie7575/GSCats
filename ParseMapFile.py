#!/usr/bin/env python3

# Outputs a list of exported symbols found in an ld65 link map file
# suitable for passing as a commandline option to define those
# same symbols in a cl65 compile/assemble operation. This allows
# sharing symbols between code banks without having to actually
# link them together. Sort of a low-budget DLL mechanism. :)

import sys


def parseInputFile(filename,bank):

	inputFile = open(filename)
	contents = inputFile.readlines()
	output = ""

	# Find exported symbols
	lineNum = 0
	for line in contents:
		if line.find("Exports list") != -1:
			break
		lineNum+=1

	# Found the exports table, so look for our symbol names
	first=1
	for line in contents[lineNum+1:]:
		if line.startswith("_") or line.startswith("-"):
			continue
		if line.startswith("Imports") or len(line)<2:
			break

		if first!=1:
			output += ","
		first = 0

		columns = line.split()
		if len(columns) > 3:
			output += ("-D,%s=0x%s,-D,%s=0x%s" % (columns[0],bank+columns[1][2:],columns[3],bank+columns[4][2:]))
		else:
			output += ("-D,%s=0x%s" % (columns[0],bank+columns[1][2:]))

	inputFile.close()
	return output


def main(argv):
	commandline = ""
	first=1

	for file in argv:

		if first!=1:
			commandline += ","
		first = 0

		bank = file[-6:-4]		# Assumes filename_XX.map
		commandline += parseInputFile(file,bank)

	print (commandline)


if __name__ == "__main__":
	main(sys.argv[1:])
