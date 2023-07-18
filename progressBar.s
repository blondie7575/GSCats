;
;  progressBar
;  A simple GUI element to show progress
;
;  Created by Quinn Dunki on 7/17/23
;

BORDER = $FF
FILL = $99
EMPTY = $ee

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; createProgressBar
;
;
;
createProgressBar:
	lda #1
	sta currentProgressBar+CBR_ACTIVE
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; advanceProgressBar
;
; A = Bytes to advance
;
; Trashes SCRATCHL
;
advanceProgressBar:
	sta SCRATCHL
	lda currentProgressBar+CBR_CURRENT
	clc
	adc SCRATCHL
	cmp currentProgressBar+CBR_FINAL
	beq advanceProgressBarDone
	bcs advanceProgressBarClamp
	
advanceProgressBarDone:
	sta currentProgressBar+CBR_CURRENT
	rts

advanceProgressBarClamp:
	lda currentProgressBar+CBR_FINAL
	bra advanceProgressBarDone


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; setProgressBar
;
; A = New byte value
;
setProgressBar:
	sta currentProgressBar+CBR_CURRENT
	rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; renderProgressBar
;
; Not very fast
;
renderProgressBar:
	SAVE_AXY
	ldy #0
	ldx currentProgressBar+CBR_VRAM

	BITS8A
	lda #BORDER				; Left border
	sta VRAMBANK,x
	sta VRAMBANK+160,x
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	sta VRAMBANK+160*7,x
	inx
renderProgressBarLoop:
	lda #BORDER
	sta VRAMBANK,x			; Top border
	sta VRAMBANK+160*7,x	; Bottom border

	cpy currentProgressBar+CBR_CURRENT
	bcs renderProgressBarEmpty

	lda #FILL

renderProgressBarFill:
	sta VRAMBANK+160*1,x 	; Bar
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	
	inx
	iny
	cpy currentProgressBar+CBR_FINAL
	bne renderProgressBarLoop

	lda #BORDER				; Right border
	sta VRAMBANK,x
	sta VRAMBANK+160,x
	sta VRAMBANK+160*2,x
	sta VRAMBANK+160*3,x
	sta VRAMBANK+160*4,x
	sta VRAMBANK+160*5,x
	sta VRAMBANK+160*6,x
	sta VRAMBANK+160*7,x

	BITS16
	RESTORE_AXY
	rts

renderProgressBarEmpty:
	.a8
	lda #EMPTY
	bra renderProgressBarFill

CBR_ACTIVE = 0
CBR_CURRENT = 2
CBR_FINAL = 4
CBR_VRAM = 6


currentProgressBar:
	.word	0		; Active
	.word	1		; Current progress in bytes
	.word	25		; Final progress in bytes
	.word	$2117	; VRAM position (top left)


