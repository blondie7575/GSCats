;
;  gscats
;
;  Created by Quinn Dunki on 7/9/17
;


.include "macros.s"
.include "equates.s"
.include "loader.s"

mainBank2:
	SYNCDBR

	BITS8
	lda #$f0
	sta TEXTCOLOR
	BITS16

	; Set up SCBs
	jsr initSCBs
	SHRVIDEO

	lda #basePalette
	sta PARAML0
	lda #0
	jsr setPalette
	
	ldx #$2222
	jsr colorFill

	jsr generateTerrain
	jsr renderTerrainColumns

	jsr kbdWait
	CLASSICVIDEO

	jml (proDOSLongJump)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdWait
; Waits for a keystroke
;
kbdWait:
	EMULATION

kbdWaitLoop:
	lda KBD
	bpl kbdWaitLoop
	sta KBDSTROBE

	NATIVE
	rts




basePalette:
	.word $0000,$0080,$0000,$000F,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


.include "graphics.s"
.include "terrain.s"
.include "trigTables.s"
endMainBank2:


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
