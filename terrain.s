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
MAXSPANSPERROW = 15


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
	lda #$5f1f			; 4   Point stack to end of VRAM
	tcs					; 2

	sec
	lda #compiledTerrainEnd-VISIBLETERRAINWINDOW-3
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
	cmp #MAXTERRAINHEIGHT
	beq renderTerrainDone
	sta SCRATCHL2
	bra renderTerrainLoop

renderTerrainDone:
	SLOWGRAPHICS
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainSpans:
;
;
renderTerrainSpans:
	pha
	lda #MAXTERRAINHEIGHT-1;-7;-36

renderTerrainSpansLoop:
	sta PARAML1
	jsr renderTerrainRowSpans
	dec
	bpl renderTerrainSpansLoop
;brk
	pla
	rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainRowSpans:
;
; PARAML1 = Row index (bottom relative)
;
; Trashes SCRATCHL,SCRATCHL2,PARAML0
;
renderTerrainRowSpans:
	SAVE_AXY

	; Find row data
	lda PARAML1
	asl		; Shifts must match MAXSPANSPERROW*2 + 2
	asl
	asl
	asl
	asl
	tay
	lda terrainSpanData,y
	sta SCRATCHL			; Track span color

	; Find VRAM row
	lda #200
	sec
	sbc PARAML1
	tax
	jsr enableFillMode
	asl
	tax
	lda vramYOffset,x
	clc
	adc #$2000
	tax
	adc #160
	sta PARAML0				; Watch for end of VRAM row

	; Find span that intersects left logical edge
	lda #0
	clc

renderTerrainRowSpansFindLeftLoop:
	adc terrainSpanData+2,y
	cmp leftScreenEdge
	bpl renderTerrainRowSpansFoundLeft
	iny
	iny
	pha
	lda SCRATCHL
	eor #%110000	; Toggle span color cache
	sta SCRATCHL
	pla
	bra renderTerrainRowSpansFindLeftLoop

renderTerrainRowSpansFoundLeft:
	sec
	sbc leftScreenEdge	; A now holds remainder of leftmost span
						; and Y points to leftmost span

renderTerrainRowSpansLoop:
	sta SCRATCHL2

	; Set fill mode byte for this span
	lda SCRATCHL
	sta VRAMBANK,x

	; Advance to end of span
	clc
	txa
	adc SCRATCHL2
	cmp PARAML0
	bpl renderTerrainRowSpansDone
	tax

	; Prepare for next span
	iny
	iny
	lda SCRATCHL
	eor #%110000	; Toggle span color cache
	sta SCRATCHL

	lda terrainSpanData+2,y
	bra renderTerrainRowSpansLoop

renderTerrainRowSpansDone:
	RESTORE_AXY
	rts



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainFillMode:
;
; Trashes all registers
;
renderTerrainFillMode:
	jsr renderTerrainSpans
	brk

	SAVE_AXY
	ldy #0
	ldx #200-MAXTERRAINHEIGHT

renderTerrainFillModeLoop:
	jsr enableFillMode
	sty PARAML1
	jsr renderTerrainRowFillMode
	inx
	iny
	cpy #MAXTERRAINHEIGHT
	bmi renderTerrainFillModeLoop
renderTerrainFillModeDone:
brk
	RESTORE_AXY
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderTerrainRowFillMode:
;
; PARAML1 = Row index (top relative)
;
; Trashes PARAML1
;
renderTerrainRowFillMode:
	SAVE_AXY
	lda PARAML1
	asl
	tay
	ldx vramYOffset,y

	stz renderTerrainRowFillCurrent

	sec
	lda #MAXTERRAINHEIGHT
	sbc PARAML1
	sta PARAML1

	ldy leftScreenEdge
	sty renderTerrainRowFillColumn

renderTerrainRowFillModeColumnLoop:
	tya
	asl
	tay

	lda terrainData,y
	cmp PARAML1
	bmi renderTerrainRowFillModeBlack

	lda renderTerrainRowFillCurrent
	cmp #$10
	beq renderTerrainRowFillModeColumnLoopNext

	lda #$10
	sta renderTerrainRowFillCurrent
	sta VRAM+(200-MAXTERRAINHEIGHT)*160,x

renderTerrainRowFillModeColumnLoopNext:
	inx
	inc renderTerrainRowFillColumn
	ldy renderTerrainRowFillColumn
	cpy rightScreenEdge
	bne renderTerrainRowFillModeColumnLoop

renderTerrainRowFillModeDone:
	RESTORE_AXY
	rts

renderTerrainRowFillModeBlack:
	lda renderTerrainRowFillCurrent
	cmp #$70
	beq renderTerrainRowFillModeColumnLoopNext

	lda #$70
	sta renderTerrainRowFillCurrent
	sta VRAM+(200-MAXTERRAINHEIGHT)*160,x
	bra renderTerrainRowFillModeColumnLoopNext

renderTerrainRowFillCurrent:
	.word 0
renderTerrainRowFillColumn:
	.word 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; craterTerrain
;
; PARAML0 = X pos of center in pixels from logical left terrain edge
; PARAML1 = Y pos of center in pixels from bottom terrain edge
; Y = Radius of circle, in pixels
;
; Trashes SCRATCHL
craterTerrain:
	SAVE_AX

	lda #TERRAINWIDTH		; Convert X pos to terrain-right byte count
	sec
	sbc PARAML0
	sty SCRATCHL			; Center width in bytes
	sbc SCRATCHL
	and #$fffe				; Force even
	clc
	adc #terrainData
	sta PARAML0

	lda circleTable,y		; Look up circle data
	sta SCRATCHL

	tya						; Iterate over diameter
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
	jsr compileTerrainSpans
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
; compileTerrainSpans:
;
;
compileTerrainSpans:
	pha
	lda #0; MAXTERRAINHEIGHT-7;  0

compileTerrainSpansLoop:
	sta PARAML1
	jsr compileTerrainSpansRow
	lda PARAML1
	inc
	cmp #MAXTERRAINHEIGHT
	bne compileTerrainSpansLoop

	pla
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compileTerrainSpansRow:
;
; PARAML1 = Row index (bottom relative)
;
; Trashes SCRATCHL
;
compileTerrainSpansRow:
	SAVE_AXY

	lda PARAML1
	asl		; Shifts must match MAXSPANSPERROW*2 + 2
	asl
	asl
	asl
	asl
	clc
	adc #terrainSpanData
	sta SCRATCHL

	ldy #0
	ldx #TERRAINWIDTH-2

	lda terrainData,x	; Figure out start value for row
	cmp PARAML1
	bcs compileTerrainSpansRowInitGreen

compileTerrainSpansRowInitBlack:
	lda #$0020		; First span is black
	sta (SCRATCHL)	; Initialize the row
	inc SCRATCHL
	inc SCRATCHL
	ldy #-1

compileTerrainSpansRowBlackStart:
	iny

compileTerrainSpansRowBlackLoop:
	lda terrainData,x
	cmp PARAML1
	bcs compileTerrainSpansBlackEnd
	dex
	dex
	iny
	cpx #-2
	bne compileTerrainSpansRowBlackLoop

compileTerrainSpansBlackEnd:
BREAK
	tya				; Store this span's length
	sta (SCRATCHL)
	inc SCRATCHL
	inc SCRATCHL

	dex				; Begin searching for next span
	dex
	cpx #0
	bmi compileTerrainSpansRowDone
	ldy #0
	bra compileTerrainSpansRowGreenStart

compileTerrainSpansRowDone:
	RESTORE_AXY
	rts

compileTerrainSpansRowInitGreen:
	lda #$0010		; First span is green
	sta (SCRATCHL)	; Initialize the row
	inc SCRATCHL
	inc SCRATCHL
	ldy #-1

compileTerrainSpansRowGreenStart:
	iny

compileTerrainSpansRowGreenLoop:
	lda terrainData,x
	cmp PARAML1
	bcc compileTerrainSpansGreenEnd
	dex
	dex
	iny
	cpx #-2
	bne compileTerrainSpansRowGreenLoop

compileTerrainSpansGreenEnd:
;	iny

;	lda #1								;
;	sta breakpoint	;

	tya				; Store this span's length
	sta (SCRATCHL)
	inc SCRATCHL
	inc SCRATCHL

	dex				; Begin searching for next span
	dex
	cpx #0
	bmi compileTerrainSpansRowDone
	ldy #0
	bra compileTerrainSpansRowBlackStart

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



; Terrain data, stored as height values 2 pixels wide (bytes)

terrainData:
	.repeat TERRAINWIDTH/2
	.word 0
	.endrepeat
terrainDataEnd:

compiledTerrain:
	.repeat COMPILEDTERRAINROW * MAXTERRAINHEIGHT
	.byte 0
	.endrepeat
compiledTerrainEnd:

clippedTerrainData:
	.repeat MAXTERRAINHEIGHT
	.byte 0,0,0,0	; xx,jmp,addr
	.endrepeat

terrainSpanData:
	.repeat MAXTERRAINHEIGHT
		.word 0		; Start value (0=BG)
		.repeat MAXSPANSPERROW
		.word 0		; Length (in bytes)
		.endrepeat
	.endrepeat

