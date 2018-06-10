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
MRSPRITE=../MrSprite/mrsprite
CHROMA=a4dffb
PALETTE=a4dffb a4dffb 008800 886611 cc9933 eebb44 dd6666 ff99aa 777777 ff0000 b7b7b7 dddddd 0077bb ffff00 000000 ffffff
SPRITES=SpriteBank
REMOTESYMBOLS=-Wl $(shell ./ParseMapFile.py *.map)

all: terrain_e1 $(PGM) loader


$(PGM):
	@echo $(REMOTESYMBOLS)
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh -C linkerConfig --cpu 65816 --start-addr 0000 -l$(PGM).lst $(REMOTESYMBOLS) $(PGM).s
	java -jar $(AC) -d $(PGM).2mg CODEBANK
	java -jar $(AC) -p $(PGM).2mg CODEBANK BIN 0x0000 < $(PGM)
	java -jar $(AC) -d $(PGM).2mg $(SPRITES)00
	java -jar $(AC) -p $(PGM).2mg $(SPRITES)00 BIN 0x0000 < $(SPRITES)00.bin
	rm -f $(PGM)
	rm -f $(PGM).o
	rm -f terrain_e1.map
	osascript V2Make.scpt $(PROJECT_DIR) $(PGM)

loader:
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -lloader.lst loader.s
	java -jar $(AC) -d $(PGM).2mg $(PGM)
	java -jar $(AC) -p $(PGM).2mg $(PGM) BIN 0x$(ADDR) < loader
	rm -f loader
	rm -f loader.o

terrain_e1:
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh -C linkerConfig --cpu 65816 --start-addr $(ADDR) -l -vm -m terrain_e1.map terrain_e1.s
	java -jar $(AC) -d $(PGM).2mg CODEBANKE1
	java -jar $(AC) -p $(PGM).2mg CODEBANKE1 BIN 0x800 < terrain_e1
	rm -f terrain_e1
	rm -f terrain_e1.o

clean:
	rm -f $(PGM)
	rm -f $(PGM).o
	rm -f loader
	rm -f loader.o
	rm -f terrain_e1.o
	rm -f terrain_e1.map
	rm -f terrain_e1

.PHONY: art
art:
	$(MRSPRITE) CODE "Art/*.gif" $(CHROMA) $(PALETTE)
	$(MRSPRITE) BANK "Art/*.txt" $(SPRITES)
	mv Art/$(SPRITES)00.bin .
	./MerlinToCA65.sh Art/$(SPRITES)Src.txt > spritebank.s
	rm Art/*.txt
	java -jar $(AC) -d $(PGM).2mg $(SPRITES)00
	java -jar $(AC) -p $(PGM).2mg $(SPRITES)00 BIN 0x0000 < $(SPRITES)00.bin
