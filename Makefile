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
MRSPRITE=../MrSprite/mrsprite CODE
PALETTE=00ff00 000000 ffff00 886611 cc9933 eebb44 dd6666 ff99aa 00ff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffffff

all: loader $(PGM)


$(PGM):
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr 0000 -l$(PGM).lst $(PGM).s
	java -jar $(AC) -d $(PGM).2mg CODEBANK
	java -jar $(AC) -p $(PGM).2mg CODEBANK BIN 0x0000 < $(PGM)
	java -jar $(AC) -d $(PGM).2mg SPRITEBANK00
	java -jar $(AC) -p $(PGM).2mg SPRITEBANK00 BIN 0x0000 < Art/spritebank00.bin
	rm -f $(PGM)
	rm -f $(PGM).o
	osascript V2Make.scpt $(PROJECT_DIR) $(PGM)

loader:
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -lloader.lst loader.s
	java -jar $(AC) -d $(PGM).2mg $(PGM)
	java -jar $(AC) -p $(PGM).2mg $(PGM) BIN 0x$(ADDR) < loader
	rm -f loader
	rm -f loader.o

clean:
	rm -f $(PGM)
	rm -f $(PGM).o
	rm -f loader
	rm -f loader.o

.PHONY: art
art:
	$(MRSPRITE) "Art/*.gif" $(PALETTE)
	mv Art/*.s Sprites
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -lspritebank.lst spritebank.s
	java -jar $(AC) -p $(PGM).2mg spritebank BIN 0x$(ADDR) < spritebank
	rm -f spritebank
	rm -f spritebank.o
