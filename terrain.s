;
;  terrain
;
;  Created by Quinn Dunki on 7/29/17
;


TERRAINWIDTH = 640		; In pixels
MAXTERRAINHEIGHT = 100	; In pixels
COMPILEDTERRAINROW = TERRAINWIDTH/4+3	; In words, +2 to make room for clipping jump at end of row
VISIBLETERRAINWIDTH = TERRAINWIDTH/4	; In words- width minus jump return padding
VISIBLETERRAINWINDOW = 80				; In words

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrain
;
; No stack operations permitted here!
;
; Current implementation: X cycles per row
; Trashes all registers
;
renderTerrain:
	FASTGRAPHICS
	ldy #MAXTERRAINHEIGHT
	lda #$9cff			; 4   Point stack to end of VRAM
	tcs					; 2

	sec
	lda #compiledTerrainEnd-VISIBLETERRAINWINDOW-3
	sbc mapScrollPos
	sta PARAML0

renderTerrainLoop:
	lda #$0000		; Background
	ldx #$1111		; Foreground
	jmp (PARAML0)

renderRowComplete:
	lda PARAML0
	sec
	sbc #COMPILEDTERRAINROW
	sta PARAML0
	dey
	bne renderTerrainLoop

	SLOWGRAPHICS
	rts


renderSpanCompleteAlt:
renderSpanComplete:
	rts
CURRMAPPIXELS = $06


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; clipTerrain
;
;
clipTerrain:
	SAVE_AXY

	sec
	lda #COMPILEDTERRAINROW*MAXTERRAINHEIGHT-3
	sbc mapScrollPos
	tay
	ldx #MAXTERRAINHEIGHT

clipTerrainLoop:
	clc		; Compute buffer to for saved data
	txa
	asl
	asl
	adc #clippedTerrainData-4
	sta PARAML0

	lda	compiledTerrain,y
	sta (PARAML0)	; Preserve data we're overwriting
	inc PARAML0
	inc PARAML0

	and #$ff00
	ora #$004c	; jmp in low byte
	sta compiledTerrain,y
	iny

	lda	compiledTerrain,y
	sta (PARAML0)	; Preserve data we're overwriting

	lda #renderRowComplete
	sta compiledTerrain,y

	tya
	sec
	sbc #COMPILEDTERRAINROW+1
	tay

	dex
	bne clipTerrainLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unclipTerrain
;
;
unclipTerrain:
	SAVE_AXY

	sec
	lda #COMPILEDTERRAINROW*MAXTERRAINHEIGHT-3
	sbc mapScrollPos
	tay
	ldx #MAXTERRAINHEIGHT

unclipTerrainLoop:
	clc		; Compute buffer that saved data is in
	txa
	asl
	asl
	adc #clippedTerrainData-4
	sta PARAML0

	lda	(PARAML0)
	sta compiledTerrain,y
	inc PARAML0
	inc PARAML0
	iny

	lda	(PARAML0)
	sta compiledTerrain,y

	tya
	sec
	sbc #COMPILEDTERRAINROW+1
	tay

	dex
	bne unclipTerrainLoop

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrain
;
;
;
compileTerrain:
	SAVE_AY

	ldy #MAXTERRAINHEIGHT-1
	lda #compiledTerrain
	sta PARAML0

compileTerrainLoop:
	sty PARAML1
	jsr compileTerrainRow
	dey
	bmi compileTerrainDone

	clc
	lda #COMPILEDTERRAINROW
	adc PARAML0
	sta PARAML0

	bra compileTerrainLoop

compileTerrainDone:
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrainRow
;
; PARAML0 = Start of compiled row data
; PARAML1 = Row index
;
compileTerrainRow:
	SAVE_AXY
	ldy #0
	ldx #0

compileTerrainColumnLoop:
	stz compileTerrainOpcode

	; Right half
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumnBGRight
	beq compileTerrainColumnBGRight
	lda #$00da
compileTerrainColumnLeft:
	sta compileTerrainOpcode
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumnBGLeft
	beq compileTerrainColumnBGLeft
	lda compileTerrainOpcode
	ora #$da00

compileTerrainColumnStore:
	sta (PARAML0),y
	inx
	inx
	iny
	iny
	cpy #VISIBLETERRAINWIDTH
	bne compileTerrainColumnLoop

	RESTORE_AXY
	rts

compileTerrainColumnBGRight:
	lda #$0048
	bra compileTerrainColumnLeft

compileTerrainColumnBGLeft:
	lda compileTerrainOpcode
	ora #$4800
	bra compileTerrainColumnStore

compileTerrainOpcode:
	.word 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; generateTerrain
;
; Trashes A and Y
;

generateTerrain:
	ldy #0
	lda #terrainData
	sta SCRATCHL

generateTerrainLoop:

	phy
	tya		; Pull an interesting value out of the sine table
	and #$00ff
	tay
	lda sineTable,y
	and #$004f
	ply

	sta (SCRATCHL),y
	sec
	lda #MAXTERRAINHEIGHT
	sbc (SCRATCHL),y
	sta (SCRATCHL),y
	iny
	iny
	cpy #TERRAINWIDTH/2
	bne generateTerrainLoop

	rts


.include "spanRender.s"

; Terrain data, stored as height values 4 pixels wide

terrainData:
	.word 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
	.word 20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39
	.word 40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21
	.word 20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,80
	.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,80

	.repeat TERRAINWIDTH/2
	.word 0
	.endrepeat

compiledTerrain:
	.repeat COMPILEDTERRAINROW * MAXTERRAINHEIGHT
	.byte 0
	.endrepeat
compiledTerrainEnd:

clippedTerrainData:
	.repeat MAXTERRAINHEIGHT
	.byte 0,0,0,0	; xx,jmp,addr
	.endrepeat

