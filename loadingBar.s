;
;  loadingBar
;  A simple GUI element to show loading progress
;
;  Created by Quinn Dunki on 7/20/23
;

BORDER = $FF
BORDERL = $1F
BORDERR = $F1
FILL = $22
EMPTY = $ee


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; advanceLoadingBar
;
; A = Bytes to advance
;
; Trashes SCRATCHL
;
advanceLoadingBar:
	sta SCRATCHL
	lda currentLoadingBar+CBR_CURRENT
	clc
	adc SCRATCHL
	cmp currentLoadingBar+CBR_FINAL
	beq advanceLoadingBarDone
	bcs advanceLoadingBarClamp
	
advanceLoadingBarDone:
	sta currentLoadingBar+CBR_CURRENT
	rts

advanceLoadingBarClamp:
	lda currentLoadingBar+CBR_FINAL
	bra advanceLoadingBarDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderLoadingBar
;
; Not very fast
;
renderLoadingBar:
	SAVE_AXY
	ldy #0
	ldx currentLoadingBar+CBR_VRAM

	BITS8A
	lda #BORDERL				; Left border
	sta VRAMBANK,x
	sta VRAMBANK+160,x
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	sta VRAMBANK+160*7,x
	sta VRAMBANK+160*8,x
	sta VRAMBANK+160*9,x
	sta VRAMBANK+160*10,x
	sta VRAMBANK+160*11,x
	sta VRAMBANK+160*12,x
	sta VRAMBANK+160*13,x
	sta VRAMBANK+160*14,x
	sta VRAMBANK+160*15,x
	inx
renderLoadingBarLoop:
	lda #BORDER
	sta VRAMBANK,x			; Top border
	sta VRAMBANK+160*15,x	; Bottom border

	cpy currentLoadingBar+CBR_CURRENT
	bcc renderLoadingBarFillReady
	jmp renderLoadingBarEmpty

renderLoadingBarFillReady:
	lda #FILL

renderLoadingBarFill:
	sta VRAMBANK+160*1,x 	; Bar
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	sta VRAMBANK+160*7,x 	; Bar
	sta VRAMBANK+160*8,x
	sta VRAMBANK+160*9,x
	sta VRAMBANK+160*10,x
	sta VRAMBANK+160*11,x
	sta VRAMBANK+160*12,x
	sta VRAMBANK+160*13,x
	sta VRAMBANK+160*14,x
	inx
	iny
	cpy currentLoadingBar+CBR_FINAL
	bne renderLoadingBarLoop

	lda #BORDERR				; Right border
	sta VRAMBANK,x
	sta VRAMBANK+160,x
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	sta VRAMBANK+160*7,x
	sta VRAMBANK+160*8,x
	sta VRAMBANK+160*9,x
	sta VRAMBANK+160*10,x
	sta VRAMBANK+160*11,x
	sta VRAMBANK+160*12,x
	sta VRAMBANK+160*13,x
	sta VRAMBANK+160*14,x
	sta VRAMBANK+160*15,x

	BITS16
	RESTORE_AXY
	rts

renderLoadingBarEmpty:
	.a8
	lda #EMPTY
	jmp renderLoadingBarFill

CBR_ACTIVE = 0
CBR_CURRENT = 2
CBR_FINAL = 4
CBR_VRAM = 6


currentLoadingBar:
	.word	0		; Active
	.word	0		; Current progress in bytes
	.word	57		; Final progress in bytes
	.word	$5eb4	; VRAM position (top left)


