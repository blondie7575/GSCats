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

all: $(PGM)


$(PGM):
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -l$(PGM).lst $(PGM).s
	java -jar $(AC) -d $(PGM).2mg $(PGM)
	java -jar $(AC) -p $(PGM).2mg $(PGM) BIN 0x$(ADDR) < $(PGM)
	java -jar $(AC) -d $(PGM).2mg SPRITEBANK00
	java -jar $(AC) -p $(PGM).2mg SPRITEBANK00 BIN 0x0000 < Art/spritebank00.bin
	rm -f $(PGM)
	rm -f $(PGM).o
	osascript V2Make.scpt $(PROJECT_DIR) $(PGM)

clean:
	rm -f $(PGM)
	rm -f $(PGM).o
	rm ~/Library/Application\ Support/Sweet16/Disk\ Images/*

.PHONY: art
art:
	$(MRSPRITE) "Art/*.gif" $(PALETTE)
	mv Art/*.s Sprites
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -lspritebank.lst spritebank.s
	java -jar $(AC) -p $(PGM).2mg spritebank BIN 0x$(ADDR) < spritebank
	rm -f spritebank
	rm -f spritebank.o
