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
	jsr compileTerrain
	jsr clipTerrain

	ldy #0
	jsr renderPlayerHeader

mainGameLoop:

	jsr syncVBL

	jsr renderTerrain
	jsr kbdScan

	lda mapScrollRequested
	bpl scrollMap

	lda angleDeltaRequested
	bne changeAngle

	lda #gameobjectData
	sta PARAML0
	jsr renderGameobject

	lda quitRequested
	beq mainGameLoop

quit:
	CLASSICVIDEO
	jml (proDOSLongJump)

scrollMap:
	jsr unclipTerrain

	sta mapScrollPos
	asl
	sta leftScreenEdge

	jsr clipTerrain
	lda #$ffff
	sta mapScrollRequested
	jmp mainGameLoop

changeAngle:
	ldy #0
	tax
	jsr playerDeltaAngle

	ldy #0
	jsr renderPlayerHeader

	stz angleDeltaRequested
	jmp mainGameLoop

reverseScroll:
	lda scrollV
	eor #$ffff
	inc
	sta scrollV
	jmp mainGameLoop

scrollV:
	.word 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; kbdScan
; Processes keyboard input
;
; Trashes A
;

kbdScan:
	EMULATION

kbdScanLoop:
	lda KBD
	bpl kbdScanDone
	sta KBDSTROBE

	cmp #(8 + $80)
	beq kbdScanLeftArrow
	cmp #(21 + $80)
	beq kbdScanRightArrow
	cmp #(' ' + $80)
	beq kbdScanSpace
	cmp #('a' + $80)
	beq kbdScanA
	cmp #('z' + $80)
	beq kbdScanZ

kbdScanDone:
	NATIVE
	rts

kbdScanRightArrow:
	NATIVE
	lda mapScrollPos
	cmp #VISIBLETERRAINWIDTH-VISIBLETERRAINWINDOW
	beq kbdScanDone
	inc
	inc
	sta mapScrollRequested
	rts

kbdScanLeftArrow:
	NATIVE
	lda mapScrollPos
	beq kbdScanDone
	dec
	dec
	sta mapScrollRequested
	rts

kbdScanSpace:
	NATIVE
	lda #1
	sta quitRequested
	rts

kbdScanA:
	NATIVE
	lda #1
	sta angleDeltaRequested
	rts

kbdScanZ:
	NATIVE
	lda #-1
	sta angleDeltaRequested
	rts



basePalette:
	.word $0000,$0080,$0000,$000F,$0FFF,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0FFF
quitRequested:
	.word $0000
mapScrollRequested:
	.word $FFFF
angleDeltaRequested:
	.word $0000


; Position of map viewing window. Can be visualized in two ways:
; a) Word-distance from right edge of terrain data (which is in memory right-to-left) to left edge of visible screen
; b) Word-distance from left edge of logical terrain to left edge of visible screen
mapScrollPos:
	.word 0
leftScreenEdge:
	.word 0		; In pixels

.include "graphics.s"
.include "font.s"
.include "terrain.s"
.include "gameobject.s"
.include "player.s"
.include "utility.s"
.include "tables.s"
endMainBank2:


; Suppress some linker warnings - Must be the last thing in the file
; This is because Quinn doesn't really know how to use ca65 properly
.SEGMENT "ZPSAVE"
.SEGMENT "EXEHDR"
.SEGMENT "STARTUP"
.SEGMENT "INIT"
.SEGMENT "LOWCODE"
