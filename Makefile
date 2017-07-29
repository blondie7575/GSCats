#
#  Makefile
#  GS Cats
#
#  Created by Quinn Dunki on 7/14/15.
#  One Girl, One Laptop Productions
#  http://www.quinndunki.com
#  http://www.quinndunki.com/blondihacks
#


CL65=cl65
AC=AppleCommander.jar
ADDR=800

PGM=gscats

all: $(PGM)


$(PGM):
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -l$(PGM).lst $(PGM).s
	java -jar $(AC) -d $(PGM).2mg $(PGM)
	java -jar $(AC) -p $(PGM).2mg $(PGM) BIN 0x$(ADDR) < $(PGM)
	cp $(PGM).2mg ~/Library/Application\ Support/Sweet16/Disk\ Images
	rm -f $(PGM)
	rm -f $(PGM).o
	osascript V2Make.scpt $(PROJECT_DIR) $(PGM)

clean:
	rm -f $(PGM)
	rm -f $(PGM).o
	rm ~/Library/Application\ Support/Sweet16/Disk\ Images/*


