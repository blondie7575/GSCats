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
; Trashes everything
;

generateTerrain:
	ldy #0
	ldx #0
	lda #terrainData
	sta SCRATCHL

generateTerrainLoop:

	lda sineTable,x

	lsr
	lsr

	clc
	adc #30

	sta (SCRATCHL),y
	iny
	iny

	inx
	inx
	inx
	inx
	inx
	inx

	txa
	and #$03ff
	tax

	cpy #TERRAINWIDTH/2
	bne generateTerrainLoop

	lda #1
	sta terrainData
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; intersectRect
;
; A = non zero if rectangle is intersecting terrain
;
rectParams:
	.word 0		; x
	.word 0		; y	0=terrain bottom, +y=up
	.word 0		; w
	.word 0		; h

intersectRect:
	phy

	; Convert X to words and compute horizontal extent
	; Note that X counts from right terrain edge
	lda rectParams
	clc
	adc rectParams+4	; Reverse rect horizontally
	lsr					; Convert X to bytes
	and #$fffe			; Force even
	sta rectParams

	lda #TERRAINWIDTH/2	; Reverse X coordinate system
	sec
	sbc rectParams
	sta rectParams
	tay					; We'll need this later as an index into height data words

	lsr rectParams+4	; Convert width to bytes
	sec
	sbc rectParams+4	; Convert width to extent
	sta rectParams+4

	; Convert height to vertical extent
	lda rectParams+2
	sec
	sbc rectParams+6
	sta rectParams+6

	; Check Y bottom
intersectRectBottomLoop:
	lda terrainData,y
	cmp rectParams+6
	bpl intersectRectYep
	dey
	dey
	cpy rectParams+4
	bpl intersectRectBottomLoop

	lda #0
	ply
	rts

intersectRectYep:
	lda #1
	ply
	rts


; Terrain data, stored as height values 4 pixels wide

terrainData:
	.repeat TERRAINWIDTH/4  ; VISIBLETERRAINWIDTH
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

