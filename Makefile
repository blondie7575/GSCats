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
PALETTE=00ff00 000000 ffff00 886611 cc9933 eebb44 dd6666 ff99aa 00ff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffff00 ffffff
SPRITES=SpriteBank

all: $(PGM) loader


$(PGM):
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr 0000 -l$(PGM).lst $(PGM).s
	java -jar $(AC) -d $(PGM).2mg CODEBANK
	java -jar $(AC) -p $(PGM).2mg CODEBANK BIN 0x0000 < $(PGM)
	java -jar $(AC) -d $(PGM).2mg $(SPRITES)00
	java -jar $(AC) -p $(PGM).2mg $(SPRITES)00 BIN 0x0000 < $(SPRITES)00.bin
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
	$(MRSPRITE) CODE "Art/*.gif" $(PALETTE)
	$(MRSPRITE) BANK "Art/*.txt" $(SPRITES)
	mv Art/$(SPRITES)00.bin .
	./MerlinToCA65.sh Art/$(SPRITES)Src.txt > spritebank.s
	rm Art/*.txt
	java -jar $(AC) -d $(PGM).2mg $(SPRITES)00
	java -jar $(AC) -p $(PGM).2mg $(SPRITES)00 BIN 0x0000 < $(SPRITES)00.bin
