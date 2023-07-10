#
#  Makefile
#  GS Cats
#
#  Created by Quinn Dunki on 7/14/15.
#  One Girl, One Laptop Productions
#  http://www.blondihacks.com
#


CL65=cl65
CAD=./cadius
VOLNAME=GSAPP
IMG=DiskImageParts
EMU=/Applications/GSplus.app/Contents/MacOS/gsplus
ADDR=0800
CODEBANK=CODEBANK\#060000
CODEBANKE1=CODEBANKE1\#060800
EXEC=$(PGM)\#06$(ADDR)
SOUNDBANK=SOUNDBANK\#060000
FONTBANK=FONTBANK\#060000

PGM=gscats
MRSPRITE=../MrSprite/mrsprite
GENART=Art/Generated
GENSOUND=Sound/Generated
CHROMA=a4dffb
PALETTE=a4dffb a4dffb 008800 886611 cc9933 eebb44 dd6666 ff99aa 777777 ff0000 b7b7b7 dddddd 0077bb ffff00 000000 ffffff
SPRITES=SpriteBank
SPRITEBANK=$(SPRITES)\#060000
FLIPLIST=$(wildcard Art/*Fan.gif) $(wildcard Art/*Spit*.gif)
REMOTESYMBOLS=-Wl $(shell ./ParseMapFile.py *.map)

all: clean diskimage terrain_e1 $(PGM) loader emulate

emulate:
	# Leading hypen needed because GSPlus maddeningly returns code 1 (error) always and for no reason
	-/Applications/GSplus.app/Contents/MacOS/gsplus
	
diskimage:
	$(CAD) CREATEVOLUME $(PGM).2mg $(VOLNAME) 800KB
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(IMG)/BITSY.BOOT/BITSY.BOOT#FF2000
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(IMG)/QUIT.SYSTEM/QUIT.SYSTEM#FF2000
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(IMG)/PRODOS/PRODOS#FF0000
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(IMG)/BASIC.SYSTEM/BASIC.SYSTEM#FF2000
		
$(PGM):
	@echo $(REMOTESYMBOLS)
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh -C linkerConfig --cpu 65816 --start-addr 0000 -l$(PGM).lst $(REMOTESYMBOLS) $(PGM).s -o $(CODEBANK)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(CODEBANK)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(SPRITEBANK)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(SOUNDBANK)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(FONTBANK)

	rm -f $(CODEBANK)
	rm -f $(PGM).o
	rm -f terrain_e1.map

loader:
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr $(ADDR) -lloader.lst loader.s -o $(EXEC)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(EXEC)
	rm -f $(EXEC)
	rm -f loader.o

terrain_e1:
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh -C linkerConfig --cpu 65816 --start-addr $(ADDR) -l -vm -m terrain_e1.map terrain_e1.s -o $(CODEBANKE1)
	$(CAD) ADDFILE $(PGM).2mg /$(VOLNAME) $(CODEBANKE1)
	rm -f $(CODEBANKE1)
	rm -f terrain_e1.o

clean:
	rm -f $(PGM)
	rm -f $(PGM).o
	rm -f loader
	rm -f loader.o
	rm -f terrain_e1.o
	rm -f terrain_e1.map
	rm -f terrain_e1
	rm -f Art/*m.gif
	rm -f $(GENART)/*
	rm -f $(PGM).2mg
	
.PHONY: art
art:
	rm -f $(GENART)/*
	for gif in $(FLIPLIST); do $(MRSPRITE) MIRROR "$$gif" $(CHROMA); done
	./RenumberSpriteFiles.sh
	$(MRSPRITE) CODE $(GENART)"/*.gif" $(CHROMA) $(PALETTE)
	$(MRSPRITE) BANK $(GENART)"/*.txt" $(SPRITES)
#	$(MRSPRITE) WALLPAPER "Art/*.gif" $(CHROMA) ff0000
	mv $(GENART)/$(SPRITES)00.bin ./$(SPRITEBANK)
	./MerlinToCA65.sh $(GENART)/$(SPRITES)Src.txt > spritebank.s
	rm $(GENART)/*.txt
	rm -f Art/*m.gif

.PHONY: sound
sound:
	rm -f $(GENSOUND)/*
	./GenerateSoundBank.sh Sound/CatHowl.wav 11264 Sound/Meow1.wav 5513 Sound/Meow2.wav 5513 Sound/Meow3.wav 5513 Sound/Meow4.wav 5513
	rm -f $(GENSOUND)/*

.PHONY: fonts
fonts:
	rm -rf $(FONTBANK)
	./CompileFont.py > font8x8.s
	@PATH=$(PATH):/usr/local/bin; $(CL65) -t apple2enh --cpu 65816 --start-addr 0000 -lfonts.lst fontEngine.s -o $(FONTBANK)
	rm -f fontEngine.o
	
