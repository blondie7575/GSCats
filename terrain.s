;
;  terrain
;
;  Created by Quinn Dunki on 7/29/17
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrain
;
; No stack operations permitted here!
;
; Trashes all registers
;
renderTerrain:
	FASTGRAPHICS
	lda #0
	sta SCRATCHL2		; Row counter
	lda #$5f1f			; 4   Point stack to end of affected VRAM
	tcs					; 2

	sec
	lda #compiledTerrainEnd-VISIBLETERRAINWINDOW-4
	sbc mapScrollPos
	sta PARAML0

renderTerrainLoop:
	; Note that DP register is normally $0000, so that is used as the BG/BG case
	lda #$0011		; BG/FG
	ldx #$1111		; FG/FG
	ldy #$1100		; FG/BG
	jmp (PARAML0)

renderRowComplete:

	lda PARAML0
	sec
	sbc #COMPILEDTERRAINROW
	sta PARAML0

	tsc
	clc
	adc #320
	tcs

	lda SCRATCHL2
	inc
	cmp lastCompiledTerrainY
	beq	renderRowCont
	bcs renderTerrainDone

renderRowCont:
	sta SCRATCHL2
	bra renderTerrainLoop

renderTerrainDone:
	SLOWGRAPHICS
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; craterTerrain
;
; PARAML0 = X pos of center in pixels from logical left terrain edge
; PARAML1 = Y pos of center in pixels from bottom terrain edge
; Y = Radius of circle, in pixels (minimum is 3)
;
; Trashes SCRATCHL
craterTerrain:
	SAVE_AX

	lda #TERRAINWIDTH		; Convert X pos to terrain-right byte count
	sec
	sbc PARAML0
	sty SCRATCHL			; Center width in bytes
	sbc SCRATCHL
	sbc SCRATCHL
	and #$fffe				; Force even
	clc
	adc #terrainData
	sta PARAML0

	tya
	asl
	tay
	lda circleTable,y		; Look up circle data
	sta SCRATCHL

	tya						; Iterate over diameter words
	asl
	tay

craterTerrainLoop:
	dey
	dey
	bmi craterTerrainDone

	tya
	clc
	adc PARAML0				; Clip to terrain edges
	cmp #terrainData
	bmi craterTerrainDone
	cmp #terrainDataEnd
	bpl craterTerrainLoop

	lda (SCRATCHL),y		; Fetch circle Y value
	clc
	adc PARAML1				; Convert to terrain-space
	bmi craterTerrainZero
	sta SCRATCHL2
	lda (PARAML0),y
	cmp SCRATCHL2
	bmi craterTerrainLoop

	lda SCRATCHL2			; Circle value is lower, so use that
	sta (PARAML0),y
	bra craterTerrainLoop

craterTerrainZero:			; Circle went negative so clip to 0
	lda #0
	sta (PARAML0),y
	bra craterTerrainLoop

craterTerrainDone:
	lda #1
	sta terrainDirty

	RESTORE_AX
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; clipTerrain
;
; Saves the compiled terrain data that we overwrite into
; a buffer at $E04000. We do this by shadowing the stack
; to that area and pushing.
;
clipTerrain:
	SAVE_AXY

	; Shadow stack into $E04000 to save clipped data fast
	tsc
	sta STACKPTR
	lda #CLIPPEDTERRAINSTACK
	tcs

	sec
	lda #COMPILEDTERRAINROW*MAXTERRAINHEIGHT-4
	sbc mapScrollPos
	tay

	ldx #0

clipTerrainLoop:
	lda	compiledTerrain,y
	pha
	lda #$4cea		; NOP followed by JMP
	sta compiledTerrain,y

	iny
	iny
	lda	compiledTerrain,y
	pha

	lda #renderRowComplete
	sta compiledTerrain,y

	tya
	sec
	sbc #COMPILEDTERRAINROW+2
	tay

	inx
	cpx lastCompiledTerrainY
	bcc clipTerrainLoop
	beq clipTerrainLoop

	; Put stack back where it belongs
	tsc
	sta clippedTerrainStackPtr
	lda STACKPTR
	tcs

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; unclipTerrain
;
; Restores the compiled terrain data that we wrote
; to a buffer at $E04000. We do this by mapping the stack
; to $4000, then using stack-relative addressing to pull the data.
; We can't pop the data because it's all stored in reverse.
;
; On first move-left unclip every second row is unclipped incorrectly
unclipTerrain:
	SAVE_AXY

	phd
	lda #(CLIPPEDTERRAINSTACK & $f000)
	pha
	pld		; Point direct page at our clip data

	sec
	lda #COMPILEDTERRAINROW*MAXTERRAINHEIGHT-4
	sbc mapScrollPos
	tay

	sec							; Find stopping point for stack-relative addressing
	lda clippedTerrainStackPtr
	and #$0fff
	sbc #7						; 4 bytes past top of stack, +3 for starting offset
	sta STACKPTR

	lda #$0fff-3	; Start at the bottom of the stack
	tax

unclipTerrainLoop:
	lda	2,x
	sta compiledTerrain,y
	iny
	iny

	lda 0,x
	sta compiledTerrain,y

	tya
	sec
	sbc #COMPILEDTERRAINROW+2
	tay

	dex						; Walk up the stack to reverse the data
	dex
	dex
	dex
	cpx STACKPTR  ;#$e6f-7 ;$1000		; When x hits the top of the stack, we're done
	bne unclipTerrainLoop

	pld

	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrain
;
;
;
compileTerrain:
	SAVE_AY

	ldy #0
	lda #compiledTerrain
	sta PARAML0

compileTerrainLoop:
	sty PARAML1
	jsr compileTerrainRow
	iny
	cpy #MAXTERRAINHEIGHT
	beq compileTerrainDone

	clc
	lda #COMPILEDTERRAINROW
	adc PARAML0
	sta PARAML0

	bra compileTerrainLoop

compileTerrainDone:
	;jsl compileTerrainSpans	; Part of the now disabled fill-mode renderer
	RESTORE_AY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrainRow
;
; PARAML0 = Start of compiled row data
; PARAML1 = Row index
;
; Note: DA = PHX = FG/FG
;       48 = PHA = FG/BG
;		5A = PHY = BG/FG
;		0B = PHD = BG/BG

compileTerrainRow:
	SAVE_AXY
	ldy #0
	ldx #0

compileTerrainColumnLoop:
	stz compileTerrainOpcode

	; Check column 0
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn0BG
	beq compileTerrainColumn0BG

	; Column 0 is FG, so check column 1
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn1BG
	beq compileTerrainColumn1BG

	; Columns 0 and 1 are FG/FG, so PHX
	lda #$00da

compileTerrainColumn2:
	sta compileTerrainOpcode	; Cache results so far

	; Check column 2
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn2BG
	beq compileTerrainColumn2BG

	; Column 2 is FG, so check column 3
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn3BG
	beq compileTerrainColumn3BG

	; Columns 2 and 3 are FG/FG, so PHX
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

compileTerrainColumn0BG:

	; Column 0 is BG, so check column 1
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn01BG
	beq compileTerrainColumn01BG

	; Columns 0 and 1 are BG/FG, so PHA
	lda #$0048
	bra compileTerrainColumn2

compileTerrainColumn01BG:

	; Columns 0 and 1 are BG/BG, so PHD
	lda #$000b
	bra compileTerrainColumn2

compileTerrainColumn1BG:

	; Columns 0 and 1 are FG/BG, so PHY
	lda #$005a
	bra compileTerrainColumn2

compileTerrainColumn2BG:

	; Column 2 is BG, so check column 3
	inx
	inx
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainColumn23BG
	beq compileTerrainColumn23BG

	; Columns 2 and 3 are BG/FG, so PHA
	lda compileTerrainOpcode
	ora #$4800
	bra compileTerrainColumnStore

compileTerrainColumn23BG:

	; Columns 2 and 3 are BG, so PHD
	lda compileTerrainOpcode
	ora #$0b00
	bra compileTerrainColumnStore

compileTerrainColumn3BG:

	; Columns 2 and 3 are FG/BG, so PHY
	lda compileTerrainOpcode
	ora #$5a00
	bra compileTerrainColumnStore

compileTerrainOpcode:
	.word 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; prepareRowRendering:
;
; Set SCBs to match rendering mode of each terrain line
;
; Trashes SCRATCHL, SCRATCHL2
;
prepareRowRendering:
	SAVE_AXY

	ldx #199
	stz SCRATCHL2
	stz lastCompiledTerrainY

prepareRowRenderingLoop:
	lda #0
	PLAYERPTR_Y
	sec
	lda playerData+GO_POSY,y
	sbc #GAMEOBJECTHEIGHT

;	cmp SCRATCHL2
;	bcc prepareRowRenderingCompileMode
;	beq prepareRowRenderingCompileMode

;	jsr enableFillMode
;	bra prepareRowRenderingLoopNext

prepareRowRenderingCompileMode:
	jsr disableFillMode
	inc lastCompiledTerrainY

prepareRowRenderingLoopNext:
	inc SCRATCHL2
	dex
	cpx #200-MAXTERRAINHEIGHT
	bne prepareRowRenderingLoop

prepareRowRenderingDone:
;HARDBRK
	RESTORE_AXY
	rts


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

	txa
	and #$03ff
	tax

	cpy #TERRAINWIDTH
	bne generateTerrainLoop

;	lda #1					; Debug values
;	sta terrainData
;	lda #2
;	sta compiledTerrain-4
	rts
	

compiledTerrain:
	.repeat COMPILEDTERRAINROW * MAXTERRAINHEIGHT
	.byte $42
	.endrepeat
compiledTerrainEnd:

clippedTerrainStackPtr:
	.word 0

